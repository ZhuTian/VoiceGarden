//
//  Scene_7A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_7A : CCLayer
{
@private
    CCMenuItemFont *secret;
    CCMenuItemFont *open;
    CCMenuItemImage *key;
    CCMenuItemFont *action;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    
@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;
@end
