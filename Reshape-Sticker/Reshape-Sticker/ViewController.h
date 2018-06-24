//
//  ViewController.h
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundView.h"
#import "StickerImageView.h"
@interface ViewController : UIViewController<UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) BackgroundView *backgroundView;


@end

