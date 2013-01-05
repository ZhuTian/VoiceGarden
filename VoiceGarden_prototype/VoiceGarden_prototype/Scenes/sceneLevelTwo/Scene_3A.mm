//
//  Scene_3A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_3A.h"
#import "Scene_4A.h"
#import "Scene_4B.h"
#import "AudioManager.h"
#import "GlobalVariable.h"
#define sceneFontSize 24

@implementation Scene_3A
@synthesize sceneStatus;
extern bool haveKey;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_3A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_3A node];
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
        transitionTime = 1.0f;
        
        [self initSprites];
        
        label_1 = [CCLabelTTF labelWithString:@"I look to my left." fontName:fontName fontSize:sceneFontSize];
		label_1.position =  ccp( size.width /2 - 120, size.height/2+200);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1 z:TEXT_Z];
        
        label_6 = [CCLabelTTF labelWithString:@"There is a         sightly concealed by a tangle of shrubs." fontName:fontName fontSize:sceneFontSize];
		label_6.position =  ccp( size.width /2 - 120, size.height/2+150);
        label_6.color = ccc3(0, 0, 0);
        label_6.anchorPoint = ccp(0, 0.5);
        label_6.opacity = 0;
		[self addChild: label_6 z:TEXT_Z];
        
        label_2 = [CCLabelTTF labelWithString:@"I look to my right." fontName:fontName fontSize:sceneFontSize];
		label_2.position =  ccp( size.width /2 - 120, size.height/2 + 100);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2 z:TEXT_Z];
        
        label_3 = [CCLabelTTF labelWithString:@"Feeling the         graze my face," fontName:fontName fontSize:sceneFontSize];
		label_3.position =  ccp( size.width /2 - 120, size.height/2 + 50);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		[self addChild: label_3 z:TEXT_Z];
        
        label_4 = [CCLabelTTF labelWithString:@"whispering to me in an unfamiliar language." fontName:fontName fontSize:sceneFontSize];
		label_4.position =  ccp( size.width /2 - 120, size.height/2 + 0);
        label_4.color = ccc3(0, 0, 0);
        label_4.anchorPoint = ccp(0, 0.5);
        label_4.opacity = 0;
		[self addChild: label_4 z:TEXT_Z];
        
        label_5 = [CCLabelTTF labelWithString:@"I start to run to chase its word." fontName:fontName fontSize:sceneFontSize];
		label_5.position =  ccp( size.width /2 - 120, size.height/2 - 50);
        label_5.color = ccc3(0, 0, 0);
        label_5.anchorPoint = ccp(0, 0.5);
        label_5.opacity = 0;
		[self addChild: label_5 z:TEXT_Z];
        
        //Fade in the scripts
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
        id label4Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_4 runAction:label4Action];
        id label5Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_5 runAction:label5Action];
        id label6Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_6 runAction:label6Action];
        
        road = [CCMenuItemFont itemWithString:@"path" block:^(id sender){
            _nextScene = 1;
            [self SceneTransition];
        }];
        [road setFontName:fontName];
        [road setFontSize:sceneFontSize];
        [road setPosition:ccp( size.width/2 + 20, size.height/2 + 150)];
        [road setIsEnabled:true];
        [road setColor:ccc3(100,100,100)];
        road.opacity = 0;
        
        id roadLabelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [road runAction: [CCSequence actions:roadLabelAction, action_2, action2_2, nil]];
        [road runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
        
        wind_button = [CCMenuItemFont itemWithString:@"wind" block:^(id sender){
            _nextScene = 2;
            [self SceneTransition];
        }];
        [wind_button setFontName:fontName];
        [wind_button setFontSize:sceneFontSize];
        [wind_button setPosition:ccp( size.width/2 + 35, size.height/2 + 50)];
        [wind_button setIsEnabled:false];
        [wind_button setColor:ccc3(0,0,0)];
        wind_button.opacity = 0;
        
        id windLabelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [wind_button runAction:windLabelAction];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            
        }];
        [back setFontName:fontName];
        [back setFontSize:sceneFontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                self.sceneStatus = 2;
            }
            
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:sceneFontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:road, action, wind_button, back, nil];
		[menu setPosition:ccp( 0, 0)];
        [self addChild:menu z:TEXT_Z];
        
        isLoud = false;
        isBlowOver = false;
        whichWind = 1;
        [self initWinds];
        [self scheduleUpdate];
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite];
        }
        
	}
	return self;
}

