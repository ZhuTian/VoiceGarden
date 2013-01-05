//
//  Scene_7A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"

@interface Scene_7A : CCLayer
{
@private
    CCMenuItemFont *secret;
    CCMenuItemFont *open;
    CCMenuItemFont *action_button;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    
    CCSprite *background;
    CCSprite *door;
    CCSprite *door_open;
    
    //For Scene_4C
    CCSprite *silence;
    CCSprite *tree_nest;
    
    float transitionTime;
    
    int _nextScene;
    
    CCSprite* tip_down;
    CCSprite* tip_up;

@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;
@end
