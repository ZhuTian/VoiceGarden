//
//  IntroLayer.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-10-31.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "Scene_1.h"
#import "Scene_2.h"
#import "Scene_3B.h"
#import "Scene_4C.h"
#import "Scene_5B.h"
#import "Scene_5C.h"
#import "Scene_6A.h"
#import "Scene_3A.h"
#import "Scene_4A.h"
#import "Scene_4B.h"
#import "Scene_5A.h"
#import "Scene_5D.h"
#import "Scene_6B.h"
#import "Scene_7A.h"
#import "Scene_8A.h"
#import "Scene_Pratice_0.h"
#import "Scene_Pratice_3.h"
#import "StartScene.h"



#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(void) onEnter
{
	[super onEnter];

	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];

	CCSprite *background;
	
	if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
		background = [CCSprite spriteWithFile:@"Default.png"];
		background.rotation = 90;
	} else {
		background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
	}
	background.position = ccp(size.width/2, size.height/2);

	// add the label as a child to this Layer
	[self addChild: background];
	
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition:) delay:1];
}

-(void) makeTransition:(ccTime)dt
{
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4A sceneWithVar:2 preScene:1] withColor:ccWHITE]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_7A sceneWithVar:1] withColor:ccWHITE]];
}
@end