-(void)initWinds
{
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCSprite* wind1Sprite = [CCSprite spriteWithFile:@"wind_top1.png"];
    CCSprite* wind2Sprite = [CCSprite spriteWithFile:@"wind_top2.png"];

    CCProgressTimer* wind1 = [CCProgressTimer progressWithSprite:wind1Sprite];
    wind1.type = kCCProgressTimerTypeBar;
    wind1.barChangeRate = ccp(1,0);
    wind1.midpoint = ccp(0.0f,0.0f);
    wind1.percentage = 25;
    
    CCProgressTimer* wind2 = [CCProgressTimer progressWithSprite:wind2Sprite];
    wind2.type = kCCProgressTimerTypeBar;
    wind2.barChangeRate = ccp(1,0);
    wind2.midpoint = ccp(0.0f,0.0f);
    wind2.percentage = 48;
    
    [wind1 setPosition:ccp(size.width/2 + 50, size.height/2 - 50)];
    [wind1 setScale:0.8f];
    [wind2 setPosition:ccp(size.width/2 + 50, size.height/2 - 50)];
    [wind2 setScale:0.8f];

    [self addChild:wind1 z:SCENE_Z tag:21];
    [self addChild:wind2 z:SCENE_Z tag:22];
}


-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else if(self.sceneStatus == 2 || self.sceneStatus == 3)
    {
        [wind_button setIsEnabled: true];
        [wind_button setColor:ccc3(100, 100, 100)];
        label_5.string = @"I start to run to catch its word";
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [wind_button runAction: [CCSequence actions:action_2, action2_2, nil]];
        [wind_button runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
    }
    
}


-(void)update:(ccTime)dt
{
    float volumn = [[AudioManager sharedInstance] getAverageVolume];
    //NSLog(@"%f", volumn);
    if (volumn>-40.0f)
        isLoud = true;
    else
        isLoud = false;
    
    CCProgressTimer* wind1 = (CCProgressTimer*)[self getChildByTag:21];
    CCProgressTimer* wind2 = (CCProgressTimer*)[self getChildByTag:22];
 
    if(whichWind == 1){
        if (isLoud)
            wind1.percentage+=dt*10;
        else if(!isBlowOver)
            wind1.percentage-=dt*10;
        
        if(wind1.percentage<25)
            wind1.percentage=25;
        
        if(wind1.percentage>55){
            wind1.percentage=55;
            isBlowOver = true;
        }
        
        if(isBlowOver&&volumn<-45.0f){
            whichWind++;
            isBlowOver = false;
        }
    }
    else if(whichWind == 2)
    {
        if(isLoud)
            wind2.percentage+=dt*10;
        else if(!isBlowOver)
            wind2.percentage-=dt*10;
        
        if(wind2.percentage<50)
            wind2.percentage=50;
        if(wind2.percentage>80){
            wind2.percentage=80;
            isBlowOver = true;
            if(self.sceneStatus==1){
                self.sceneStatus = 2;
                [self updateScene];
            }
        }
        
        if(isBlowOver&&volumn<-45.0f){
            whichWind++;
            isBlowOver = false;
        }
    }
}


