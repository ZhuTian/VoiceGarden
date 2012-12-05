//
//  Scene_4A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_4A.h"
#import "Scene_3A.h"
#import "Scene_5A.h"
#import "Scene_5D.h"
#import "GlobalVariable.h"

@implementation Scene_4A
@synthesize sceneStatus;
@synthesize preSceneStatus;


+(CCScene *) sceneWithVar: (int)_sceneType  preScene:(int)_preSceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_4A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_4A node];
    layer.sceneStatus = _sceneType;
    layer.preSceneStatus = _preSceneType;
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
        
        int _fontSize = 30;
        
        
        label_1 = [CCLabelTTF labelWithString:@"The fear of unknown " fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 160, size.height/2 + 70);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"keeps me from moving forward." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 160, size.height/2 + 20);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Should I make                   ?" fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 160, size.height/2 - 30);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
		//[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"Should I look for               ?" fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 - 160, size.height/2 - 80);
        label_4.color = ccc3(0, 0, 0);
        label_4.anchorPoint = ccp(0, 0.5);
		//[self addChild: label_2];
		
        
        my = [CCMenuItemFont itemWithString:@"my own way" block:^(id sender){
           [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5D sceneWithVar:1] withColor:ccWHITE]];
        }];
        [my setFontName:fontName];
        [my setFontSize:_fontSize];
        [my setPosition:ccp( size.width/2 + 130, size.height/2 - 30)];
        [my setIsEnabled:false];
        [my setColor:ccc3(100,100,100)];
        my.visible = false;
        
        
        company = [CCMenuItemFont itemWithString:@"company" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5A sceneWithVar:1] withColor:ccWHITE]];
        }];
        [company setFontName:fontName];
        [company setFontSize:_fontSize];
        [company setPosition:ccp( size.width/2 + 150, size.height/2 - 80)];
        [company setIsEnabled:false];
        [company setColor:ccc3(100,100,100)];
        company.visible = false;
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [my runAction: [CCSequence actions:action, action2, nil]];
        [my runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [company runAction: [CCSequence actions:action_2, action2_2, nil]];
        [company runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:self.preSceneStatus] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:back, my, company, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite];
        }
        
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
        label_1.string = @"The road splits before me";
        label_2.string = @"Only I can decide my path";
        [self addChild:label_3];
        [self addChild:label_4];
        [my setIsEnabled:true];
        my.visible = true;
        [my setColor:ccc3(100,100,100)];
        [company setIsEnabled:true];
        company.visible = true;
        [company setColor:ccc3(100,100,100)];
        [background setTexture:[[CCTextureCache sharedTextureCache] addImage:@"road_bg.png"]];
    }
}
@end
