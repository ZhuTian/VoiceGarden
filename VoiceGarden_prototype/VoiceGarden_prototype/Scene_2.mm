//
//  Scene_2.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_2.h"
#import "Scene_3B.h"
#import "GlobalVariable.h"
#import "Scene_3A.h"

@implementation Scene_2
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_2 *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_2 node];
    if([GlobalVariable sharedInstance].isSlience && [GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 1;
    }
    else if(![GlobalVariable sharedInstance].isSlience && [GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 2;
    }
    else if([GlobalVariable sharedInstance].isSlience && ![GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 3;
    }
    else
    {
        layer.sceneStatus = 4;
    }
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
        background = [CCSprite spriteWithFile:@"bg1.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        CCLabelTTF *label_1 = [CCLabelTTF labelWithString:@"I open my eyes." fontName:fontName fontSize:48];
		label_1.position =  ccp( size.width /2 , size.height/2 - 100);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        CCLabelTTF *label_2 = [CCLabelTTF labelWithString:@"I see a              garden." fontName:fontName fontSize:48];
		label_2.position =  ccp( size.width /2 , size.height/2 - 160);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        CCLabelTTF *label_3 = [CCLabelTTF labelWithString:@"I am surrounded by the sound of          ." fontName:fontName fontSize:48];
		label_3.position =  ccp( size.width /2 , size.height/2 - 220);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
		
        
        desolate_beautiful = [CCMenuItemFont itemWithString:@"desolate" block:^(id sender){
            if([GlobalVariable sharedInstance].isDesolate)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:1] withColor:ccWHITE]];
            }
            else
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:3] withColor:ccWHITE]];
            }
        }];
        [desolate_beautiful setFontName:fontName];
        [desolate_beautiful setFontSize:48];
        [desolate_beautiful setPosition:ccp( size.width/2 - 5, size.height/2 - 160)];
        [desolate_beautiful setColor:ccc3(100,100,100)];
        
        slience_XXX = [CCMenuItemFont itemWithString:@"slience" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3B sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3B sceneWithVar:3] withColor:ccWHITE]];
            }
        }];
        [slience_XXX setFontName:fontName];
        [slience_XXX setFontSize:48];
        [slience_XXX setPosition:ccp( size.width/2 + 350, size.height/2 - 220)];
        [slience_XXX setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:desolate_beautiful, slience_XXX, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

- (void)updateScene
{
    if(self.sceneStatus == 1)
    {
        
    }
    else if(self.sceneStatus == 2)
    {
        [slience_XXX setString:@"life"];
    }
    else if(self.sceneStatus == 3)
    {
        [desolate_beautiful setString:@"thriving"];
    }
    else if(self.sceneStatus == 4)
    {
        [slience_XXX setString:@"life"];
        [desolate_beautiful setString:@"thriving"];
        [background setTexture:[[CCTextureCache sharedTextureCache] addImage:@"bg5.jpg"]];
    }
}

@end
