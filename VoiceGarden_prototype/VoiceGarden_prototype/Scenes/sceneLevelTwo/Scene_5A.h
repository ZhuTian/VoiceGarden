//
//  Scene_5A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import "FootprintManager.h"

@interface Scene_5A : CCLayer
{
@private
    CCMenuItemFont *keep;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    CCLabelTTF *label_5;
    FootprintManager* footprintManager;
    
    CGPoint faithPosition;
    CGPoint couragePosition;
    CGPoint friendshipPosition;
    
    bool faithCollected;
    bool courageCollected;
    bool friendshipCollected;
    
    CCLabelTTF *faithLabel;
    CCLabelTTF *courageLabel;
    CCLabelTTF *friendshipLabel;
    
    float collisionThreshold;
    
    int offset1;
    int offset2;
    int scrollSpeed;
    CCSprite* background1;
    CCSprite* background2;
    
    
@public
    int sceneStatus;
    AVAudioRecorder *recorder;
	NSTimer *levelTimer;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;
@end
