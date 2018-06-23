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
    Rotation    = 3,
    Nothing     = 4
    
}OperationType;

@interface StickerImageView : UIImageView

@end
