//
//  StickerImageView.m
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import "StickerImageView.h"

@implementation StickerImageView

@synthesize leftTopPoint,leftBottomPoint,rightTopPoint,rightBottomPoint,rotationPoint;
@synthesize centerLeftPoint, centerTopPoint, centerRightPoint, centerBottomPoint;
@synthesize transformSticker;
@synthesize operationType;
@synthesize point1,point2,point3,point4,point5,point6,point7,point8,point9;
@synthesize centerPoint;

- (id)init
{
    self = [super init];
    if (self)
    {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.transformSticker = self.transform;
    }
    return self;
}

-(void)initCorners
{
    leftTopPoint  = CGPointMake(self.frame.origin.x, self.frame.origin.y);
    rightTopPoint = CGPointMake(self.frame.origin.x+self.frame.size.width, self.frame.origin.y);
    leftBottomPoint = CGPointMake(self.frame.origin.x, self.frame.origin.y+self.frame.size.height);
    rightBottomPoint = CGPointMake(self.frame.origin.x+self.frame.size.width, self.frame.origin.y+self.frame.size.height);
    
    centerLeftPoint = CGPointMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height/2);
    centerTopPoint = CGPointMake(self.frame.origin.x + self.frame.size.width/2, self.frame.origin.y);
    centerRightPoint = CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height/2);
    centerBottomPoint = CGPointMake(self.frame.origin.x + self.frame.size.width/2, self.frame.origin.y + self.frame.size.height);
    
    centerPoint = self.center;
    
    
    point1 = leftTopPoint;
    point2 = rightTopPoint;
    point3 = leftBottomPoint;
    point4 = rightBottomPoint;
    point5 = self.center;
    point6 = centerLeftPoint;
    point7 = centerTopPoint;
    point8 = centerRightPoint;
    point9 = centerBottomPoint;
    
}

-(void)updateCorners
{
    CGAffineTransform transform = CGAffineTransformMakeTranslation(-self.center.x, -self.center.y);
    transform = CGAffineTransformConcat(transform, self.transformSticker);
    CGAffineTransform transform1 = CGAffineTransformMakeTranslation(self.center.x, self.center.y);
    transform = CGAffineTransformConcat(transform, transform1);
    
    leftTopPoint     = CGPointApplyAffineTransform(point1, transform);
    rightTopPoint    = CGPointApplyAffineTransform(point2, transform);
    rightBottomPoint = CGPointApplyAffineTransform(point4, transform);
    leftBottomPoint  = CGPointApplyAffineTransform(point3, transform);
    centerPoint = CGPointApplyAffineTransform(point5, transform);
    centerLeftPoint     = CGPointApplyAffineTransform(point6, transform);
    centerTopPoint    = CGPointApplyAffineTransform(point7, transform);
    centerRightPoint = CGPointApplyAffineTransform(point8, transform);
    centerBottomPoint  = CGPointApplyAffineTransform(point9, transform);
    
}

-(void)drawFrameWithContext:(CGContextRef)context
{
    
    if(self.operationType == None)
        return;
    
    for (int i=0; i<4; i++)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        CGContextSetLineWidth(context, 1.0f);
        switch(i)
        {
            case 0:
            {
                CGContextMoveToPoint(context, leftTopPoint.x, leftTopPoint.y);
                CGContextAddLineToPoint(context, rightTopPoint.x, rightTopPoint.y);
                CGContextStrokePath(context);
                break;
            }
            case 1:
            {
                CGContextMoveToPoint(context, rightTopPoint.x, rightTopPoint.y);
                CGContextAddLineToPoint(context, rightBottomPoint.x, rightBottomPoint.y);
                CGContextStrokePath(context);
                break;
            }
            case 2:
            {
                CGContextMoveToPoint(context, rightBottomPoint.x, rightBottomPoint.y);
                CGContextAddLineToPoint(context, leftBottomPoint.x, leftBottomPoint.y);
                CGContextStrokePath(context);
                break;
            }
            case 3:
            {
                CGContextMoveToPoint(context, leftBottomPoint.x, leftBottomPoint.y);
                CGContextAddLineToPoint(context, leftTopPoint.x, leftTopPoint.y);
                CGContextStrokePath(context);
                break;
            }
        }
    }
    UIImage* pointImage = [UIImage imageNamed:@"ControlPoint"];
    
    if(self.operationType == Scale) {
        
        [pointImage drawAtPoint:CGPointMake(centerLeftPoint.x-6, centerLeftPoint.y-6)];
        [pointImage drawAtPoint:CGPointMake(centerTopPoint.x-6, centerTopPoint.y-6)];
        [pointImage drawAtPoint:CGPointMake(centerRightPoint.x-6, centerRightPoint.y-6)];
        [pointImage drawAtPoint:CGPointMake(centerBottomPoint.x-6, centerBottomPoint.y-6)];
    }
    else if(self.operationType == Distortion || self.operationType == Rotation) {
        
        [pointImage drawAtPoint:CGPointMake(leftTopPoint.x-6, leftTopPoint.y-6)];
        [pointImage drawAtPoint:CGPointMake(rightTopPoint.x-6, rightTopPoint.y-6)];
        [pointImage drawAtPoint:CGPointMake(rightBottomPoint.x-6, rightBottomPoint.y-6)];
        [pointImage drawAtPoint:CGPointMake(leftBottomPoint.x-6, leftBottomPoint.y-6)];
        
    }
    
}

@end
