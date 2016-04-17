//
//  TRTranslateCell.m
//  Translator
//
//  Created by Руслан on 16.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRTranslateCell.h"

@implementation TRTranslateCell{
    __weak IBOutlet UILabel *ruTextField;
    __weak IBOutlet UILabel *enTextField;
    __weak IBOutlet UIActivityIndicatorView *activity;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setWordPair:(WordPair*)wordPair{
    ruTextField.text = wordPair.original;
    switch ([wordPair.status intValue]) {
        case WordPairStatus_TRANSLATED:
            activity.hidden = YES;
            enTextField.text = wordPair.translation;
            break;
        case WordPairStatus_LOADING:
            activity.hidden = NO;
            enTextField.text = @"";
            break;
        case WordPairStatus_ERROR:
            activity.hidden = YES;
            enTextField.text = @"ERROR";
            break;
            
        default:
            break;
    }
}

@end
