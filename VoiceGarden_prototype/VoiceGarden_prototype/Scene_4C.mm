//
//  Scene_4C.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_4C.h"
#import "Scene_5B.h"
#import "Scene_5C.h"
#define _fontSize 30


@implementation Scene_4C

@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_4C *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_4C node];
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
        CCSprite* background = [CCSprite spriteWithFile:@"garden_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        label_1 = [CCLabelTTF labelWithString:@"Colors, sounds, and life are gone along" fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 , size.height/2 - 50);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"with the           taken away by the bird." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 + 15, size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
          
        label_3 = [CCLabelTTF labelWithString:@"The bird will come back in         ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 40, size.height/2 - 150);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
		
        
        spring = [CCMenuItemFont itemWithString:@"spring" block:^(id sender){
            if(self.sceneStatus == 1 || self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5B sceneWithVar:1 preScene:self.sceneStatus] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 3 || self.sceneStatus == 4)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5B sceneWithVar:2 preScene:self.sceneStatus] withColor:ccWHITE]];
            }
        }];
        [spring setFontName:fontName];
        [spring setFontSize:_fontSize];
        [spring setPosition:ccp( size.width/2 + 125, size.height/2 - 150)];
        [spring setIsEnabled:true];
        [spring setColor:ccc3(100,100,100)];
        
        key = [CCMenuItemFont itemWithString:@"secret" block:^(id sender){
            if(self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5C sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 4)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5C sceneWithVar:2] withColor:ccWHITE]];
            }
        }];
        [key setFontName:fontName];
        [key setFontSize:_fontSize];
        [key setPosition:ccp( size.width/2 - 92, size.height/2 - 100)];
        [key setIsEnabled:false];
        [key setColor:ccc3(0,0,0)];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                self.sceneStatus = 2;
            }
            else if(self.sceneStatus == 3)
            {
                self.sceneStatus = 4;
            }
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:spring, key, action, nil];
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
    if(self.sceneStatus == 1)
    {
        [key setIsEnabled:false];
        [key setString:@"secret"];
        [key setColor:ccc3(0, 0, 0)];
    }
    else if(self.sceneStatus == 2)
    {
        [key setIsEnabled:true];
        [key setString:@"key"];
        [key setColor:ccc3(100, 100, 100)];
    }
    else if(self.sceneStatus == 3)
    {
        [key setIsEnabled:false];
        [key setString:@"secret"];
        [key setColor:ccc3(0, 0, 0)];
    }
    else if(self.sceneStatus == 4)
    {
        [key setIsEnabled:true];
        [key setString:@"key"];
        [key setColor:ccc3(100, 100, 100)];
    }
}

@end
