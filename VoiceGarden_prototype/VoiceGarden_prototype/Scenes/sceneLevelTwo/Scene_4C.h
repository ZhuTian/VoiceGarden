//
//  Scene_4C.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"

@interface Scene_4C : CCLayer
{
    @private
    CCMenuItemFont *spring;
    CCMenuItemFont *key;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    
<<<<<<< HEAD
    CCSprite *background;
    CCSprite *silence;
    CCSprite *light;
    CCSprite *tree_nest;
    
    int transitionTime;
=======
    CCSprite* silence;
    CCSprite* silence_light;
    CCSprite* tree;
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
    
    @public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;

@end
