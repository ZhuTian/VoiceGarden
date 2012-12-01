//
//  Scene_5B.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"


@interface Scene_5B : CCLayer
{
    @private
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    
    @public
    int sceneStatus;
    int preScene;
};

+(CCScene *) sceneWithVar: (int)_sceneType preScene:(int)_preScene;
@property int sceneStatus;
@property int preScene;

@end
