//
//  Scene_Pratice_1.m
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Scene_Pratice_2.h"
#import "AudioManager.h"


@implementation Scene_Pratice_2
+(CCScene*)scene
{
    CCScene *scene = [CCScene node];
    
    Scene_Pratice_2 *layer = [Scene_Pratice_2 node];
    
    [scene addChild:layer];
    
    return scene;
}

-(id) init
{
    if (self = [super init]) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        
        CCSprite* sprite = [CCSprite spriteWithFile:@"bg5.jpg"];
        CGSize size = [[CCDirector sharedDirector] winSize];
        sprite.position = ccp(size.width/2, size.height/2);
        [self addChild:sprite];
        
        CCSprite* barSprite = [CCSprite spriteWithFile:@"vg_96_16_Power_Bar.png"];
        barTimer = [CCProgressTimer progressWithSprite:barSprite];
        barTimer.type = kCCProgressTimerTypeBar;
        barTimer.barChangeRate = ccp(1, 0);
        barTimer.midpoint = ccp(0.0f, 0.0f);
        barTimer.percentage = 5;
        
        barTimer.position = ccp(size.width/2, size.height/2);
        
        [self addChild:barTimer];
        
        CCMenuItemFont *button_next = [CCMenuItemFont itemWithString:@"next" block:^(id sender){
            //  [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [button_next setFontName:fontName];
        [button_next setFontSize:48];
        [button_next setPosition:ccp( size.width/2, size.height/2 - 100)];
        [button_next setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:button_next, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)dt
{
    float volume = [[AudioManager sharedInstance] getAverageVolume];

    if (volume>-25) {
        barTimer.percentage+=dt*10;
    }
    else{
        barTimer.percentage-=dt*5;
    }
        
    if (barTimer.percentage<=5) {
        barTimer.percentage=5;
    }
    
}

@end
