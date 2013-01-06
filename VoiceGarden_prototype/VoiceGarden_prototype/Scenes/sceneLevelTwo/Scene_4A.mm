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

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint loc=[touch locationInView:[touch view]];
    loc=[[CCDirector sharedDirector] convertToGL:loc];
    
    if (loc.x > 200 && loc.x<280 && loc.y > 50 && loc.y < 110) {
        if (tip_down.visible == true) {
            tip_down.visible = false;
            tip_up.visible = true;
        }
        else if (tip_down.visible == false){
            tip_up.visible = false;
            tip_down.visible = true;
        }
    }
    
    NSLog(@"(%g,%g)",loc.x,loc.y);
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        self.isTouchEnabled = true;
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        [self initSprites];
        transitionTime = 1.0f;
        
        //int _fontSize = 30;
        
        
        label_1 = [CCLabelTTF labelWithString:@"The fear of unknown " fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 160, size.height/2 + 300);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"keeps me from moving forward." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 160, size.height/2 + 250);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Should I continue                   ?" fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 + 0, size.height/2 + 200);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		//[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"Should I search for                    ?" fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 + 0, size.height/2 + 150);
        label_4.color = ccc3(0, 0, 0);
        label_4.anchorPoint = ccp(0, 0.5);
        label_4.opacity = 0;
		//[self addChild: label_2];
        
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
        id label4Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_4 runAction:label4Action];
		
        
        my = [CCMenuItemFont itemWithString:@"on my own" block:^(id sender){
           //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5D sceneWithVar:1] withColor:ccWHITE]];
            _nextScene = 1;
            [self SceneTransition];
        }];
        [my setFontName:fontName];
        [my setFontSize:_fontSize];
        [my setPosition:ccp( size.width/2 + 265, size.height/2 + 200)];
        [my setIsEnabled:false];
        [my setColor:ccc3(100,100,100)];
        my.opacity = 0;
        my.visible = false;
        
        
        company = [CCMenuItemFont itemWithString:@"a companion" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_5A sceneWithVar:1] withColor:ccWHITE]];
            _nextScene = 2;
            [self SceneTransition];
        }];
        [company setFontName:fontName];
        [company setFontSize:_fontSize];
        [company setPosition:ccp( size.width/2 + 290, size.height/2 + 150)];
        [company setIsEnabled:false];
        [company setColor:ccc3(100,100,100)];
        company.opacity = 0;
        company.visible = false;
        
        id fadein = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [my runAction: [CCSequence actions:fadein, action, action2, nil]];
        [my runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        id fadein_2 = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [company runAction: [CCSequence actions:fadein_2, action_2, action2_2, nil]];
        [company runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
        
        back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:self.preSceneStatus] withColor:ccWHITE]];
            _nextScene = -1;
            [self SceneTransition];
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

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    
    //Add common background
    background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background z:BACKGROUND_Z];
    
    //For companion
    road_loop = [CCSprite spriteWithFile:@"footprint_scroll.png"];
    road_loop.position = ccp(size.width/2 + 770, size.height/2 + 162);
    road_loop.scale = 1.0f;
    road_loop.opacity = 0;
    [self addChild: road_loop z:SCENE_Z];
    
    door = [CCSprite spriteWithFile:@"door.png"];
    door.position = ccp(size.width/2 + 400, size.height/2 + 300);
    door.scale = 0.3f;
    door.opacity = 0;
    [self addChild: door z:SCENE_Z];
    
    
    id roadLoopAction = [CCFadeTo actionWithDuration:3.0f opacity:255];
    [road_loop runAction:roadLoopAction];
    
    path = [CCSprite spriteWithFile:@"path.png"];
    path.position = ccp(size.width/2, size.height/2);
    path.scale = 1.0f;
    [self addChild: path z:SCENE_Z];
    
    
    
    desolate = [CCSprite spriteWithFile:@"desolate.png"];
    desolate.position = ccp(size.width/2 + 150, size.height/2 - 300);
    desolate.scale = 1.0f;
    [self addChild: desolate z:SCENE_Z];
    
    footprint_path = [CCSprite spriteWithFile:@"footprint_scroll.png"];
    footprint_path.position = ccp(size.width/2 + 950, size.height/2 + 150);
    footprint_path.scale = 0.8f;
    [self addChild: footprint_path z:SCENE_Z];
    
    fear = [CCSprite spriteWithFile:@"Path_fear_cloud.png"];
    fear.position = ccp(size.width/2 - 100, size.height/2 + 200);
    fear.scale = 0.8f;
    fear.opacity = 0;
    [self addChild: fear z:SCENE_Z];
    
    //For previous scene
    garden = [CCSprite spriteWithFile:@"garden.png"];
    garden.position = ccp(size.width/2 - 120, 120 - 600);
    garden.scale = 1.0f;
    garden.opacity = 0;
    [self addChild: garden z:SCENE_Z];
    
    wind = [CCSprite spriteWithFile:@"wind.png"];
    wind.position = ccp(size.width/2 + 50 + 600, size.height/2 - 50 - 600);
    wind.scale = 0.8f;
    wind.opacity = 0;
    [self addChild: wind z:SCENE_Z];
    
    //For own way
    pond = [CCSprite spriteWithFile:@"pond.png"];
    pond.position = ccp(size.width/2 - 130 - 600, size.height/2 + 300);
    pond.scale = 0.5f;
    [self addChild: pond z:SCENE_Z];
    
    
    tip_down = [CCSprite spriteWithFile:@"tip_down_L.png"];
    tip_down.position = ccp(size.width/2 - 100, size.height/2 - 250);
    [self addChild:tip_down z:3];
    
    tip_up = [CCSprite spriteWithFile:@"tip_door_noKey.png"];
    tip_up.position = ccp(size.width/2 - 100, size.height/2 - 250);
    tip_up.visible = false;
    [self addChild:tip_up z:3];
}

