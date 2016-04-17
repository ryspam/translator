//
//  TRBorderedView.m
//  Translator
//
//  Created by Руслан on 16.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRBorderedView.h"

@implementation TRBorderedView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]) {
        _borderWidth = 1;
        [self customize];
    }
    return self;
}

- (void)setBorderWidth:(CGFloat)width{
    _borderWidth = width;
    [self customize];
}

- (void)customize{
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = _borderWidth;
}

@end
