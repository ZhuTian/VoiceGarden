//
//  Scene_4A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_4A : CCLayer
{    @private
    CCMenuItemFont *my;
    CCMenuItemFont *company;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCSprite* background;
    
@public
    int sceneStatus;
    int preSceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType  preScene:(int)_preSceneType;

@property int sceneStatus;
@property int preSceneStatus;

@end
