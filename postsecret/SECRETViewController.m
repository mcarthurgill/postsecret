//
//  SECRETViewController.m
//  postsecret
//
//  Created by Joseph McArthur Gill on 8/20/13.
//  Copyright (c) 2013 Joseph McArthur Gill. All rights reserved.
//

#import "SECRETViewController.h"

@interface SECRETViewController ()
@property (nonatomic, strong) NSArray *photos;
-(void)setup; 
@end

@implementation SECRETViewController
@synthesize photoStack = _photoStack;
@synthesize photos = _photos;


#pragma mark -
#pragma mark Getter Methods

-(NSArray *)photos {
    if(!_photos){
        _photos = [[NSArray alloc] initWithObjects:
                   [UIImage imageNamed:@"lovewhoyouare.jpg"],
                   [UIImage imageNamed:@"beautiful.jpg"],
                   [UIImage imageNamed:@"first_love.jpg"],
                   [UIImage imageNamed:@"married.jpg"],
                   [UIImage imageNamed:@"liberty.jpg"],
                   [UIImage imageNamed:@"love.jpg"],
                   [UIImage imageNamed:@"snow.jpg"],
                   [UIImage imageNamed:@"blue.jpg"],
                   nil];
    }
    return _photos; 
}

-(PhotoStackView *)photoStack {
    if (!_photoStack) {
        _photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _photoStack.center = CGPointMake(self.view.center.x, 170);
        _photoStack.dataSource = self;
        _photoStack.delegate = self; 
    }
    return _photoStack;
}

#pragma mark -
#pragma mark DataSource Protocol Methods

-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack {
    return [self.photos count]; 
}

-(UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index {
    return [self.photos objectAtIndex:index];
}

#pragma mark -
#pragma mark Delegate Protocol Methods

-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)index {
    //user started moving a photo
}

-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)index {
    //user flicked away the photo revealing the next one in the stack
}

-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index {
//    self.pageControl.currentPage = index; 
}

-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index {
    NSLog(@"selectd photo at index %d", index);
}

#pragma mark - 
#pragma mark Setup and Load

-(void)setup {
    [self.view addSubview:self.photoStack];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

@end
