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
//#define _fontSize 30

#define SCENE_5B 1
#define SCENE_5C 2

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
        
        [self initSprites];
        
        transitionTime = 1.0f;
        
        label_1 = [CCLabelTTF labelWithString:@"Colors, sounds, and life are gone along" fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 400, size.height/2 - 200);
        
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"with the           taken away by the bird." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 400, size.height/2 - 250);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"The bird will come back in         ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 400, size.height/2 - 300);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		[self addChild: label_3];
        
        //Fade in scripts
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
		
        spring = [CCMenuItemFont itemWithString:@"spring" block:^(id sender){
            _nextScene = SCENE_5B;
            [self sceneTransition];
        }];
        [spring setFontName:fontName];
        [spring setFontSize:_fontSize];
        [spring setPosition:ccp( size.width/2 - 90, size.height/2 - 300)];
        [spring setIsEnabled:true];
        [spring setColor:ccc3(100,100,100)];
        spring.opacity = 0;
        
        id fadein = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id actionMove = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id actionMove2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [spring runAction: [CCSequence actions:fadein, actionMove, actionMove2, nil]];
        [spring runAction:[CCRepeatForever actionWithAction:[CCSequence actions:actionMove, actionMove2, nil]]];
        
        key = [CCMenuItemFont itemWithString:@"secret" block:^(id sender){
            _nextScene = SCENE_5C;
            [self sceneTransition];
        }];
        [key setFontName:fontName];
        [key setFontSize:_fontSize];
        [key setPosition:ccp( size.width/2 - 260, size.height/2 - 250)];
        [key setIsEnabled:false];
        [key setColor:ccc3(0,0,0)];
        key.opacity = 0;
        
        id keyAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [key runAction:keyAction];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){   /*  DUMB  func*/   }];
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
        
        CCMenuItem *menu = [CCMenu menuWithItems:spring, key, nil];
		[menu setPosition:ccp( 0, 0)];
        [self addChild:menu];
        
        if ([GlobalVariable sharedInstance].haveKey == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key_collect.png"];
            keySprite.position = ccp(950, 200);
            [self addChild:keySprite z: 10 tag:20];
        }
	}
	return self;
}

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //Add common background
    background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background z:BACKGROUND_Z];
    
    //Add Scene Sprites

    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2 - 150, size.height/2 + 120);
    silence.scale = 0.7f;
    [self addChild: silence z:BACKGROUND_Z];
    
    tree_nest = [CCSprite spriteWithFile:@"tree_nest.png"];
    tree_nest.position = ccp(size.width/2 + 250, size.height/2 - 100);
    tree_nest.scale = 0.9f;
    [self addChild: tree_nest z:BACKGROUND_Z];
    
    treeLeft = [CCSprite spriteWithFile:@"finalSpring_tree_L.png"];
    treeLeft.position = ccp(size.width/2 ,size.height/2 - 200);
    treeLeft.opacity = 0;
    [self addChild:treeLeft];
    
    springBottom = [CCSprite spriteWithFile:@"finalSpring_BottomRight.png"];
    springBottom.position=ccp(size.width/2 , size.height/2 - 200);
    springBottom.opacity = 0;
    [self addChild:springBottom];
    
    keyTreeLeft = [CCSprite spriteWithFile:@"finalSpring_tree_L.png"];
    keyTreeLeft.position = ccp(size.width/2 - 200, size.height/2);
    keyTreeLeft.opacity = 0;
    [self addChild:keyTreeLeft];    
}

-(void)sceneTransition
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_1 runAction:label1Action];
    id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_2 runAction:label2Action];
    id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_3 runAction:label3Action];
    id springAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [spring runAction:springAction];
    id keyAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [key runAction:keyAction];
    
    if (_nextScene == SCENE_5B) {
        
        id silenceAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                                            [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, 200)]],
                                            nil];
        [silence runAction:silenceAction];
        
        id treeLeftAction = [CCSpawn actions:   [CCFadeTo actionWithDuration:transitionTime opacity:255],
                                                [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, 200)]],
                                                nil];
        [treeLeft runAction:treeLeftAction];
        
        id bottomAction = [CCSpawn actions: [CCFadeTo actionWithDuration:transitionTime opacity:255],
                                            [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, 200)] ],
                                            nil];
        [springBottom runAction:bottomAction];
        
        id _treeNestAction = [CCSpawn actions:  [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2+210,size.height/2+200)]],
                                                [CCScaleTo actionWithDuration:transitionTime scale:0.9],
                                                nil];
        id treeNestAction = [CCSequence actions:_treeNestAction,[CCCallFunc actionWithTarget:self selector:@selector(nextScene)],nil];
        [tree_nest runAction:treeNestAction];
    }
    else if(_nextScene == SCENE_5C){
        id silenceAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                            [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, -100)]],
                            nil];
        [silence runAction:silenceAction];
        
        id treeNestAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 250, size.height/2 - 200)]],
                                             [CCScaleTo actionWithDuration:transitionTime scale:1.0f],nil];
        [tree_nest runAction:treeNestAction];
        
        id _keyTreeLeftAction = [CCSpawn actions:   [CCFadeTo actionWithDuration:transitionTime opacity:255],
                                                    [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2, size.height/2)]],nil];
        id keyTreeLeftAction = [CCSequence actions:_keyTreeLeftAction,[CCCallFunc actionWithTarget:self selector:@selector(nextScene)],nil];
        [keyTreeLeft runAction:keyTreeLeftAction];
        
        
    }
}

-(void)nextScene
{
    if(_nextScene == SCENE_5B)
    {
        if (self.sceneStatus==1 || self.sceneStatus == 2) {
            [[CCDirector sharedDirector] replaceScene:[Scene_5B sceneWithVar:1 preScene:self.sceneStatus]];
        }
        else if(self.sceneStatus ==3 || self.sceneStatus == 4){
            [[CCDirector sharedDirector] replaceScene:[Scene_5B sceneWithVar:2 preScene:self.sceneStatus]];
        }
    }
    else if(_nextScene == SCENE_5C)
    {
        if (self.sceneStatus==1 || self.sceneStatus == 2)
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_5C sceneWithVar:1]];
        }
        else if(self.sceneStatus ==3 || self.sceneStatus == 4)
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_5C sceneWithVar:2]];
        }
    }  
}

-(void)updateScene
{
    if(self.sceneStatus == 1 || self.sceneStatus == 2)
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
    else if(self.sceneStatus == 3 || self.sceneStatus == 4)
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
