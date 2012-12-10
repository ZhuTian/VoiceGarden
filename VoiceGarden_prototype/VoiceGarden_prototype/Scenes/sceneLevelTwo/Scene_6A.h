//
//  Scene_6A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_6A : CCLayer
{
@private
    CCMenuItemFont *XXX;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    
}

+(CCScene *) sceneWithVar: (int)_sceneType;

@end
