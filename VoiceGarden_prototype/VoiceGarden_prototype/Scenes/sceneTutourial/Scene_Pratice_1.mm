//
//  Scene_Pratice_1.m
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Scene_Pratice_1.h"
#import "Scene_Pratice_2.h"
#import "AudioManager.h"
#import "StartScene.h"
#define sceneFontSize 20

@implementation Scene_Pratice_1
+(CCScene*)scene
{
    CCScene *scene = [CCScene node];
    
    Scene_Pratice_1 *layer = [Scene_Pratice_1 node];
    
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
        barTimer.percentage = 100;
        barTimer.position = ccp(size.width/2, size.height/2);        
        [self addChild:barTimer];
        
        indicator = [CCSprite spriteWithFile:@"horizontalIndicator.png"];
        indicator.position = ccp(size.width/2, size.height/2-17);
        [self addChild:indicator];

        button_next = [CCMenuItemFont itemWithString:@"next" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_Pratice_2 scene] withColor:ccWHITE]];
        }];
        [button_next setFontName:fontName];
        [button_next setFontSize:30];
        [button_next setPosition:ccp( size.width/2 + 220, size.height/2 - 20)];
        [button_next setColor:ccc3(100,100,100)];
        [button_next setVisible:false];
        
        CCSprite* talkBubble = [CCSprite spriteWithFile:@"talkBubble.png"];
        talkBubble.position = ccp(size.width/2, size.height/2 + 50);
        [self addChild:talkBubble];
        
        CCLabelTTF* label_5 = [CCLabelTTF labelWithString:@"Fill the space with your voice. The louder the better." fontName:fontName fontSize:17];
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
        
        isDone = false;
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)dt
{
    float volume = [[AudioManager sharedInstance] getAverageVolume];
    //NSLog(@"volume: %f",volume);
    if (volume>-5&&isDone==false) {
        isDone = true;
        
        
        
        float per = 100;
        barTimer.percentage = 35.0f + (64.0f - 35.0f)*per/100;
        
        CGPoint position = barTimer.position;
        CGSize barSize = barTimer.contentSize;
        float barWidth = barSize.width * 0.29f;
        float startPosition = position.x - barWidth/2;
        float indicatorPosition = startPosition + barWidth*per/100.0f;
        indicator.position = ccp(indicatorPosition, indicator.position.y);
        
        [self updateScene];
    }
    
    if (isDone==false){
        float per = (volume+55.0f)*100.0f/50.0f;
        if (per<0) {
            per = 0;
        }
        else if(per>100)
            per  = 100;
    
        barTimer.percentage = 35.0f + (64.0f - 35.0f)*per/100;
    
        CGPoint position = barTimer.position;
        CGSize barSize = barTimer.contentSize;
        float barWidth = barSize.width * 0.29f;
        float startPosition = position.x - barWidth/2;
        float indicatorPosition = startPosition + barWidth*per/100.0f;
        indicator.position = ccp(indicatorPosition, indicator.position.y);
    }
    //NSLog(@"%f,%f",barWidth,startPosition);
    
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
