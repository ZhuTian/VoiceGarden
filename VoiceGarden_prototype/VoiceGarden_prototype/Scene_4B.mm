//
//  Scene_4B.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_4B.h"
#import "Scene_3A.h"

@implementation Scene_4B
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_4B *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_4B node];
    layer.sceneStatus = _sceneType;
    [layer updateScene];
	
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
        CCSprite* background = [CCSprite spriteWithFile:@"bg1.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        int _fontSize = 30;
        
        label_1 = [CCLabelTTF labelWithString:@"The wind tells me a message." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 , size.height/2 - 40);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"\"I came from far away. I have seen much." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 , size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"There is a door beyond the path." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 , size.height/2 - 160);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"But you need to back to find a key. \"" fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 , size.height/2 - 220);
        label_4.color = ccc3(0, 0, 0);
		[self addChild: label_4];
		
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:3] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:back, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else if(self.sceneStatus == 2)
    {
        label_3.string = @"\"There is a door beyond the path";
        label_4.string = @"that awaits you\"";
    }
}

@end
