//
//  Scene_6B.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"

@interface Scene_6B : CCLayer
{
@private
    CCMenuItemFont *go;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    
    CCSprite* footPrintLeft;
    CCSprite* footPrintRight;
    
    int status;
    int timer;
    bool isLeft;
    
@public
    int sceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType;
@property int sceneStatus;
@end
