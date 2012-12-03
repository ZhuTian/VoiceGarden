//
//  Scene_Pratice_1.m
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Scene_Pratice_2.h"
#import "Scene_Pratice_3.h"
#import "AudioManager.h"
#define sceneFontSize 20

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
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* sprite = [CCSprite spriteWithFile:@"tutorial_bg.png"];
        sprite.position = ccp(size.width/2, size.height/2);
        [self addChild:sprite];
        
        CCLabelTTF* label_1 = [CCLabelTTF labelWithString:@"This is a journey to regain the power of your voice." fontName:fontName fontSize:sceneFontSize];
		label_1.position =  ccp(size.width /2 , size.height/2 + 200);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        CCLabelTTF* label_2 = [CCLabelTTF labelWithString:@"Give part of yourself - your voice - to nourish the garden." fontName:fontName fontSize:sceneFontSize];
		label_2.position =  ccp(size.width /2 , size.height/2 + 170);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        CCLabelTTF* label_3 = [CCLabelTTF labelWithString:@"Heal and bring life back to the garden through exploring the text." fontName:fontName fontSize:sceneFontSize];
		label_3.position =  ccp(size.width /2 , size.height/2 + 140);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
        
        CCLabelTTF* label_4 = [CCLabelTTF labelWithString:@"Your voice is more power than you imagine." fontName:fontName fontSize:sceneFontSize];
		label_4.position =  ccp(size.width /2 , size.height/2 + 110);
        label_4.color = ccc3(0, 0, 0);
		[self addChild: label_4];
        
        CCSprite* barBgSprite = [CCSprite spriteWithFile:@"duration_bar_bg.png"];
        barBgSprite.position = ccp(size.width/2, size.height/2);
        [self addChild:barBgSprite];
        
        barSprite = [CCSprite spriteWithFile:@"duration_bar_top.png"];
        barTimer = [CCProgressTimer progressWithSprite:barSprite];
        barTimer.type = kCCProgressTimerTypeBar;
        barTimer.barChangeRate = ccp(1, 0);
        barTimer.midpoint = ccp(0.0f, 0.0f);
        barTimer.percentage = 36;
        barTimer.position = ccp(size.width/2, size.height/2);
        [self addChild:barTimer];
        
        indicator = [CCSprite spriteWithFile:@"horizontalIndicator.png"];
        indicator.position = ccp(size.width/2, size.height/2-17);
        [self addChild:indicator];
  
        CCMenuItemFont *button_next = [CCMenuItemFont itemWithString:@"next" block:^(id sender){
              [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_Pratice_3 scene] withColor:ccWHITE]];
        }];
        [button_next setFontName:fontName];
        [button_next setFontSize:30];
        [button_next setPosition:ccp( size.width/2 + 220, size.height/2 - 20)];
        [button_next setColor:ccc3(100,100,100)];
        
        CCSprite* talkBubble = [CCSprite spriteWithFile:@"talkBubble.png"];
        talkBubble.position = ccp(size.width/2, size.height/2 + 50);
        [self addChild:talkBubble];
        
        CCLabelTTF* label_5 = [CCLabelTTF labelWithString:@"Sustain your voice to fill the bar." fontName:fontName fontSize:17];
		label_5.position =  ccp(size.width /2 , size.height/2 - 175);
        label_5.color = ccc3(0, 0, 0);
		[self addChild: label_5];
        
        
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
        
    if (barTimer.percentage<35) {
        barTimer.percentage=35.0f;
    }
    else if(barTimer.percentage>64){
        barTimer.percentage = 64.0f;
    }
    
    float per = (barTimer.percentage - 35.0f)/29.0f;
    
    CGPoint position = barTimer.position;
    CGSize barSize = barTimer.contentSize;
    float barWidth = barSize.width * 0.29f;
    float startPosition = position.x - barWidth/2;
    float indicatorPosition = startPosition + barWidth*per;
    indicator.position = ccp(indicatorPosition, indicator.position.y);
    
    NSLog(@"%f", per);
    
}

@end
