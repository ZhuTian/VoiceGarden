//
//  Scene_5B.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_5B.h"
#import "Scene_4C.h"

@implementation Scene_5B
@synthesize sceneStatus;
@synthesize preScene;

+(CCScene *) sceneWithVar: (int)_sceneType preScene:(int)_preScene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_5B *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_5B node];
    layer.sceneStatus = _sceneType;
    layer.preScene = _preScene;
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
        
        
        label_1 = [CCLabelTTF labelWithString:@"It's April." fontName:fontName fontSize:48];
		label_1.position =  ccp( size.width /2 , size.height/2 - 100);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"But is it spring?" fontName:fontName fontSize:48];
		label_2.position =  ccp( size.width /2 , size.height/2 - 160);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Flower dies, tree leaf falls." fontName:fontName fontSize:48];
		label_3.position =  ccp( size.width /2 , size.height/2 - 220);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
		
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            if(self.preScene == 1 || self.preScene == 3)
            {
                if(self.sceneStatus == 2)
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:3] withColor:ccWHITE]];
                else
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.preScene == 2 || self.preScene == 4)
            {
                if(self.sceneStatus == 2)
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:4] withColor:ccWHITE]];
                else
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:2] withColor:ccWHITE]];
            }
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:48];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:back, action, nil];
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
    if(self.sceneStatus == 2)
    {
        label_3.string = @"Flower blooming, tree leaf shinning";
    }
}

@end
