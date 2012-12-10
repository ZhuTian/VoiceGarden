//
//  Scene_3A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_3A : CCLayer
{
@private
    CCMenuItemFont *road;
    CCMenuItemFont *wind;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCLabelTTF *label_5;
    CCLabelTTF *label_6;
    CCLabelTTF *label_7;
    
    //New for volumn
    float percentage;
    bool isLoud;
    bool isBlowOver;
    int whichWind;
    
@public
    int sceneStatus;
}

+(CCScene *) sceneWithVar: (int)_sceneType;

@property int sceneStatus;

@end
