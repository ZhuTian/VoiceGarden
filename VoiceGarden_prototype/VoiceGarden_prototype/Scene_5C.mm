//
//  Scene_5C.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_4C.h"
#import "Scene_6A.h"
#import "Scene_5C.h"
#import "GlobalVariable.h"

@implementation Scene_5C
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_5C *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_5C node];
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
        
        
        label_1 = [CCLabelTTF labelWithString:@"It looks like fall in the garden." fontName:fontName fontSize:48];
		label_1.position =  ccp( size.width /2 , size.height/2 - 100);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"The bird will not come back." fontName:fontName fontSize:48];
		label_2.position =  ccp( size.width /2 , size.height/2 - 160);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@" " fontName:fontName fontSize:48];
		label_3.position =  ccp( size.width /2 , size.height/2 - 220);
        label_3.color = ccc3(0, 0, 0);
        label_3.visible = false;
        [self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@" " fontName:fontName fontSize:48];
		label_4.position =  ccp( size.width /2 , size.height/2 - 280);
        label_4.color = ccc3(0, 0, 0);
        label_4.visible = false;
        [self addChild:label_4];
		
		
        spring = [CCMenuItemFont itemWithString:@"spring" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_6A sceneWithVar:1] withColor:ccWHITE]];
        }];
        [spring setFontName:fontName];
        [spring setFontSize:48];
        [spring setPosition:ccp( size.width/2 + 40, size.height/2 - 100)];
        [spring setIsEnabled:true];
        [spring setColor:ccc3(100,100,100)];
        spring.visible = false;
        
        key_button = [CCMenuItemFont itemWithString:@"key" block:^(id sender){
            [GlobalVariable sharedInstance].haveKey = true;
            [self updateScene];
        }];
        [key_button setFontName:fontName];
        [key_button setFontSize:48];
        [key_button setPosition:ccp( size.width/2 - 40, size.height/2 - 280)];
        [key_button setIsEnabled:true];
        [key_button setColor:ccc3(100,100,100)];
        spring.visible = false;
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:2] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:4] withColor:ccWHITE]];
            }
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
        
        key = [CCMenuItemImage itemWithNormalImage:@"key.png" selectedImage:@"key.png" block:^(id sender) {
            //            [jump setString:@"Forward"];
        }];
        [key setPosition:ccp(size.width/2, size.height - 150)];
        [key setScale:0.3f];
        key.visible = false;
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:spring, back, key, key_button, nil];
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
        
    }
    else if(self.sceneStatus == 2)
    {
        label_1.string = @"It's         .";
        label_2.string = @"The bird remembers the blooming flowers.";
        label_3.string = @"She is back to save the garden.";
        label_4.string = @"She gives me a        to save the garden";
        label_3.visible = true;
        label_4.visible = true;

        spring.visible = true;
    }
    
    key.visible = [GlobalVariable sharedInstance].haveKey;
}

@end
