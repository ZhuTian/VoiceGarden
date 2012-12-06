//
//  Scene_2.m
//  VoiceGarden_Tutorial
//
//  Created by Tian Zhu on 12-11-27.
//
//

#import "L1_Scene_2.h"
#import "L1_Scene_1.h"
#import "L1_Scene_3.h"

@implementation L1_Scene_2

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"asleep_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        int _fontSize = 30;
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        
        label1 = [CCLabelTTF labelWithString:@"Is it a dream?" fontName:fontName fontSize:_fontSize];
		label1.position =  ccp( size.width /2 - 350, size.height/2 + 50);
        label1.color = ccc3(0, 0, 0);
        label1.anchorPoint = ccp(0, 0.5);
        [self addChild:label1];
        
        label2 = [CCLabelTTF labelWithString:@"The sun rises and sets." fontName:fontName fontSize:_fontSize];
		label2.position =  ccp( size.width /2 - 350, size.height/2);
        label2.color = ccc3(0, 0, 0);
        label2.anchorPoint = ccp(0, 0.5);
        [self addChild:label2];
        
        label3 = [CCLabelTTF labelWithString:@"I'm in slow motion." fontName:fontName fontSize:_fontSize];
		label3.position =  ccp( size.width /2 - 350, size.height/2 - 50);
        label3.color = ccc3(0, 0, 0);
        label3.anchorPoint = ccp(0, 0.5);
        [self addChild:label3];
        
        label4 = [CCLabelTTF labelWithString:@"I               to wake up." fontName:fontName fontSize:_fontSize];
		label4.position =  ccp( size.width /2 - 350, size.height/2 - 100);
        label4.color = ccc3(0, 0, 0);
        label4.anchorPoint = ccp(0, 0.5);
        [self addChild:label4];
        
        
        struggle = [CCMenuItemFont itemWithString:@"struggle" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[L1_Scene_3 sceneWithPreviousScene:[self class] PreviousStatus:1 SceneStatus:0] withColor:ccWHITE]];
        }];
        [struggle setFontName:fontName];
        [struggle setFontSize:_fontSize];
        [struggle setPosition:ccp( size.width/2 - 270, size.height/2 - 100)];
        [struggle setIsEnabled:false];
        [struggle setColor:ccc3(0,0,0)];
        
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self->currentSceneStatus = 1;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(0,0,0)];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[L1_Scene_1 sceneWithPreviousScene:NULL PreviousStatus:0 SceneStatus:1] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp(100, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:action, struggle, back, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

-(void)updateScene
{
    if(currentSceneStatus == 0)
    {
        
    }
    else if(currentSceneStatus == 1)
    {
        [struggle setIsEnabled:true];
        [struggle setColor:ccc3(100, 100, 100)];
        [struggle setString:@"fight"];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [struggle runAction: [CCSequence actions:action, action2, nil]];
        [struggle runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
}

@end
