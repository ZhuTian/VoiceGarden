//
//  Scene_Pratice_1.h
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene_Pratice_1 : CCLayer {
    CCProgressTimer* barTimer;
    CCSprite* indicator;
    CCSprite*  barSprite;
    CCMenuItemFont *button_next;
    
    bool isDone;
   // bool isSceneOneDone;
}

+(CCScene* )scene;

@end
