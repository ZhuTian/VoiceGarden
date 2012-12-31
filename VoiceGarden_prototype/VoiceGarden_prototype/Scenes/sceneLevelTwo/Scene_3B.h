//
//  Scene_3B.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_3B : CCLayer
{
    @private
    CCMenuItemFont *withered;
    CCMenuItemFont *waiting;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    float spawnThreshold;
    
    NSTimer *levelTimer;
    bool hasSpawn;
    CGPoint spawnPosition[8];
    int spawnIndex;
    CCLabelTTF* spawnWord[8];
    NSString *fontName;
    
    CCSprite* tree;
    CCSprite* silence;
    CCSprite* silence_light;
    
    
@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;

@property int sceneStatus;

@end
