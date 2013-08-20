//
//  SECRETViewController.h
//  postsecret
//
//  Created by Joseph McArthur Gill on 8/20/13.
//  Copyright (c) 2013 Joseph McArthur Gill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"

@interface SECRETViewController : UIViewController <PhotoStackViewDataSource, PhotoStackViewDelegate>

@property (nonatomic, strong) PhotoStackView *photoStack;

@end
