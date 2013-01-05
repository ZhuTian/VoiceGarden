//
//  Scene_5A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_5A.h"
#import "Scene_7A.h"
#import "AudioManager.h"
#import "GlobalVariable.h"

@implementation Scene_5A
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_5A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_5A node];
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
        
        scrollSpeed = 100;
        front_scrollSpeed = 60;
        
        enableFootprint = true;
        
        
        
        int xOffset = 150, yOffset = 250;
        int _fontSize = 30;
        
        
        label_1 = [CCLabelTTF labelWithString:@"I follow the footprint." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 + xOffset, size.height/2 - 40 + yOffset);
        label_1.color = ccc3(0, 0, 0);
        label_1.opacity = 0;
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"People who are gone." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 + xOffset, size.height/2 - 100 + yOffset);
        label_2.color = ccc3(0, 0, 0);
        label_2.opacity = 0;
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Were they once belong here?" fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 + xOffset, size.height/2 - 160 + yOffset);
        label_3.color = ccc3(0, 0, 0);
        label_3.opacity = 0;
		[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"I                                  " fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 + xOffset, size.height/2 - 220 + yOffset);
        label_4.color = ccc3(0, 0, 0);
        label_4.opacity = 0;
		[self addChild: label_4];
        
        label_5 = [CCLabelTTF labelWithString:@"and pick up things left by them" fontName:fontName fontSize:_fontSize];
		label_5.position =  ccp( size.width /2 + xOffset, size.height/2 - 280 + yOffset);
        label_5.color = ccc3(0, 0, 0);
        label_5.opacity = 0;
		[self addChild: label_5];
        
        //Fade in scripts
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
		
        
        keep = [CCMenuItemFont itemWithString:@"keep moving forward" block:^(id sender){

            enableFootprint = false;
            [self SceneTransition];

        }];
        [keep setFontName:fontName];
        [keep setFontSize:_fontSize];
        [keep setPosition:ccp( size.width/2 + 20 + xOffset, size.height/2 - 220 + yOffset)];
        [keep setIsEnabled:true];
        [keep setIsEnabled:false];
        [keep setColor:ccc3(0,0,0)];
        keep.opacity = 0;
        
        id keepAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [keep runAction:keepAction];
        
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:48];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *middle = [CCMenuItemFont itemWithString:@"Middle" block:^(id sender){
            [footprintManager addFoot:-30];
            [self detectCollision];
        }];
        [middle setFontName:fontName];
        [middle setFontSize:48];
        [middle setPosition:ccp( size.width - 400, 30)];
        [middle setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *low = [CCMenuItemFont itemWithString:@"Low" block:^(id sender){
            [footprintManager addFoot:-60];
            [self detectCollision];
        }];
        [low setFontName:fontName];
        [low setFontSize:48];
        [low setPosition:ccp( size.width - 200, 30)];
        [low setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *high = [CCMenuItemFont itemWithString:@"High" block:^(id sender){
            [footprintManager addFoot:0];
            [self detectCollision];
        }];
        [high setFontName:fontName];
        [high setFontSize:48];
        [high setPosition:ccp( size.width - 600, 30)];
        [high setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:keep, action, nil];
        //CCMenuItem *menu = [CCMenu menuWithItems:keep, middle, low, high, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu z:TEXT_Z - 1];
        
        levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.5 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
        
        [self schedule:@selector(scrollCallback:) interval:0.03];
        
        //Initiate footprint manager
        footprintManager = [FootprintManager initManager:self];
        footprintManager->scrollSpeed = scrollSpeed;
        
        
        //Initiate collectable items;
        faithCollected = false;
        courageCollected = false;
        friendshipCollected = false;
        
        faithPosition = CGPointMake(500, footprintManager->midY),
        faithLabel = [CCLabelTTF labelWithString:@"faith" fontName:fontName fontSize:40];
		faithLabel.position =  faithPosition;
        faithLabel.color = ccc3(0, 0, 0);
		[self addChild: faithLabel z:SCENE_Z];
        
        couragePosition = CGPointMake(1200, footprintManager->lowY),
        courageLabel = [CCLabelTTF labelWithString:@"courage" fontName:fontName fontSize:40];
		courageLabel.position =  couragePosition;
        courageLabel.color = ccc3(0, 0, 0);
		[self addChild: courageLabel z:SCENE_Z];
        
        friendshipPosition = CGPointMake(1900, footprintManager->highY),
        friendshipLabel = [CCLabelTTF labelWithString:@"friendship" fontName:fontName fontSize:40];
		friendshipLabel.position =  friendshipPosition;
        friendshipLabel.color = ccc3(0, 0, 0);
		[self addChild: friendshipLabel z:SCENE_Z];
        
        collisionThreshold = 40;
        
        [self schedule:@selector(updateFootOpacity:) interval:0.03];
        
	}
	return self;
}

