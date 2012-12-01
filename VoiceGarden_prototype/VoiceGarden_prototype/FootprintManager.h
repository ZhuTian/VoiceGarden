//
//  FootprintManager.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-15.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface FootprintManager : NSObject
{
@private
    NSMutableArray *footArray;
    CCLayer* scene;
    
    float low_mid;
    float mid_high;
    
    int currentX;
    int currentY;
    int previousX;
    int previousY;
    
    int footGap;
    float footScale;
    bool currentLeft;
    int leftOffset;
    
    int maxFootprint;
    
    int opacityDecrease;
    
    int heightIncrease;
    
    float previousRotate;
    
    bool goUp;
    bool goDown;
    
    @public
    int highY;
    int midY;
    int lowY;
    int scrollSpeed;
    
}

+(FootprintManager*)initManager :(CCLayer*)_scene;
-(void)addFoot :(float)audioLevel;
-(CGPoint)getLatestPosition;
-(void)updateOpacity:(ccTime)dt;

@property(assign) NSMutableArray *footArray;
@property(assign) CCLayer* scene;
@property(assign) int currentX;
@property(assign) float previousAudioLevl;

@end
