//
//  ViewController.m
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.backgroundView = [[BackgroundView alloc] initWithFrame:self.mainView.frame];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"] ] ;
    [backgroundImageView setFrame:self.backgroundView.frame];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainView addSubview:backgroundImageView];
        [self.mainView addSubview:self.backgroundView];
    
        [self.backgroundView viewJustLoaded];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Actions

- (IBAction)onButtonDistort:(id)sender {
}

- (IBAction)onButtonRotate:(id)sender {
}

- (IBAction)onButtonScale:(id)sender {
}

- (IBAction)onButtonSave:(id)sender {
}
@end
