//
//  Scene_Pratice_3.m
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Scene_Pratice_3.h"
#import "AudioManager.h"


@implementation Scene_Pratice_3
+(CCScene*)scene
{
    CCScene *scene = [CCScene node];
    
    Scene_Pratice_3 *layer = [Scene_Pratice_3 node];
    
    [scene addChild:layer];
    
    return scene;
}

-(id) init
{
    if (self = [super init]) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* sprite = [CCSprite spriteWithFile:@"bg5.jpg"];        
        sprite.position = ccp(size.width/2, size.height/2);
        [self addChild:sprite];
        
        bar = [CCSprite spriteWithFile:@"vg_512_48_Time_Bar_Shell_2.png"];
        bar.position = ccp(size.width/2, size.height/2);
        [self addChild:bar];
        
        slider = [CCSprite spriteWithFile:@"cube.png"];
        slider.position = ccp(size.width/2, size.height/2);
        [self addChild:slider];
        
        CCMenuItemFont *button_next = [CCMenuItemFont itemWithString:@"next" block:^(id sender){
              //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_Pratice_2 scene] withColor:ccWHITE]];
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
    float fre = [[AudioManager sharedInstance] getFundamentalFrequency];
    NSLog(@"frequency: %f",fre);
    
    CGSize size = bar.contentSize;
    CGPoint position = bar.position;
    
    float cubePositionX = fre*size.width/1000.0f;
    slider.position = ccp((position.x-size.width/2)+cubePositionX, position.y);    
}

@end
