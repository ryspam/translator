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

    // Configure the view for the selected state
}

- (void)setWordPair:(NSString*)ruWord{
    ruTextField.text = ruWord;
}

@end
