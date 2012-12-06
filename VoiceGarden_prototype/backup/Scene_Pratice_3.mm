//
//  Scene_Pratice_3.m
//  VoiceGarden_prototype
//
//  Created by Fangzhou Lu on 11/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Scene_Pratice_3.h"
#import "AudioManager.h"
#import "StartScene.h"

#define sceneFontSize  20

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
        
        bar = [CCSprite spriteWithFile:@"tone1_bar.png"];
        bar.position = ccp(size.width/2, size.height/2);
        [self addChild:bar];
        
        slider = [CCSprite spriteWithFile:@"VerticalIndicator.png"];
        slider.position = ccp(size.width/2+26, size.height/2);
        [self addChild:slider];
        
        button_next = [CCMenuItemFont itemWithString:@"next" block:^(id sender){
              [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartScene scene] withColor:ccWHITE]];
        }];
        [button_next setFontName:fontName];
        [button_next setFontSize:30];
        [button_next setPosition:ccp( size.width/2 + 170, size.height/2 - 20)];
        [button_next setColor:ccc3(100,100,100)];
        [button_next setVisible:false];
        
        CCMenuItem *menu = [CCMenu menuWithItems:button_next, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        CCSprite* talkBubble = [CCSprite spriteWithFile:@"talkBubble.png"];
        talkBubble.position = ccp(size.width/2, size.height/2 - 10);
        [self addChild:talkBubble];
        
        CCLabelTTF* label_5 = [CCLabelTTF labelWithString:@"Sustain your voice to fill the bar." fontName:fontName fontSize:17];
		label_5.position =  ccp(size.width /2 , size.height/2 - 235);
        label_5.color = ccc3(0, 0, 0);
		[self addChild: label_5];
        
        target = 0;
        timer=0;
        
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)dt
{
    if (isDone==false)
    {
        float fre = [[AudioManager sharedInstance] getFundamentalFrequency];
        float volume = [[AudioManager sharedInstance] getAverageVolume];
        NSLog(@"frequency: %f",fre);
    
        float startY = 768.0f * 0.29;
        float longY = 768.0f * 0.28;
    
        CGPoint position = slider.position;
    
        if (volume<-40) {
            fre = 0;
        }
    
        if (fre>650&&fre<800) {
            timer++;
            if (timer>180) {
                isDone = true;
                [self updateScene];
            }
        }
        else
            timer = 0;
    
    
        if (fre>1000) {
            fre = 1000.0f;
        }
    
        float cubePositionY = fre*longY/1000.0f;
        target = startY+cubePositionY;
    
        slider.position = ccp(slider.position.x, position.y+(target-position.y)/3);
    }
    
    
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
