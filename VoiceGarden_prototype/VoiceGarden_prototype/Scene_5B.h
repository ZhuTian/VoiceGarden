//
//  Scene_5B.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "FootprintManager_old.h"

@interface Scene_5B : CCLayer
{
@private
    CCMenuItemFont *keep;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    
    FootprintManager_old* footprintManager;
    
    CGPoint bloomPosition;
    CGPoint swayPosition;
    
    bool bloomCollected;
    bool swayCollected;
    
    CCLabelTTF *bloomLabel;
    CCLabelTTF *swayLabel;
    
    float collisionThreshold;
    
@public
    int sceneStatus;
    int preScene;
    NSTimer *levelTimer;

};

+(CCScene *) sceneWithVar: (int)_sceneType preScene:(int)_preScene;
@property int sceneStatus;
@property int preScene;
@end
