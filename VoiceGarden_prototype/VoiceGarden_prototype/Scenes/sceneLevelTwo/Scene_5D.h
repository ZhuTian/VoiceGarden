//
//  Scene_5D.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"

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
    
@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;

@end
