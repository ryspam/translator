//
//  TranslatorController.m
//  Translator
//
//  Created by Руслан on 16.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRMainController.h"
#import "TRTranslateCell.h"
#import "TRGoogleClient.h"

@interface TRMainController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    NSCharacterSet *_filterCharacters;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolbarOffset;

@end

@implementation TRMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    _filterCharacters = [[NSCharacterSet letterCharacterSet] invertedSet];
    [self registerForKeyboardNotifications];
    [[TRGoogleClient sharedInstance] translateEnWord:@"hello" completionHandler:^(NSString * _Nonnull word, NSError * _Nullable error) {
        NSLog(@"%@", word);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardWillShow:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize size = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [self animateToolbar:aNotification offset:size.height];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [self animateToolbar:aNotification offset:0];
}

- (void)animateToolbar:(NSNotification*)aNotification offset:(CGFloat)offset{
    NSDictionary* info = [aNotification userInfo];
    NSTimeInterval timeInterval = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.toolbarOffset.constant = offset;
    UIViewAnimationCurve curve = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;
    UIViewAnimationOptions opt = (UIViewAnimationOptions)curve << 16;
    [UIView animateWithDuration:timeInterval delay:0 options:opt animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideKeyboard{
    [self.view endEditing:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return ([string rangeOfCharacterFromSet:_filterCharacters].location == NSNotFound);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellTranslate";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    if([cell isKindOfClass:[TRTranslateCell class]]){
        [((TRTranslateCell*)cell) setWordPair:@"Hello"];
    }
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self hideKeyboard];
}
@end