-(void)SceneTransition
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_1 runAction:label1Action];
    id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_2 runAction:label2Action];
    id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_3 runAction:label3Action];
    id label4Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_4 runAction:label4Action];
    
    id tipAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    if (tip_down.visible==true) {
        [tip_down runAction:tipAction];
    }
    else{
        [tip_up runAction:tipAction];
    }
    
    if(sceneStatus == 2)
    {
        id myButtonAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [my runAction:myButtonAction];
        id companyAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [company runAction:companyAction];
        
    }
    
    if(_nextScene == -1) // Back
    {
        id windAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 50, size.height/2 - 50)]],
                         [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                         [CCFadeTo actionWithDuration:transitionTime opacity:255],
                         nil];
        [wind runAction:windAction];
        
        id _pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 430, size.height/2 + 180)]],
                          [CCFadeTo actionWithDuration:transitionTime opacity:255],
                          [CCScaleTo actionWithDuration:transitionTime scale:0.5f],
                          nil];
        id pathAction = [CCSequence actions:_pathAction,
                         [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],
                         nil];
        [path runAction:pathAction];
        
        id desolateAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150, size.height/2 - 50)]],
                             [CCFadeTo actionWithDuration:transitionTime opacity:255],
                             nil];
        [desolate runAction:desolateAction];
        
        id gardenAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 120, 120)]],
                           [CCFadeTo actionWithDuration:transitionTime opacity:0],
                           nil];
        [garden runAction:gardenAction];
        
        id fearAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [fear runAction:fearAction];
        
        id roadLoopAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
        [road_loop runAction:roadLoopAction];
    }
    else if(_nextScene == 1)
    {
        
        id _pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 300, size.height/2 - 300)]],
                          [CCFadeTo actionWithDuration:transitionTime opacity:255],
                          [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                          nil];
        id pathAction = [CCSequence actions:_pathAction,
                         [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],
                         nil];
        [path runAction:pathAction];
        
        id desolateAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 150 + 400, size.height/2 - 300 - 300)]],
                             [CCFadeTo actionWithDuration:transitionTime opacity:0],
                             nil];
        [desolate runAction:desolateAction];
        
        id pondAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 130, size.height/2)]],
                         [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                             [CCFadeTo actionWithDuration:transitionTime opacity:255],
                             nil];
        [pond runAction:pondAction];
        
    }
    else if(_nextScene == 2)
    {
        id _pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150 - 800, size.height/2 - 200)]],
                          [CCFadeTo actionWithDuration:transitionTime opacity:0],
                          [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                          nil];
        id pathAction = [CCSequence actions:_pathAction,
                         [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],
                         nil];
        [path runAction:pathAction];
        
        id desolateAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 150 - 400, size.height/2 - 300 - 300)]],
                             [CCFadeTo actionWithDuration:transitionTime opacity:0],
                             nil];
        [desolate runAction:desolateAction];
        
        id roadLoopAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2, size.height/2)]],
                         [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                         [CCFadeTo actionWithDuration:transitionTime opacity:255],
                         nil];
        [road_loop runAction:roadLoopAction];
        
        id doorAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 300, size.height/2 + 100)]],
                             [CCScaleTo actionWithDuration:transitionTime scale:0.5f],
                             [CCFadeTo actionWithDuration:transitionTime opacity:255],
                             nil];
        [door runAction:doorAction];
    }
}

-(void)nextScene
{
    if(_nextScene == -1)
    {
        [[CCDirector sharedDirector] replaceScene:[Scene_3A sceneWithVar:self.preSceneStatus]];
    }
    else if(_nextScene == 1)
    {
        [[CCDirector sharedDirector] replaceScene:[Scene_5D sceneWithVar:1]];
    }
    else if(_nextScene == 2)
    {
        [[CCDirector sharedDirector] replaceScene:[Scene_5A sceneWithVar:1]];
    }
}

-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        id fearAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [fear runAction:fearAction];
    }
    else if(self.sceneStatus == 2 || self.sceneStatus == 3)
    {
        CGSize size = [[CCDirector sharedDirector] winSize];

        label_1.string = @"The road splits before me";
        [label_1 setPosition:ccp( size.width /2 + 0, size.height/2 + 300)];
        label_2.string = @"Only I can decide my path";
        [label_2 setPosition:ccp( size.width /2 + 0, size.height/2 + 250)];
        
        [self addChild:label_3];
        [self addChild:label_4];
        [my setIsEnabled:true];
        my.visible = true;
        [my setColor:ccc3(100,100,100)];
        [company setIsEnabled:true];
        company.visible = true;
        [company setColor:ccc3(100,100,100)];
        //[background setTexture:[[CCTextureCache sharedTextureCache] addImage:@"road_bg.png"]];
        [back setIsEnabled:false];
    }
}
@end