-(void)SceneTransition: (int)nextScene
{
    [[GlobalVariable sharedInstance].SceneStack addObject:[self class]];
    [[GlobalVariable sharedInstance].SceneStatusStack addObject:[NSNumber numberWithInt:1]];
    if(nextScene == 1)
    {
        //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
    }
}

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    
    //Add common background
    background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background z:BACKGROUND_Z];
    
    //Add Scene Sprites
    
    wind = [CCSprite spriteWithFile:@"wind.png"];
    wind.position = ccp(size.width/2 + 50, size.height/2 - 50);
    wind.scale = 0.8f;
    wind.opacity = 255;
    [self addChild: wind z:SCENE_Z];
 
    path = [CCSprite spriteWithFile:@"path.png"];
    path.position = ccp(size.width/2 - 430, size.height/2 + 180);
    path.scale = 0.5f;
    path.opacity = 255;
    [self addChild: path z:SCENE_Z];
     
    desolate = [CCSprite spriteWithFile:@"desolate.png"];
    desolate.position = ccp(size.width/2 - 150, size.height/2 - 50);
    desolate.scale = 1.0f;
    [self addChild: desolate z:SCENE_Z];
    
    garden = [CCSprite spriteWithFile:@"garden.png"];
    garden.position = ccp(size.width/2 - 120, 120);
    garden.scale = 1.0f;
    garden.opacity = 255;
    [self addChild: garden z:SCENE_Z];

    
    wind_message = [CCSprite spriteWithFile:@"wind_message.png"];
    wind_message.position = ccp(size.width/2 + 700, size.height/2);
    wind_message.scale = 1.0f;
    wind_message.opacity = 0;
    [self addChild: wind_message z:SCENE_Z];
    
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
    id label6Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_6 runAction:label6Action];
    id roadButtonAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [road runAction:roadButtonAction];
    id windButtonAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [wind_button runAction:windButtonAction];
    
    
    if(_nextScene == 1)
    {
        id windAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 50 + 600, size.height/2 - 50 - 600)]],
                         [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                         [CCFadeTo actionWithDuration:transitionTime opacity:0],
                         nil];
        [wind runAction:windAction];
        
        id _pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150, size.height/2)]],
                         [CCFadeTo actionWithDuration:transitionTime opacity:255],
                         [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                         nil];
        id pathAction = [CCSequence actions:_pathAction,
                         [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],
                         nil];
        [path runAction:pathAction];
        
        id desolateAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 150, size.height/2 - 300)]],
                             [CCFadeTo actionWithDuration:transitionTime opacity:255],
                             nil];
        [desolate runAction:desolateAction];
        
        id gardenAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 120, 120 - 600)]],
                           [CCFadeTo actionWithDuration:transitionTime opacity:0],
                           nil];
        [garden runAction:gardenAction];
    }
    else if(_nextScene == 2)
    {
        id windAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 700, size.height/2 - 50)]],
                         [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                         nil];
        [wind runAction:windAction];
        
        id _windMessageAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2, size.height/2)]],
                                 [CCFadeTo actionWithDuration:transitionTime opacity:255],
                                 nil];
        id windMessageAction = [CCSequence actions:_windMessageAction, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
        [wind_message runAction:windMessageAction];
        
        id pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 430 - 1200, size.height/2 + 180)]],
                         [CCFadeTo actionWithDuration:transitionTime opacity:0],
                         nil];
        [path runAction:pathAction];
        
        id desolateAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150 - 1200, size.height/2 - 50)]],
                         [CCFadeTo actionWithDuration:transitionTime opacity:0],
                         nil];
        [desolate runAction:desolateAction];
        
        id gardenAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 120 - 1200, 120)]],
                             [CCFadeTo actionWithDuration:transitionTime opacity:0],
                             nil];
        [garden runAction:gardenAction];
    }
}

-(void)nextScene
{
    if(_nextScene == 1)
    {
        if(sceneStatus == 3)
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_4A sceneWithVar:2 preScene:self.sceneStatus]];
        }
        else
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_4A sceneWithVar:1 preScene:self.sceneStatus]];
        }
    }
    else if(_nextScene == 2)
    {
        if([GlobalVariable sharedInstance].haveKey)
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_4B sceneWithVar:2]];
        }
        else
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_4B sceneWithVar:1]];
        }
    }
}


-(void)dealloc
{
    [super dealloc];
}


@end
