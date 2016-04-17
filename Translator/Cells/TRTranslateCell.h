//
//  TRTranslateCell.h
//  Translator
//
//  Created by Руслан on 16.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordPair.h"

@interface TRTranslateCell : UITableViewCell
- (void)setWordPair:(WordPair*)wordPair;
@end
