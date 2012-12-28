//
//  Scene_3A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"

@interface Scene_3A : CCLayer
{
@private
    CCMenuItemFont *road;
    CCMenuItemFont *wind_button;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCLabelTTF *label_5;
    CCLabelTTF *label_6;
    CCLabelTTF *label_7;
    
    CCSprite *desolate;
    CCSprite *wind;
    CCSprite *path;
    CCSprite *garden;
    CCSprite *background;
    CCSprite *footprint_path;
    
    //For wind message scene
    CCSprite *wind_message;
    
    //New for volumn
    float percentage;
    bool isLoud;
    bool isBlowOver;
    int whichWind;
    int transitionTime;
    int _nextScene;
    
@public
    int sceneStatus;
}

+(CCScene *) sceneWithVar: (int)_sceneType;

@property int sceneStatus;

@end
