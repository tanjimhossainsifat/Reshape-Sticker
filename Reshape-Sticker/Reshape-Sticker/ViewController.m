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

#pragma mark - UITabbarDelegte methods

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSLog(@"didSelectItem: %ld", item.tag);
    
    switch (item.tag) {
        case 0:
        {
            [self.backgroundView distort];
        }
            break;
        case 1:
        {
            [self.backgroundView rotate];
        }
            break;
        case 2:
        {
            [self.backgroundView scale];
        }
            break;
        case 3:
        {
            [self.backgroundView move];
        }
            break;
        case 4:
        {
            //save
        }
            break;
            
        default:
            break;
    }
    
}
@end
