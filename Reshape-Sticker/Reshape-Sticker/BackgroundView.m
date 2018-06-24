//
//  BackgroundView.m
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView
@synthesize context;
@synthesize stickerImageView;
@synthesize distortionTransform;
@synthesize rotationTransform;
@synthesize translationTransform;
@synthesize scaleTransform;

-(BOOL)isMultipleTouchEnabled
{
    return NO;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

-(void) viewJustLoaded
{
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
    stickerImageView = [[StickerImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
    [stickerImageView setCenter:self.center];
    [stickerImageView initCorners];
    [stickerImageView setImage:[UIImage imageNamed:@"sticker"]];
    [self addSubview:stickerImageView];
    
    distortionTransform = self.transform;
    rotationTransform = self.transform;
    translationTransform = self.transform;
    scaleTransform = self.transform;
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint prevPoint = [[touches anyObject]locationInView:self];
    
    
    
    CGRect cornerSelectRect[4];
    cornerSelectRect[0] = CGRectMake(stickerImageView.leftTopPoint.x-6, stickerImageView.leftTopPoint.y-6, 12, 12);
    cornerSelectRect[1] = CGRectMake(stickerImageView.rightTopPoint.x-6, stickerImageView.rightTopPoint.y-6, 12, 12);
    cornerSelectRect[2] = CGRectMake(stickerImageView.rightBottomPoint.x-6, stickerImageView.rightBottomPoint.y-6, 12, 12);
    cornerSelectRect[3] = CGRectMake(stickerImageView.leftBottomPoint.x-6, stickerImageView.leftBottomPoint.y-6, 12, 12);
    
    CGRect centerSelectRect[4];
    centerSelectRect[0] = CGRectMake(stickerImageView.centerLeftPoint.x-6, stickerImageView.centerLeftPoint.y-6, 12, 12);
    centerSelectRect[1] = CGRectMake(stickerImageView.centerTopPoint.x-6, stickerImageView.centerTopPoint.y-6, 12, 12);
    centerSelectRect[2] = CGRectMake(stickerImageView.centerRightPoint.x-6, stickerImageView.centerRightPoint.y-6, 12, 12);
    centerSelectRect[3] = CGRectMake(stickerImageView.centerBottomPoint.x-6, stickerImageView.centerBottomPoint.y-6, 12, 12);
    
    
    
    if(stickerImageView.operationType == Rotation)
    {
        
        if(CGRectContainsPoint(cornerSelectRect[0], prevPoint) ||
           CGRectContainsPoint(cornerSelectRect[1], prevPoint) ||
           CGRectContainsPoint(cornerSelectRect[2], prevPoint) ||
           CGRectContainsPoint(cornerSelectRect[3], prevPoint))
        {
            
            self.shouldRotate = YES;
            
        }
        else {
            self.shouldRotate = NO;
        }
        
        
    }
    
    
    if(stickerImageView.operationType == Translation)
    {
        
        if(CGRectContainsPoint(stickerImageView.frame, prevPoint))
        {
            self.shouldTranslate = YES;
        }
        else {
            self.shouldTranslate = NO;
        }
        
    }
    
    
    
    if(stickerImageView.operationType == Distortion)
    {
        
        if(CGRectContainsPoint(cornerSelectRect[0], prevPoint) ||
           CGRectContainsPoint(cornerSelectRect[1], prevPoint) ||
           CGRectContainsPoint(cornerSelectRect[2], prevPoint) ||
           CGRectContainsPoint(cornerSelectRect[3], prevPoint))
        {
            
            self.shouldDistort = YES;
            
        }
        else {
            self.shouldDistort = NO;
        }
        
        
    }
    
    
    if(stickerImageView.operationType == Scale)
    {
        
        if(CGRectContainsPoint(centerSelectRect[0], prevPoint) ||
           CGRectContainsPoint(centerSelectRect[1], prevPoint) ||
           CGRectContainsPoint(centerSelectRect[2], prevPoint) ||
           CGRectContainsPoint(centerSelectRect[3], prevPoint))
        {
            
            self.shouldScale = YES;
            
        }
        else {
            self.shouldScale = NO;
        }
        
        
    }
    
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject]locationInView:self];
    CGPoint prevPoint = [[touches anyObject]previousLocationInView:self];
    
    
    
    CGRect cornerSelectRect[4];
    cornerSelectRect[0] = CGRectMake(stickerImageView.leftTopPoint.x-6, stickerImageView.leftTopPoint.y-6, 12, 12);
    cornerSelectRect[1] = CGRectMake(stickerImageView.rightTopPoint.x-6, stickerImageView.rightTopPoint.y-6, 12, 12);
    cornerSelectRect[2] = CGRectMake(stickerImageView.rightBottomPoint.x-6, stickerImageView.rightBottomPoint.y-6, 12, 12);
    cornerSelectRect[3] = CGRectMake(stickerImageView.leftBottomPoint.x-6, stickerImageView.leftBottomPoint.y-6, 12, 12);
    
    CGRect centerSelectRect[4];
    centerSelectRect[0] = CGRectMake(stickerImageView.centerLeftPoint.x-6, stickerImageView.centerLeftPoint.y-6, 12, 12);
    centerSelectRect[1] = CGRectMake(stickerImageView.centerTopPoint.x-6, stickerImageView.centerTopPoint.y-6, 12, 12);
    centerSelectRect[2] = CGRectMake(stickerImageView.centerRightPoint.x-6, stickerImageView.centerRightPoint.y-6, 12, 12);
    centerSelectRect[3] = CGRectMake(stickerImageView.centerBottomPoint.x-6, stickerImageView.centerBottomPoint.y-6, 12, 12);
    
    
    
    if(stickerImageView.operationType == Rotation && self.shouldRotate)
    {
        
        CGPoint vector1 = CGPointMake(prevPoint.x-stickerImageView.centerPoint.x, prevPoint.y-stickerImageView.centerPoint.y);
        CGPoint vector2 = CGPointMake(point.x-stickerImageView.centerPoint.x, point.y-stickerImageView.centerPoint.y);
        float angle1 = atan2f(vector1.x, vector1.y);
        float angle2 = atan2f(vector2.x, vector2.y);
        float rotationAngle =  -(angle2- angle1);
        self.rotationTransform = CGAffineTransformRotate(self.rotationTransform, rotationAngle);
        stickerImageView.transform = rotationTransform;
        stickerImageView.transformSticker = rotationTransform;
        [stickerImageView updateCorners];
        
        [self setNeedsDisplay];
        return;
        
        
    }
    
    
    if(stickerImageView.operationType == Translation && self.shouldTranslate )
    {
        
        CGPoint vector = CGPointMake(point.x-prevPoint.x, point.y-prevPoint.y);
        self.translationTransform = CGAffineTransformConcat(self.translationTransform, CGAffineTransformMakeTranslation(vector.x, vector.y));
        stickerImageView.transform = translationTransform;
        stickerImageView.transformSticker = translationTransform;
        [stickerImageView updateCorners];
        
        [self setNeedsDisplay];
        return;
        
    }
    
    
    
    if(stickerImageView.operationType == Distortion && self.shouldDistort)
    {
        CGPoint vector = CGPointMake(point.x-prevPoint.x, point.y-prevPoint.y);

        self.distortionTransform = CGAffineTransformConcat(self.distortionTransform, CGAffineTransformMake(1,0,0,1,vector.x,vector.y));
        stickerImageView.transform = self.distortionTransform;
        stickerImageView.transformSticker = self.distortionTransform;
        [stickerImageView updateCorners];
        
        [self setNeedsDisplay];
        return;
        
        
    }
    
    
    if(stickerImageView.operationType == Scale && self.shouldScale)
    {
        
        CGPoint vector1 = CGPointMake(prevPoint.x-stickerImageView.centerPoint.x, prevPoint.y-stickerImageView.centerPoint.y);
        CGPoint vector2 = CGPointMake(point.x-stickerImageView.centerPoint.x, point.y-stickerImageView.centerPoint.y);
        float len1 = sqrtf(vector1.x*vector1.x + vector1.y*vector1.y);
        float len2 = sqrtf(vector2.x*vector2.x + vector2.y*vector2.y);
        float scaleFactor = len2/len1;
        //        CGPoint scaleFactor1 = CGPointMake(fabs(vector2.x/vector1.x), fabs(vector2.y/vector1.y));
        //        self.scaleTransform = CGAffineTransformScale(self.scaleTransform, scaleFactor.x, scaleFactor.y);
        //        self.scaleTransform = CGAffineTransformConcat(self.scaleTransform, CGAffineTransformMakeScale(scaleFactor,scaleFactor));
        self.scaleTransform = CGAffineTransformScale(self.scaleTransform, scaleFactor, scaleFactor);
        
        //        self.scaleTransform = CGAffineTransformConcat(self.scaleTransform, CGAffineTransformMakeTranslation(point.x-prevPoint.x, point.y - prevPoint.y));
        
        stickerImageView.transform = self.scaleTransform;
        stickerImageView.transformSticker = self.scaleTransform;
        
        [stickerImageView updateCorners];
        
        [self setNeedsDisplay];
        return;
        
        
    }
    
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.rotationTransform = stickerImageView.transform;
    self.translationTransform = stickerImageView.transform;
    self.scaleTransform = stickerImageView.transform;
    self.distortionTransform = stickerImageView.transform; 
    
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect
{
    context = UIGraphicsGetCurrentContext();
    [stickerImageView drawFrameWithContext:context];
}


-(void) distort {
    
    self.stickerImageView.operationType = Distortion;
    [self setNeedsDisplay];
}
-(void) rotate {
    self.stickerImageView.operationType = Rotation;
    [self setNeedsDisplay];
}
-(void) scale {
    self.stickerImageView.operationType = Scale;
    [self setNeedsDisplay];
}

-(void)move {
    self.stickerImageView.operationType = Translation;
    [self setNeedsDisplay];
}

-(void)save {
    self.stickerImageView.operationType = None;
    [self setNeedsDisplay];
}


@end
