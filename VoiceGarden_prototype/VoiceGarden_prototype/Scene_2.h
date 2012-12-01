//
//  Scene_2.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_2 : CCLayer
{
    @private
    CCMenuItemFont *desolate_beautiful;
    CCMenuItemFont *slience_XXX;
    CCSprite* background;
    
    @public
    int sceneStatus;
};
+(CCScene *) sceneWithVar: (int)_sceneType;

@property int sceneStatus;

@end
