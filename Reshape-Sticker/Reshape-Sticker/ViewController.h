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
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) BackgroundView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@property (weak, nonatomic) IBOutlet UIButton *distortButton;
@property (weak, nonatomic) IBOutlet UIButton *rotateButton;
@property (weak, nonatomic) IBOutlet UIButton *scaleButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;


- (IBAction)onButtonDistort:(id)sender;
- (IBAction)onButtonRotate:(id)sender;
- (IBAction)onButtonScale:(id)sender;
- (IBAction)onButtonSave:(id)sender;


@end

