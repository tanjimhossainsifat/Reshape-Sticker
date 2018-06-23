//
//  BackgroundView.m
//  Reshape-Sticker
//
//  Created by Tanjim on 23/6/18.
//  Copyright © 2018 Tanjim. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

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
    
    self.stickerImageView = [[StickerImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
    [self.stickerImageView setCenter:self.center];
    [self.stickerImageView setImage:[UIImage imageNamed:@"sticker"]];
    [self addSubview:self.stickerImageView];
    
    self.rotationTransform = self.transform;
    self.translationTransform = self.transform;
    self.scaleTransform = self.transform;
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


-(void)drawRect:(CGRect)rect
{
    
}


@end
