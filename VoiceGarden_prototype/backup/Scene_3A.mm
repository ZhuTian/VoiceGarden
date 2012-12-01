//
//  Scene_3A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_3A.h"
#import "Scene_4A.h"
#import "Scene_4B.h"
#import "GlobalVariable.h"

@implementation Scene_3A
@synthesize sceneStatus;
extern bool haveKey;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_3A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_3A node];
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
        
        
        label_1 = [CCLabelTTF labelWithString:@"I look to my left. There is a       " fontName:fontName fontSize:48];
		label_1.position =  ccp( size.width /2 , size.height/2 - 40);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"I look to my right." fontName:fontName fontSize:48];
		label_2.position =  ccp( size.width /2 , size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Feeling the         graze my face, my ear." fontName:fontName fontSize:48];
		label_3.position =  ccp( size.width /2 , size.height/2 - 160);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"It's like talking to me." fontName:fontName fontSize:48];
		label_4.position =  ccp( size.width /2 , size.height/2 - 220);
        label_4.color = ccc3(0, 0, 0);
		[self addChild: label_4];
        
        label_5 = [CCLabelTTF labelWithString:@"I start to run to chace its word." fontName:fontName fontSize:48];
		label_5.position =  ccp( size.width /2 , size.height/2 - 280);
        label_5.color = ccc3(0, 0, 0);
		[self addChild: label_5];
		
        
        road = [CCMenuItemFont itemWithString:@"road" block:^(id sender){
            if(self.sceneStatus == 3)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4A sceneWithVar:2 preScene:self.sceneStatus] withColor:ccWHITE]];
            }
            else
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4A sceneWithVar:1 preScene:self.sceneStatus] withColor:ccWHITE]];
            }
        }];
        [road setFontName:fontName];
        [road setFontSize:48];
        [road setPosition:ccp( size.width/2 + 310, size.height/2 - 40)];
        [road setIsEnabled:true];
        [road setColor:ccc3(100,100,100)];
        
        wind = [CCMenuItemFont itemWithString:@"wind" block:^(id sender){
            if([GlobalVariable sharedInstance].haveKey)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4B sceneWithVar:2] withColor:ccWHITE]];

            }
            else
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4B sceneWithVar:1] withColor:ccWHITE]];
            }
        }];
        [wind setFontName:fontName];
        [wind setFontSize:48];
        [wind setPosition:ccp( size.width/2 - 130, size.height/2 - 160)];
        [wind setIsEnabled:false];
        [wind setColor:ccc3(0,0,0)];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        key = [CCMenuItemImage itemWithNormalImage:@"key.png" selectedImage:@"key.png" block:^(id sender) {
            //            [jump setString:@"Forward"];
                    }];
        [key setPosition:ccp(size.width/2, size.height - 150)];
        [key setScale:0.3f];
        key.visible = false;

        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                self.sceneStatus = 2;
            }
            
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:48];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:road, action, wind, key, nil];
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
    else if(self.sceneStatus == 2 || self.sceneStatus == 3)
    {
        [wind setIsEnabled: true];
        [wind setColor:ccc3(100, 100, 100)];
        label_5.string = @"I start to run to catch its word";
    }
    
    key.visible = [GlobalVariable sharedInstance].haveKey;
}

@end