- (void)levelTimerCallback:(NSTimer *)timer {
    NSLog([[AudioManager sharedInstance] getNote]);
    if(enableFootprint == true)
    {
        NSString* note = [[AudioManager sharedInstance] getNote];
        if([note isEqualToString:@"Do"] || [note isEqualToString:@"Re"] || [note isEqualToString:@"Mi"])
        {
            [footprintManager addFoot:[footprintManager getLowVolume]];
        }
        else if([note isEqualToString:@"Fa"] || [note isEqualToString:@"So"])
        {
            [footprintManager addFoot:[footprintManager getMidVolume]];
        }
        else if([note isEqualToString:@"La"] || [note isEqualToString:@"Si"] || [note isEqualToString:@"Do+"])
        {
            [footprintManager addFoot:[footprintManager getHighVolume]];
        }
        else
        {
            //NSLog(note);
        }
        
        [self detectCollision];
    }
}

- (void)scrollCallback:(ccTime)dt {
    
    if(!enableFootprint)
    {
        return;
    }
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    offset1 -= dt * scrollSpeed;
    road_loop1.position = ccp(size.width/2 + offset1, size.height/2);
    offset2 -= dt * scrollSpeed;
    road_loop2.position = ccp(size.width/2 + offset2, size.height/2);
    if(offset2 <= 0)
    {
        offset1 = offset2 + 1024;
    }
    if(offset1 <= 0)
    {
        offset2 = offset1 + 1024;
    }
    
    front_offset1 -= dt * front_scrollSpeed;
    road_front1.position = ccp(size.width/2 + front_offset1, size.height/2);
    front_offset2 -= dt * front_scrollSpeed;
    road_front2.position = ccp(size.width/2 + front_offset2, size.height/2);
    if(front_offset2 <= 0)
    {
        front_offset1 = front_offset2 + 1024;
    }
    if(front_offset1 <= 0)
    {
        front_offset2 = front_offset1 + 1024;
    }
    
    
    int temp = faithLabel.position.x - dt*scrollSpeed;
    if(temp < 0)
        temp += 1024;
    faithLabel.position = ccp(temp, faithLabel.position.y);
    temp = courageLabel.position.x - dt*scrollSpeed;
    if(temp < 0)
        temp += 1024;
    courageLabel.position = ccp(temp, courageLabel.position.y);
    temp = friendshipLabel.position.x - dt*scrollSpeed;
    if(temp < 0)
        temp += 1024;
    friendshipLabel.position = ccp(temp, friendshipLabel.position.y);
    
    [self detectCollision];
    
    if ([GlobalVariable sharedInstance].keyInThePocket == true) {
        CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
        keySprite.scale = 0.3;
        keySprite.position = ccp(900, 100);
        [self addChild:keySprite];
    }

    
}

- (void)dealloc {
	[levelTimer release];
	[recorder release];
  	[super dealloc];
}

