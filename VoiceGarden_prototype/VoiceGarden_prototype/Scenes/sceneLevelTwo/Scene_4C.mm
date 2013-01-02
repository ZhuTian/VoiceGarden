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
#import "GlobalVariable.h"
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
        CCSprite* background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background];
        
        [self initSprites];
        
        label_1 = [CCLabelTTF labelWithString:@"All Colors and sounds of life are gone" fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 140, size.height/2 - 200);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"along with the           taken away by the bird." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 85, size.height/2 - 250);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
          
        label_3 = [CCLabelTTF labelWithString:@"The bird will come back in the         ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 150, size.height/2 - 300);
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
        [spring setPosition:ccp( size.width/2 + 45, size.height/2 - 300)];
        [spring setIsEnabled:true];
        [spring setColor:ccc3(100,100,100)];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id actionMove = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id actionMove2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [spring runAction: [CCSequence actions:actionMove, actionMove2, nil]];
        [spring runAction:[CCRepeatForever actionWithAction:[CCSequence actions:actionMove, actionMove2, nil]]];
        
        
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
        [key setPosition:ccp( size.width/2 - 152, size.height/2 - 250)];
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
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite];
        }
        
	}
	return self;
}

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2 - 520, size.height/2 + 80);
    silence.opacity = 255;
    silence.scale = 0.5;
    [self addChild:silence];
    
    silence_light = [CCSprite spriteWithFile:@"silence_light.png"];
    silence_light.position = ccp(size.width/2 - 200, size.height/2 + 100);
    silence_light.opacity = 255;
    silence_light.scale = 0.5;
    [self addChild:silence_light];
    
    tree = [CCSprite spriteWithFile:@"key_tree_right.png"];
    tree.position = ccp(size.width/2 + 250, size.height/2 );
    tree.opacity = 255;
    tree.scale = 0.7;
    [self addChild:tree];
    
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
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [key runAction: [CCSequence actions:action, action2, nil]];
        [key runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
            
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
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [key runAction: [CCSequence actions:action, action2, nil]];
        [key runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        
    }
}

@end
