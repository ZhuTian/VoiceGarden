//
//  Scene_Pratice_0.m
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 12/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Scene_Pratice_0.h"
#import "Scene_Pratice_1.h"
#import "AudioManager.h"
#import "StartScene.h"
#define sceneFontSize 20

@implementation Scene_Pratice_0
+(CCScene*)scene
{
    CCScene *scene = [CCScene node];
    
    Scene_Pratice_0 *layer = [Scene_Pratice_0 node];
    
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
        
        
        CCSprite* barBgSprite = [CCSprite spriteWithFile:@"volume1_bar_bg.png"];
        barBgSprite.position = ccp(size.width/2, size.height/2);
        [self addChild:barBgSprite];
        
        barSprite = [CCSprite spriteWithFile:@"volume1_bar_top.png"];
        barTimer = [CCProgressTimer progressWithSprite:barSprite];
        barTimer.type = kCCProgressTimerTypeBar;
        barTimer.barChangeRate = ccp(1, 0);
        barTimer.midpoint = ccp(0.0f, 0.0f);
        barTimer.percentage = 33;
        barTimer.position = ccp(size.width/2, size.height/2);
        [self addChild:barTimer];
        
        button_next = [CCMenuItemFont itemWithString:@"next" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_Pratice_1 scene] withColor:ccWHITE]];
        }];
        [button_next setFontName:fontName];
        [button_next setFontSize:30];
        [button_next setPosition:ccp( size.width/2 + 220, size.height/2 - 20)];
        [button_next setColor:ccc3(100,100,100)];
        
        [button_next setVisible:false];
        
        CCSprite* talkBubble = [CCSprite spriteWithFile:@"talkBubble.png"];
        talkBubble.position = ccp(size.width/2, size.height/2 + 50);
        [self addChild:talkBubble];
        
        CCLabelTTF* label_5 = [CCLabelTTF labelWithString:@"Expirement with your voice. Any sound will do." fontName:fontName fontSize:17];
		label_5.position =  ccp(size.width /2 , size.height/2 - 175);
        label_5.color = ccc3(0, 0, 0);
		[self addChild: label_5];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartScene scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:sceneFontSize];
        [back setPosition:ccp(100, 30)];
        [back setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:button_next, back, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        livePoints = 0;
        isNoisy = false;
        isDone = false;
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)dt
{
    float volume = [[AudioManager sharedInstance] getAverageVolume];
    
    if (volume>-15&&isNoisy==false) {
        isNoisy=true;
        livePoints++;
    
        float per=0;
    
        switch (livePoints) {
            case 0:
                per = 35.0f;
                break;
            case 1:
                per = 39.0f;
                break;
            case 2:
                per = 43.0f;
                break;
            case 3:
                per = 47.0f;
                break;
            case 4:
                per = 51.0f;
                break;
            case 5:
                per = 57.0f;
                break;
            case 6:
                per = 61.0f;
                break;
            case 7:
                per = 67.0f;
                [self updateScene];
                
                break;
            default:
                per = 67.0f;
                break;
        }
        
        barTimer.percentage = per;
                
        
    }
    
    if (volume<-40) {
        isNoisy = false;
    }
    
    
    
   // NSLog(@"%d,%f",livePoints,barTimer.percentage);
    
}

-(void) updateScene
{
    [button_next setVisible:true];
    id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
    id action = [CCEaseIn actionWithAction:move rate:1];
    id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
    id action2 = [CCEaseOut actionWithAction:move2 rate:1];
    
    [button_next runAction: [CCSequence actions:action, action2, nil]];
    [button_next runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
}

@end