-(void)updateScene
{

    if(sceneStatus == 2)
    {
        keep.isEnabled = true;
        keep.color = ccc3(100, 100, 100);
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        [keep runAction: [CCSequence actions:action, action2, nil]];
        [keep runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
}

-(void)detectCollision
{
    CGPoint footPosition = [footprintManager getLatestPosition];
    
    //For faith
    if(footPosition.y == faithLabel.position.y && abs(footPosition.x - faithLabel.position.x) <= collisionThreshold)
    {
        faithCollected = true;
        faithLabel.visible = false;
    }
    
    //For courage
    if(footPosition.y == courageLabel.position.y && abs(footPosition.x - courageLabel.position.x) <= collisionThreshold)
    {
        courageCollected = true;
        courageLabel.visible = false;
    }
    
    //For friendship
    if(footPosition.y == friendshipLabel.position.y && abs(footPosition.x - friendshipLabel.position.x) <= collisionThreshold * 2)
    {
        friendshipCollected = true;
        friendshipLabel.visible = false;
    }
    
    if(friendshipCollected && courageCollected && faithCollected)
    {
        sceneStatus = 2;
        [self updateScene];
        enableFootprint = false;
    }
}

-(void)updateFootOpacity:(ccTime)dt
{
    [footprintManager updateOpacity:dt];
}

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //Add common background
    background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background z:BACKGROUND_Z];
    
    //Init roads;
    door = [CCSprite spriteWithFile:@"door.png"];
    door.position = ccp(size.width/2 + 300, size.height/2 + 100);
    door.scale = 0.5f;
    [self addChild: door z:SCENE_Z];
    
    road_ground = [CCSprite spriteWithFile:@"footprint_back.png"];
    road_ground.position = ccp(size.width/2, size.height/2);
    [self addChild: road_ground z:SCENE_Z];
    
    road_loop1 = [CCSprite spriteWithFile:@"footprint_scroll.png" rect:CGRectMake(0, 0, 1024, 768)];
    road_loop1.position = ccp(size.width/2, size.height/2);
    //background1.anchorPoint = ccp(0,0);
    offset1 = 0;
    [self addChild: road_loop1 z:SCENE_Z];
    
    road_loop2 = [CCSprite spriteWithFile:@"footprint_scroll.png" rect:CGRectMake(0, 0, 1024, 768)];
    offset2 = 1024;
    road_loop2.position = ccp(size.width/2 + offset2, size.height/2);
    [self addChild: road_loop2 z:SCENE_Z];
    
    
    front_offset1 = 0;
    road_front1 = [CCSprite spriteWithFile:@"footprint_scroll_front.png"];
    road_front1.position = ccp(size.width/2, size.height/2);
    [self addChild: road_front1 z:TEXT_Z];
    
    front_offset2 = 1024;
    road_front2 = [CCSprite spriteWithFile:@"footprint_scroll_front.png"];
    road_front2.position = ccp(size.width/2 + front_offset2, size.height/2);
    [self addChild: road_front2 z:TEXT_Z];
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
    
    id keepAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [keep runAction:keepAction];
    
    //Transition animation
    id roadLoop1Action = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(road_loop1.position.x - 400, road_loop1.position.y - 400)]],
                     [CCFadeTo actionWithDuration:transitionTime opacity:0],
                     nil];
    [road_loop1 runAction:roadLoop1Action];
    
    id roadLoop2Action = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(road_loop2.position.x - 400, road_loop2.position.y - 400)]],
                          [CCFadeTo actionWithDuration:transitionTime opacity:0],
                          nil];
    [road_loop2 runAction:roadLoop2Action];
    
    id roadGroundAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 400, size.height/2 - 400)]],
                          [CCFadeTo actionWithDuration:transitionTime opacity:0],
                          nil];
    [road_ground runAction:roadGroundAction];
    
    id roadFrontAction1 = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(road_front1.position.x - 400, road_front1.position.y - 400)]],
                           [CCFadeTo actionWithDuration:transitionTime opacity:0],
                           nil];
    [road_front1 runAction:roadFrontAction1];
    
    id roadFrontAction2 = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(road_front2.position.x - 400, road_front2.position.y - 400)]],
                           [CCFadeTo actionWithDuration:transitionTime opacity:0],
                           nil];
    [road_front2 runAction:roadFrontAction2];
    
    id _doorAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2, size.height/2)]],
                      [CCFadeTo actionWithDuration:transitionTime opacity:255],
                      [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                      nil];
    id doorAction = [CCSequence actions:_doorAction, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
    [door runAction:doorAction];
    
}

-(void)nextScene
{
    [[CCDirector sharedDirector] replaceScene:[Scene_7A sceneWithVar:1]];
}

@end
