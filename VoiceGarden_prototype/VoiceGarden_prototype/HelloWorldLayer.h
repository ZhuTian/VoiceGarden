//
//  HelloWorldLayer.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-10-31.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
