//
//  TRDataUpdater.m
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRDataUpdater.h"
#import "Reachability.h"
#import "TRGoogleClient.h"
#import "NSError+NoInternet.h"

@implementation TRDataUpdater{
    Reachability *_hostReachability;
}

+ (instancetype) sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super alloc] initInstance];
    });
    return sharedInstance;
}

- (instancetype) initInstance {
    self = [super init];
    return self;
}

- (void)start{
    [self update];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _hostReachability = [Reachability reachabilityWithHostName:[TRGoogleClient sharedInstance].apiBaseUrl];
    [_hostReachability startNotifier];
}

- (void)reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    if([curReach currentReachabilityStatus] != NotReachable){
        NSLog(@"Internet is reachable");
        [self update];
    }else{
        NSLog(@"Internet is not reachable");
    }
}

- (void)update{
    NSArray* wordsForLoading = [WordPair MR_findByAttribute:@"status" withValue:[NSNumber numberWithInt:WordPairStatus_LOADING]];
    for(WordPair *item in wordsForLoading){
        [self loadWordPair:item];
    }
}

- (void)loadWordPair:(WordPair* _Nonnull)item{
    [[TRGoogleClient sharedInstance] translateEnWord:item.original completionHandler:^(NSString * _Nullable word, NSError * _Nullable error) {
        if(error){
            if(!error.isNoInternet){
                item.status = [NSNumber numberWithInt:WordPairStatus_ERROR];
            }
        }else{
            item.translation = word;
            item.status = [NSNumber numberWithInt:WordPairStatus_TRANSLATED];
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
    }];
}
@end
