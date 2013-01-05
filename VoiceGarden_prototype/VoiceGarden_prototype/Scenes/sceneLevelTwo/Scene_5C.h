//
//  Scene_5C.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"


@interface Scene_5C : CCLayer
{
@private
    CCMenuItemFont *spring;
    CCMenuItemFont *key_button;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCMenuItemImage *key;
    
    CCSprite* treeLeft;
    CCSprite* treeRight;
    CCSprite* treeLayer_1;
    CCSprite* treeLayer_2;
    
    float transitionTime;
    int _nextScene;
    
    //for scene 6A
    CCSprite* tree_L;
    CCSprite* treeRightEgg;
    CCSprite* bottomRight;
    CCSprite* cat;
    
    int dominantnote;
    float flowerTimer[4];
    bool falling[4];
    float floweRotation[4];
    
    CCSprite *silence;
    CCSprite *light;
    
    CCSprite* tip_down;
    CCSprite* tip_up;

    
@public
    int sceneStatus;
    
    
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;
@end
