//
//  Scene_5D.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"
#import "AudioManager.h"

@interface Scene_5D : CCLayer
{
@private
    CCMenuItemFont *I_1;
    CCMenuItemFont *I_2;
    CCMenuItemFont *I_3;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCLabelTTF *label_5;
    
    CCSprite *background;
    CCSprite *path;
    CCSprite *pond;
    
    CCSprite *pond_pad1;
    CCSprite *pond_pad2;
    CCSprite *pond_pad3;
    
    float verticalSpeed;
    float horizontalSpeed;
    
    int target_X1;
    int target_Y1;
    int target_X2;
    int target_Y2;
    int target_X3;
    int target_Y3;
    
    bool enablePond;
    
    float maxVolumn;
    float minVolumn;
    
    float preFactor;
    
    //For next scene
    CCSprite *door;
    
    int transitionTime;
    
    CCSprite* tip_down;
    CCSprite* tip_up;

    
@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;

@end
