//
//  Scene_2.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"
#import "AudioManager.h"

@interface Scene_2 : CCLayer
{
    @private
    CCMenuItemFont *desolate_beautiful;
    CCMenuItemFont *slience_XXX;
    CCMenuItemFont *back;
    CCSprite *desolate;
    CCSprite *garden;
    CCSprite *path;
    CCSprite *silence;
    CCSprite *wind;
    CCSprite *background;
    CCSprite *light;
    
    //For final scene
    CCSprite *garden_water;
    CCSprite *desolate_spring;
    CCSprite *garden_L;
    CCSprite *garden_R;
    
    float transitionTime;
    int _nextScene;
    
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    
    
    @public
    int sceneStatus;
};
+(CCScene *) sceneWithVar: (int)_sceneType;

@property int sceneStatus;

@end
