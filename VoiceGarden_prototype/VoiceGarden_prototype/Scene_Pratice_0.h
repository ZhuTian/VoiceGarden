//
//  Scene_Pratice_0.h
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 12/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene_Pratice_0 : CCLayer {
    CCProgressTimer* barTimer;
    CCSprite*  barSprite;
    int livePoints;
    bool isNoisy;
    bool isDone;
    CCMenuItemFont* button_next;
}

+(CCScene*)scene;

@end
