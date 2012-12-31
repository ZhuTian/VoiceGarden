//
//  Scene_1.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_1.h"
#import "Scene_2.h"
#define _fontSize 30

@implementation Scene_1

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene_1 *layer = [Scene_1 node];
	
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
        transitionTime = 2.0f;
        
        label = [CCLabelTTF labelWithString:@"I am in a            ." fontName:fontName fontSize:_fontSize];
		label.position =  ccp( size.width /2 - 100, size.height/2 - 50);
        label.color = ccc3(0, 0, 0);
        label.anchorPoint = ccp(0, 0.5);
        label.opacity = 0;
        [self addChild:label];
        id labelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label runAction:labelAction];
       
        button_garden = [CCMenuItemFont itemWithString:@"garden" block:^(id sender){
            [self SceneTransition];
        }];
        [button_garden setFontName:fontName];
        [button_garden setFontSize:_fontSize];
        [button_garden setPosition:ccp( size.width/2 + 85, size.height/2 - 50)];
        [button_garden setColor:ccc3(100,100,100)];
        button_garden.opacity = 0;
        
        id gardenButtonAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        [button_garden runAction: [CCSequence actions:gardenButtonAction,action, action2, nil]];
        [button_garden runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartScene scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp(100, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:button_garden, back, nil];
		[menu setPosition:ccp( 0, 0)];
		[self addChild:menu  z:TEXT_Z];
        
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
    silence.position = ccp(size.width/2 + 50, size.height/2 + 150);
    silence.scale = 0.8f;
    silence.opacity = 255;
    [self addChild: silence z:SCENE_Z];
    
    desolate = [CCSprite spriteWithFile:@"desolate.png"];
    desolate.position = ccp(size.width/2 - 50, size.height/2 + 150);
    desolate.scale = 0.8f;
    desolate.opacity = 255;
    [self addChild: desolate z:SCENE_Z];
    
    garden = [CCSprite spriteWithFile:@"garden.png"];
    garden.position = ccp(size.width/2, size.height/2 - 50);
    [self addChild: garden z:SCENE_Z];
}

-(void)SceneTransition
{
    id labelFadeout = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    id transitionAction = [CCSequence actions:labelFadeout, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],nil];
    [label runAction:transitionAction];
    
    id gardenButtonFadeout = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [button_garden runAction:gardenButtonFadeout];
}

-(void)nextScene
{
    [[CCDirector sharedDirector] replaceScene:[Scene_2 sceneWithVar:1]];
}

-(void)dealloc
{
    
    [super dealloc];
}

@end
