//
//  Scene_8A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_8A : CCLayer
{
@private
    CCMenuItemFont *thriving;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    
    CCSprite *background;
    CCSprite *door;
    
    float transitionTime;
    
@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;
@end
