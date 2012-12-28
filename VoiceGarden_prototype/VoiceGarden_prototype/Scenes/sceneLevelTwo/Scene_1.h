//
//  Scene_1.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"

@interface Scene_1 : CCLayer
{
    CCSprite *background;
    CCSprite *silence;
    CCSprite *desolate;
    CCSprite *garden;
    
    CCLabelTTF *label;
    CCMenuItemFont *button_garden;
    
    int transitionTime;
    int _nextScene;
}
+(CCScene *) scene;

@end
