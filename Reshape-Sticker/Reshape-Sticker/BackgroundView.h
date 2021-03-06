//
//  BackgroundView.h
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "StickerImageView.h"

@interface BackgroundView : UIView

@property (readwrite)   CGContextRef        context;
@property (retain)      StickerImageView*   stickerImageView;


@property (readwrite)   CGAffineTransform   translationTransform;
@property (readwrite)   CGAffineTransform   distortionTransform;
@property (readwrite)   CGAffineTransform   rotationTransform;
@property (readwrite)   CGAffineTransform   scaleTransform;

@property (assign)      BOOL                shouldTranslate;
@property (assign)      BOOL                shouldRotate;
@property (assign)      BOOL                shouldScale;
@property (assign)      BOOL                shouldDistort;

-(void) viewJustLoaded;

-(void) distort;
-(void) rotate;
-(void) scale;
-(void) move;
-(void) save;

@end
