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
    
    CCSprite *background;
    CCSprite *silence;
    CCSprite *light;
    CCSprite *tree_nest;
    
    //for Scene_5B
    CCSprite* treeLeft;
    CCSprite* springBottom;
    CCSprite* cat;
    
    //for Scene_5C
    CCSprite* keyTreeLeft;
    CCSprite* treeLayer_1;
    CCSprite* treeLayer_2;
    
    int transitionTime;
    int _nextScene;
    
    @public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;

@end
