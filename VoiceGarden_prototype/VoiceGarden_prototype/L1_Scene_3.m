//
//  Scene_3.m
//  VoiceGarden_Tutorial
//
//  Created by Tian Zhu on 12-11-27.
//
//

#import "L1_Scene_3.h"
#import "L1_Scene_2.h"
#import "L1_Scene_1.h"

@implementation L1_Scene_3
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"fight_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        int _fontSize = 30;
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        
        label1 = [CCLabelTTF labelWithString:@"I fight to wake up." fontName:fontName fontSize:_fontSize];
		label1.position =  ccp( size.width /2 - 350, size.height/2 + 60);
        label1.color = ccc3(0, 0, 0);
        label1.anchorPoint = ccp(0, 0.5);
        [self addChild:label1];
        
        label2 = [CCLabelTTF labelWithString:@"My                  is awake." fontName:fontName fontSize:_fontSize];
		label2.position =  ccp( size.width /2 - 350, size.height/2);
        label2.color = ccc3(0, 0, 0);
        label2.anchorPoint = ccp(0, 0.5);
        [self addChild:label2];
        
        
        awarness = [CCMenuItemFont itemWithString:@"awarness" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[L1_Scene_1 sceneWithPreviousScene:NULL PreviousStatus:0 SceneStatus:2] withColor:ccWHITE]];
        }];
        [awarness setFontName:fontName];
        [awarness setFontSize:_fontSize];
        [awarness setPosition:ccp( size.width/2 - 225, size.height/2)];
        [awarness setIsEnabled:false];
        [awarness setColor:ccc3(0,0,0)];
        
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self->currentSceneStatus = 1;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(0,0,0)];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[L1_Scene_2 sceneWithPreviousScene:NULL PreviousStatus:0 SceneStatus:1] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp(100, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:awarness, back, action, nil];
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
        [awarness setIsEnabled:true];
        [awarness setColor:ccc3(100, 100, 100)];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [awarness runAction: [CCSequence actions:action, action2, nil]];
        [awarness runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
}
@end
