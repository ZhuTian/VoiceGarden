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
        CCSprite* background = [CCSprite spriteWithFile:@"desolate_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        label_1 = [CCLabelTTF labelWithString:@"I look to my left." fontName:fontName fontSize:sceneFontSize];
		label_1.position =  ccp( size.width /2 - 120, size.height/2+200);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
		[self addChild: label_1];
        
        label_6 = [CCLabelTTF labelWithString:@"There is a         sightly concealed by a tangle of shrubs." fontName:fontName fontSize:sceneFontSize];
		label_6.position =  ccp( size.width /2 - 120, size.height/2+150);
        label_6.color = ccc3(0, 0, 0);
        label_6.anchorPoint = ccp(0, 0.5);
		[self addChild: label_6];
        
        label_2 = [CCLabelTTF labelWithString:@"I look to my right." fontName:fontName fontSize:sceneFontSize];
		label_2.position =  ccp( size.width /2 - 120, size.height/2 + 100);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Feeling the         graze my face," fontName:fontName fontSize:sceneFontSize];
		label_3.position =  ccp( size.width /2 - 120, size.height/2 + 50);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
		[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"whispering to me in an unfamiliar language." fontName:fontName fontSize:sceneFontSize];
		label_4.position =  ccp( size.width /2 - 120, size.height/2 + 0);
        label_4.color = ccc3(0, 0, 0);
        label_4.anchorPoint = ccp(0, 0.5);
		[self addChild: label_4];
        
        label_5 = [CCLabelTTF labelWithString:@"I start to run to chase its word." fontName:fontName fontSize:sceneFontSize];
		label_5.position =  ccp( size.width /2 - 120, size.height/2 - 50);
        label_5.color = ccc3(0, 0, 0);
        label_5.anchorPoint = ccp(0, 0.5);
		[self addChild: label_5];
		
        
        road = [CCMenuItemFont itemWithString:@"path" block:^(id sender){
            if(self.sceneStatus == 3)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4A sceneWithVar:2 preScene:self.sceneStatus] withColor:ccWHITE]];
            }
            else
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4A sceneWithVar:1 preScene:self.sceneStatus] withColor:ccWHITE]];
            }
        }];
        [road setFontName:fontName];
        [road setFontSize:sceneFontSize];
        [road setPosition:ccp( size.width/2 + 20, size.height/2 + 150)];
        [road setIsEnabled:true];
        [road setColor:ccc3(100,100,100)];
        
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [road runAction: [CCSequence actions:action_2, action2_2, nil]];
        [road runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
        
        wind = [CCMenuItemFont itemWithString:@"wind" block:^(id sender){
            if([GlobalVariable sharedInstance].haveKey)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4B sceneWithVar:2] withColor:ccWHITE]];
                
            }
            else
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4B sceneWithVar:1] withColor:ccWHITE]];
            }
        }];
        [wind setFontName:fontName];
        [wind setFontSize:sceneFontSize];
        [wind setPosition:ccp( size.width/2 + 35, size.height/2 + 50)];
        [wind setIsEnabled:false];
        [wind setColor:ccc3(0,0,0)];
        
        
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
            
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:48];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:road, action, wind, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        
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
    
    CCSprite* wind1Sprite = [CCSprite spriteWithFile:@"wind1.png"];
    CCSprite* wind2Sprite = [CCSprite spriteWithFile:@"wind2.png"];
    CCSprite* wind3Sprite = [CCSprite spriteWithFile:@"wind3.png"];
    CCSprite* wind4Sprite = [CCSprite spriteWithFile:@"wind4.png"];
    
    CCProgressTimer* wind1 = [CCProgressTimer progressWithSprite:wind1Sprite];
    wind1.type = kCCProgressTimerTypeBar;
    wind1.barChangeRate = ccp(1,0);
    wind1.midpoint = ccp(0.0f,0.0f);
    wind1.percentage = 25;
    
    CCProgressTimer* wind2 = [CCProgressTimer progressWithSprite:wind2Sprite];
    wind2.type = kCCProgressTimerTypeBar;
    wind2.barChangeRate = ccp(1,0);
    wind2.midpoint = ccp(0.0f,0.0f);
    wind2.percentage = 53;
    
    CCProgressTimer* wind3 = [CCProgressTimer progressWithSprite:wind3Sprite];
    wind3.type = kCCProgressTimerTypeBar;
    wind3.barChangeRate = ccp(1,0);
    wind3.midpoint = ccp(0.0f,0.0f);
    wind3.percentage = 58;
    
    CCProgressTimer* wind4 = [CCProgressTimer progressWithSprite:wind4Sprite];
    wind4.type = kCCProgressTimerTypeBar;
    wind4.barChangeRate = ccp(1,0);
    wind4.midpoint = ccp(1024.0f,0.0f);
    wind4.percentage = 5;
    
    [wind1 setPosition:ccp(size.width/2,size.height/2)];
    [wind2 setPosition:ccp(size.width/2,size.height/2)];
    [wind3 setPosition:ccp(size.width/2,size.height/2)];
    [wind4 setPosition:ccp(size.width/2,size.height/2)];
    
    [self addChild:wind1 z:10 tag:21];
    [self addChild:wind2 z:10 tag:22];
    [self addChild:wind3 z:10 tag:23];
    [self addChild:wind4 z:10 tag:24];
    
}


-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else if(self.sceneStatus == 2 || self.sceneStatus == 3)
    {
        [wind setIsEnabled: true];
        [wind setColor:ccc3(100, 100, 100)];
        label_5.string = @"I start to run to catch its word";
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [wind runAction: [CCSequence actions:action_2, action2_2, nil]];
        [wind runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
    }
    
}


-(void)update:(ccTime)dt
{
    float volumn = [[AudioManager sharedInstance] getAverageVolume];
    if (volumn>-30.0f)
        isLoud = true;
    else
        isLoud = false;
    
    CCProgressTimer* wind1 = (CCProgressTimer*)[self getChildByTag:21];
    CCProgressTimer* wind2 = (CCProgressTimer*)[self getChildByTag:22];
    CCProgressTimer* wind3 = (CCProgressTimer*)[self getChildByTag:23];
    CCProgressTimer* wind4 = (CCProgressTimer*)[self getChildByTag:24];
    
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
        }
        
        if(isBlowOver&&volumn<-45.0f){
            whichWind++;
            isBlowOver = false;
        }
    }
    else if(whichWind == 3)
    {
        if(isLoud)
            wind3.percentage+=dt*10;
        else if(!isBlowOver)
            wind3.percentage-=dt*10;
        
        if(wind3.percentage<58)
            wind3.percentage=58;
        if(wind3.percentage>88){
            wind3.percentage=88;
            isBlowOver=true;
        }
        if(isBlowOver&&volumn<-45.0f){
            whichWind++;
            isBlowOver = false;
        }
    }
    else if(whichWind == 4)
    {
        if(isLoud)
            wind4.percentage+=dt*10;
        else if(!isBlowOver)
            wind4.percentage-=dt*10;
        
        if(wind4.percentage<5)
            wind4.percentage=5;
        if(wind4.percentage>30){
            wind4.percentage=30;
            isBlowOver=true;
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


-(void)dealloc
{
    [super dealloc];
}


@end
