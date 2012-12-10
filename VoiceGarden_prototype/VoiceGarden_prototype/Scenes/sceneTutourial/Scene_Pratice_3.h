//
//  Scene_Pratice_3.h
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene_Pratice_3 : CCNode {
    CCSprite* bar;
    CCSprite* slider;
    CCSprite* indicator;
    CCSprite* barSprite;
    float target;
    
    CCMenuItemFont *button_next;
    bool isDone;
    int timer;
}

+(CCScene* )scene;
@end
