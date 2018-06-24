//
//  StickerImageView.h
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    Translation = 0,
    Distortion  = 1,
    Scale       = 2,
    Rotation    = 3
}OperationType;

@interface StickerImageView : UIImageView

@property (readwrite) CGPoint leftTopPoint;
@property (readwrite) CGPoint rightTopPoint;
@property (readwrite) CGPoint leftBottomPoint;
@property (readwrite) CGPoint rightBottomPoint;
@property (readwrite) CGPoint rotationPoint;
@property (readwrite) CGPoint centerPoint;
@property (readwrite) OperationType operationType;
@property (readwrite) CGAffineTransform transformSticker;
@property (readwrite) CGPoint point1;
@property (readwrite) CGPoint point2;
@property (readwrite) CGPoint point3;
@property (readwrite) CGPoint point4;
@property (readwrite) CGPoint point5;
@property (readwrite) CGPoint point6;
@property (readwrite) CGPoint point7;
@property (readwrite) CGPoint point8;
@property (readwrite) CGPoint point9;

@property (readwrite) CGPoint centerLeftPoint;
@property (readwrite) CGPoint centerTopPoint;
@property (readwrite) CGPoint centerRightPoint;
@property (readwrite) CGPoint centerBottomPoint;

-(void)drawFrameWithContext:(CGContextRef)context;
-(void)updateCorners;
-(void)initCorners;
@end
