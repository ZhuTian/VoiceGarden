//
//  Scene_4B.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"

@interface Scene_4B : CCLayer
{
@private
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCLabelTTF *label_5;
    
    CCSprite *background;
    CCSprite *wind;
    CCSprite *wind_message;
    
    //For previous scene
    CCSprite *garden;
    CCSprite *desolate;
    CCSprite *path;
    
    float transitionTime;
    
@public
    int sceneStatus;
}

+(CCScene *) sceneWithVar: (int)_sceneType;

@property int sceneStatus;
@end
