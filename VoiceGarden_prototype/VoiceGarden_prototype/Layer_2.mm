//
//  Layer_2.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-10-31.
//
//

#import "Layer_2.h"
#import "AppDelegate.h"
#import "HelloWorldLayer.h"

@implementation Layer_2

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Layer_2 *layer = [Layer_2 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"I want to go         " fontName:@"Marker Felt" fontSize:64];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
        //		// Achievement Menu Item using blocks
        //		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
        //
        //
        //			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
        //			achivementViewController.achievementDelegate = self;
        //
        //			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
        //
        //			[[app navController] presentModalViewController:achivementViewController animated:YES];
        //
        //			[achivementViewController release];
        //		}
        //									   ];
        //
        //		// Leaderboard Menu Item using blocks
        //		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
        //
        //
        //			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
        //			leaderboardViewController.leaderboardDelegate = self;
        //
        //			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
        //
        //			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
        //
        //			[leaderboardViewController release];
        //		}
        //									   ];
        //
        
        CCMenuItemFont *jump = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [jump setFontName:@"Marker Felt"];
        [jump setFontSize:64];
        [jump setPosition:ccp( size.width/2 + 165, size.height/2)];
        
        CCMenuItemImage *actionButton = [CCMenuItemImage itemWithNormalImage:@"Icon.png" selectedImage:@"Icon.png" block:^(id sender) {
                       [jump setString:@"Forward"];
                        [jump setPosition:ccp( size.width/2 + 190, size.height/2)];
                    }];
        [actionButton setPosition:ccp(size.width/2, 200)];
        CCMenuItem *menu = [CCMenu menuWithItems:jump, actionButton, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
//        
//        CCMenuItemImage *actionButton = [CCMenuItemImage itemWithNormalImage:@"Icon.png" selectedImage:@"Icon.png" block:^(id sender) {
//            [jump setString:@"Forward"];
//        }];
//        
//        CCMenu *actionMenu = [CCMenu menuWithItems:actionButton, nil];
//        [menu setPosition:ccp( size.width/2, size.height/2)];
//        [self addChild:actionMenu];
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end
