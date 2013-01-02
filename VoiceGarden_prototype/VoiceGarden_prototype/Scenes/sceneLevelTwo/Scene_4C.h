//
//  Scene_4C.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_4C : CCLayer
{
    @private
    CCMenuItemFont *spring;
    CCMenuItemFont *key;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    
    CCSprite* silence;
    CCSprite* silence_light;
    CCSprite* tree;
    
    @public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;

@end
