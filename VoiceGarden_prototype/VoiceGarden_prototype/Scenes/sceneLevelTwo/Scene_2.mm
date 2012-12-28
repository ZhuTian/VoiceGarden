//
//  Scene_2.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_2.h"
#import "Scene_3B.h"
#import "GlobalVariable.h"
#import "Scene_3A.h"
#import "StartScene.h"
#define _fontSize 30

@implementation Scene_2
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	CCScene *scene = [CCScene node];
	Scene_2 *layer;
    layer= [Scene_2 node];
    
    if([GlobalVariable sharedInstance].isSlience && [GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 1;
    }
    else if(![GlobalVariable sharedInstance].isSlience && [GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 2;
    }
    else if([GlobalVariable sharedInstance].isSlience && ![GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 3;
    }
    else
    {
        layer.sceneStatus = 4;
    }
    [layer updateScene];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        transitionTime = 2.0f;
        
        [self initSprites];
   
        label_1 = [CCLabelTTF labelWithString:@"I open my eyes." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 250, size.height/2 - 30);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1 z:TEXT_Z];
        
        label_2 = [CCLabelTTF labelWithString:@"I see a              garden." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 250, size.height/2 - 80);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2 z:TEXT_Z];
        
        label_3 = [CCLabelTTF labelWithString:@"I am surrounded by the sound of          ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 250, size.height/2 - 130);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		[self addChild: label_3 z:TEXT_Z];
        
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
		
        
        desolate_beautiful = [CCMenuItemFont itemWithString:@"desolate" block:^(id sender){
            _nextScene = 1;
            [self SceneTransition];
        }];
        [desolate_beautiful setFontName:fontName];
        [desolate_beautiful setFontSize:_fontSize];
        [desolate_beautiful setPosition:ccp( size.width/2 - 89, size.height/2 - 80)];
        [desolate_beautiful setColor:ccc3(100,100,100)];
        desolate_beautiful.opacity = 0;
        
        slience_XXX = [CCMenuItemFont itemWithString:@"slience" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3B sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3B sceneWithVar:3] withColor:ccWHITE]];
            }
        }];
        [slience_XXX setFontName:fontName];
        [slience_XXX setFontSize:_fontSize];
        [slience_XXX setPosition:ccp( size.width/2 + 250, size.height/2 - 130)];
        [slience_XXX setColor:ccc3(100,100,100)];
        slience_XXX.opacity = 0;
        
        id fadein = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [desolate_beautiful runAction: [CCSequence actions:fadein, action, action2, nil]];
        [desolate_beautiful runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        id fadein_2 = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [slience_XXX runAction: [CCSequence actions:fadein_2, action_2, action2_2, nil]];
        [slience_XXX runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
        
        back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            Class preScene = [[GlobalVariable sharedInstance].SceneStack lastObject];
            [[GlobalVariable sharedInstance].SceneStack removeLastObject];
            //int preSceneStatus = (int)[[GlobalVariable sharedInstance].SceneStatusStack lastObject];
            [[GlobalVariable sharedInstance].SceneStatusStack removeLastObject];
            if(preScene != nil)
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[preScene scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:desolate_beautiful, slience_XXX, back, nil];
		[menu setPosition:ccp( 0, 0)];
		[self addChild:menu  z:TEXT_Z];
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite z: 10 tag:20];
        }
        
	}
	return self;
}

- (void)updateScene
{
    if(self.sceneStatus == 1)
    {
        
    }
    else if(self.sceneStatus == 2)
    {
        [slience_XXX setString:@"life"];
    }
    else if(self.sceneStatus == 3)
    {
        [desolate_beautiful setString:@"thriving"];
    }
    else if(self.sceneStatus == 4)
    {
        [slience_XXX setString:@"life"];
        [slience_XXX stopAllActions];
        [slience_XXX setIsEnabled:false];
        [slience_XXX setColor:ccc3(0, 0, 0)];
        
        [desolate_beautiful setString:@"thriving"];
        [desolate_beautiful stopAllActions];
        [desolate_beautiful setIsEnabled:false];
        [desolate_beautiful setColor:ccc3(0, 0, 0)];
        
        [background setTexture:[[CCTextureCache sharedTextureCache] addImage:@"garden_life.png"]];
        
        CCSprite* key = (CCSprite*)[self getChildByTag:20];
        [key setVisible:false];
     
        [back setVisible:true];
    }
}

-(void)SceneTransition
{
    CGSize size = [[CCDirector sharedDirector] winSize];

    [[GlobalVariable sharedInstance].SceneStack addObject:[self class]];
    [[GlobalVariable sharedInstance].SceneStatusStack addObject:[NSNumber numberWithInt:1]];
    if(_nextScene == 1)
    {
        
        id desolateAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150, size.height/2 - 50)],
                             [CCFadeTo actionWithDuration:transitionTime opacity:255],
                             [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                             nil];
        [desolate runAction:desolateAction];
        
        id silenceAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 100, size.height/2 - 200)],
                            [CCFadeTo actionWithDuration:transitionTime opacity:0],
                            [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                            nil];
        [silence runAction:silenceAction];
        
        id _gardenAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 120, 120)],
                            [CCFadeTo actionWithDuration:transitionTime opacity:255],
                            nil];
        
        id gardenAction = [CCSequence actions:_gardenAction, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
        [garden runAction:gardenAction];
        
        id windAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 50, size.height/2 - 50)],
                         [CCFadeTo actionWithDuration:transitionTime opacity:255],
                         [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                         nil];
        
        [wind runAction:windAction];
        
        id pathAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 430, size.height/2 + 180)],
                         [CCFadeTo actionWithDuration:transitionTime opacity:255],
                         [CCScaleTo actionWithDuration:transitionTime scale:0.5f],
                         nil];
        
        [path runAction:pathAction];
        
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [label_3 runAction:label3Action];
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
    
    //For desolate scene
    wind = [CCSprite spriteWithFile:@"wind.png"];
    wind.position = ccp(size.width/2 - 50, size.height/2 + 250);
    wind.scale = 0.3f;
    wind.opacity = 0;
    [self addChild: wind z:SCENE_Z];
    
    path = [CCSprite spriteWithFile:@"path.png"];
    path.position = ccp(size.width/2 - 330, size.height/2 + 280);
    path.scale = 0.3f;
    path.opacity = 0;
    [self addChild: path z:SCENE_Z];
    
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

-(void)nextScene
{
    if(_nextScene == 1)
    {
        if([GlobalVariable sharedInstance].isDesolate)
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_3A sceneWithVar:1]];
        }
        else
        {
            [[CCDirector sharedDirector] replaceScene:[Scene_3A sceneWithVar:3]];
        }
    }
}

-(void)dealloc
{
    
    [super dealloc];
}

@end
