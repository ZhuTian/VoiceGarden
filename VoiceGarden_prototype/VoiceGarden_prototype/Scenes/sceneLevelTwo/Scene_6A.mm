//
//  Scene_6A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "Scene_2.h"
#import "Scene_6A.h"
#import "GlobalVariable.h"
#define _fontSize 30

@implementation Scene_6A
+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_6A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_6A node];
	
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
        transitionTime = 1;
        
        label_1 = [CCLabelTTF labelWithString:@"I hear faint sounds in the garden." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 , size.height/2);
        label_1.color = ccc3(0, 0, 0);
        label_1.opacity = 0;
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"It's  the echos of         returning." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 , size.height/2 - 60);
        label_2.color = ccc3(0, 0, 0);
        label_2.opacity = 0;
		[self addChild: label_2];
		
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        
        XXX = [CCMenuItemFont itemWithString:@"life" block:^(id sender){
            [GlobalVariable sharedInstance].isSlience = false;
            [self sceneTransition];
        }];
        [XXX setFontName:fontName];
        [XXX setFontSize:_fontSize];
        [XXX setPosition:ccp( size.width/2 + 50, size.height/2 - 60)];
        [XXX setIsEnabled:true];
        [XXX setColor:ccc3(100,100,100)];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id actionXXX = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id actionXXX2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [XXX runAction: [CCSequence actions:actionXXX, actionXXX2, nil]];
        [XXX runAction:[CCRepeatForever actionWithAction:[CCSequence actions:actionXXX, actionXXX2, nil]]];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:2] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            //
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:XXX, nil];
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
    
    CCSprite* background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background];
    
    treeLeft = [CCSprite spriteWithFile:@"finalSpring_tree_L.png"];
    treeLeft.position = ccp(size.width/2,size.height/2);
    [self addChild:treeLeft];
    
    treeRight = [CCSprite spriteWithFile:@"tree_flower_nest_egg.png"];
    treeRight.position = ccp(size.width/2+210,size.height/2+200);
    treeRight.scale = 0.9;
    [self addChild:treeRight];
    
    bottomRight = [CCSprite spriteWithFile:@"finalSpring_BottomRight.png"];
    bottomRight.position=ccp(size.width/2, size.height/2);
    [self addChild:bottomRight];
    
    //transition 
    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2 + 350, size.height/2 + 150);
    silence.scale = 0.8f;
    silence.opacity = 0;
    [self addChild: silence z:SCENE_Z];
    
    desolate = [CCSprite spriteWithFile:@"desolate.png"];
    desolate.position = ccp(size.width/2 + 250, size.height/2 + 150);
    desolate.scale = 0.8f;
    desolate.opacity = 0;
    [self addChild: desolate z:SCENE_Z];
    
    garden = [CCSprite spriteWithFile:@"garden.png"];
    garden.position = ccp(size.width/2 + 300, size.height/2 - 50);
    garden.opacity = 0;
    [self addChild: garden z:SCENE_Z];
    
}

-(void)sceneTransition
{
    id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_1 runAction:label1Action];
    
    id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_2 runAction:label2Action];
    
    id treeLeftAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                         [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    [treeLeft runAction:treeLeftAction];
    
    id treeRightAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                         [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    [treeRight runAction:treeRightAction];
    
    id bottomRightAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                         [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    [bottomRight runAction:bottomRightAction];
    
    
    id catAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                            [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    [cat runAction:catAction];
    
    id silenceAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:255],
                    [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    [silence runAction:silenceAction];
    
    id desolateAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:255],
                        [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    [desolate runAction:desolateAction];

    id _gardenAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:255],
                        [CCMoveBy actionWithDuration:transitionTime position:ccp(-300, 0)],nil];
    id gardenAction = [CCSequence actions:_gardenAction, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
    
    [garden runAction:gardenAction];    
}

-(void)nextScene
{
    [[CCDirector sharedDirector] replaceScene:[Scene_2 sceneWithVar:2]];
}


@end
