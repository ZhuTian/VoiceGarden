//
//  Scene_Pratice_2.h
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene_Pratice_2 : CCNode {
    CCProgressTimer* barTimer;
    CCSprite* indicator;
    CCSprite*  barSprite;
    
    CCMenuItemFont *button_next;
    bool isDone;
}

+(CCScene* )scene;
@end
