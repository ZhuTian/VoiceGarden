//
//  Scene_4B.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_4B.h"
#import "Scene_3A.h"
#import "GlobalVariable.h"

@implementation Scene_4B
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_4B *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_4B node];
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
        
        // add the label as a child to this Layer
        
        //int _fontSize = 30;
        
        label_1 = [CCLabelTTF labelWithString:@"The wind tells me of the promise that lay ahead." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 250, size.height/2 + 50);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild:label_1 z:TEXT_Z];
        
        label_2 = [CCLabelTTF labelWithString:@"\"I have come a long way to bring you this message." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 -250, size.height/2 );
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2 z:TEXT_Z];
        
        label_3 = [CCLabelTTF labelWithString:@"There is a door beyond the path." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 250, size.height/2 - 50);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		[self addChild:label_3 z:TEXT_Z];
        
        label_4 = [CCLabelTTF labelWithString:@"But you need to back to find a key. \"" fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 - 250, size.height/2 - 100);
        label_4.color = ccc3(0, 0, 0);
        label_4.anchorPoint = ccp(0, 0.5);
        label_4.opacity = 0;
		[self addChild: label_4 z:TEXT_Z];
        
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
        id label4Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_4 runAction:label4Action];
		
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [self SceneTransition];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:back, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu z:TEXT_Z];
        
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
    
    //For desolate scene
    wind = [CCSprite spriteWithFile:@"wind.png"];
    wind.position = ccp(size.width/2 - 700, size.height/2 - 50);
    wind.scale = 1.0f;
    wind.opacity = 255;
    [self addChild: wind z:SCENE_Z];
    
    wind_message = [CCSprite spriteWithFile:@"wind_message.png"];
    wind_message.position = ccp(size.width/2, size.height/2);
    wind_message.scale = 1.0f;
    wind_message.opacity = 255;
    [self addChild: wind_message z:SCENE_Z];
    
    //id windAction = [CCFadeTo actionWithDuration:transitionTime opacity:150];
    //[wind runAction:windAction];
    
    path = [CCSprite spriteWithFile:@"path.png"];
    path.position = ccp(size.width/2 - 430 - 1200, size.height/2 + 180);
    path.scale = 0.5f;
    path.opacity = 0;
    [self addChild: path z:SCENE_Z];
    
    //id pathAction = [CCFadeTo actionWithDuration:transitionTime opacity:150];
    //[path runAction:pathAction];
    
    desolate = [CCSprite spriteWithFile:@"desolate.png"];
    desolate.position = ccp(size.width/2 - 150 - 1200, size.height/2 - 50);
    desolate.opacity = 0;
    [self addChild: desolate z:SCENE_Z];
    
    garden = [CCSprite spriteWithFile:@"garden.png"];
    garden.position = ccp(size.width/2 - 120 - 1200, 120);
    garden.scale = 1.0f;
    garden.opacity = 0;
    [self addChild: garden z:SCENE_Z];
    
    
}

-(void)SceneTransition
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //Fade out scripts
    id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_1 runAction:label1Action];
    id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_2 runAction:label2Action];
    id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_3 runAction:label3Action];
    id label4Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_4 runAction:label4Action];
    id label5Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_5 runAction:label5Action];
    
    
    id windAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 50, size.height/2 - 50)]],
                     [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                     nil];
    [wind runAction:windAction];
    
    id _windMessageAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 700, size.height/2)]],
                             [CCFadeTo actionWithDuration:transitionTime opacity:0],
                             nil];
    id windMessageAction = [CCSequence actions:_windMessageAction, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
    [wind_message runAction:windMessageAction];
    
    id pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 430, size.height/2 + 180)]],
                     [CCFadeTo actionWithDuration:transitionTime opacity:255],
                     nil];
    [path runAction:pathAction];
    
    id desolateAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150, size.height/2 - 50)]],
                         [CCFadeTo actionWithDuration:transitionTime opacity:255],
                         nil];
    [desolate runAction:desolateAction];
    
    id gardenAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 120, 120)]],
                       [CCFadeTo actionWithDuration:transitionTime opacity:255],
                       nil];
    [garden runAction:gardenAction];
}

-(void)nextScene
{
    [[CCDirector sharedDirector] replaceScene:[Scene_3A sceneWithVar:3]];
}


-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else if(self.sceneStatus == 2)
    {
        label_3.string = @"\"There is a door beyond the path";
        label_4.string = @"that awaits you\"";
    }
}

@end
