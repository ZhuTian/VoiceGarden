//
//  Scene_1.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_1.h"
#import "Scene_2.h"

@implementation Scene_1

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene_1 *layer = [Scene_1 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"garden_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        int _fontSize = 30;
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"I am in a            ." fontName:fontName fontSize:_fontSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 - 100, size.height/2 - 50);
        label.color = ccc3(0, 0, 0);
        label.anchorPoint = ccp(0, 0.5);
        [self addChild:label];
        
        
        
        CCMenuItemFont *button_garden = [CCMenuItemFont itemWithString:@"garden" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [button_garden setFontName:fontName];
        [button_garden setFontSize:_fontSize];
        [button_garden setPosition:ccp( size.width/2 + 85, size.height/2 - 50)];
        [button_garden setColor:ccc3(100,100,100)];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [button_garden runAction: [CCSequence actions:action, action2, nil]];
        [button_garden runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        CCMenuItem *menu = [CCMenu menuWithItems:button_garden, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}



@end
