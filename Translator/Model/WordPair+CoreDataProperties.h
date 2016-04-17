//
//  WordPair+CoreDataProperties.h
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WordPair.h"

NS_ASSUME_NONNULL_BEGIN

@interface WordPair (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *original;
@property (nullable, nonatomic, retain) NSString *translation;
@property (nullable, nonatomic, retain) NSNumber *idkey;
@property (nullable, nonatomic, retain) NSNumber *status;

@end

NS_ASSUME_NONNULL_END
