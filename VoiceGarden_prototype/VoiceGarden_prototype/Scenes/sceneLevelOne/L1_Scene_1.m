//
//  Scene_1.m
//  VoiceGarden_Tutorial
//
//  Created by Tian Zhu on 12-11-26.
//
//

#import "L1_Scene_1.h"
#import "L1_Scene_2.h"
#import "StartScene.h"

@implementation L1_Scene_1

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        background = [CCSprite spriteWithFile:@"Prologue_bg_upperlayer.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        int _fontSize = 30;
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        
        label1 = [CCLabelTTF labelWithString:@"I am            ." fontName:fontName fontSize:_fontSize];
        
		// position the label on the center of the screen
		label1.position =  ccp( size.width /2 , size.height/2 + 50);
        label1.color = ccc3(0, 0, 0);
        [self addChild:label1];
        
        label2 = [CCLabelTTF labelWithString:@"I have                to say." fontName:fontName fontSize:_fontSize];
        
		// position the label on the center of the screen
		label2.position =  ccp( size.width /2 , size.height/2);
        label2.color = ccc3(0, 0, 0);
        [self addChild:label2];
        
        
        asleep = [CCMenuItemFont itemWithString:@"asleep" block:^(id sender){
            if(currentSceneStatus == 1)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[L1_Scene_2 sceneWithPreviousScene:[self class] PreviousStatus:currentSceneStatus SceneStatus:0] withColor:ccWHITE]];
            }
        }];
        [asleep setFontName:fontName];
        [asleep setFontSize:_fontSize];
        [asleep setPosition:ccp( size.width/2 + 25, size.height/2 + 50)];
        [asleep setIsEnabled:false];
        [asleep setColor:ccc3(0,0,0)];
        
        nothing = [CCMenuItemFont itemWithString:@"nothing" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [nothing setFontName:fontName];
        [nothing setFontSize:_fontSize];
        [nothing setPosition:ccp( size.width/2 - 5, size.height/2)];
        [nothing setIsEnabled:false];
        [nothing setColor:ccc3(0,0,0)];
        
        
        action_button = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            if(currentSceneStatus == 0)
            {
                self->currentSceneStatus = 1;
                [self updateScene];
            }
        }];
        [action_button setFontName:fontName];
        [action_button setFontSize:_fontSize];
        [action_button setPosition:ccp( size.width - 100, 30)];
        [action_button setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartScene scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp(100, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:action_button, asleep, nothing, back, nil];
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
        [asleep setIsEnabled:true];
        [asleep setColor:ccc3(100, 100, 100)];
        [nothing setString:@"something"];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [asleep runAction: [CCSequence actions:action, action2, nil]];
        [asleep runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
    else if(currentSceneStatus == 2)
    {
        [asleep setString:@"awake"];
        [nothing setString:@"something"];
        [background setTexture:[[CCTextureCache sharedTextureCache] addImage:@"Prologue_bg_end.png"]];
        [action_button setIsEnabled:false];
        action_button.visible = false;
    }
}


@end

