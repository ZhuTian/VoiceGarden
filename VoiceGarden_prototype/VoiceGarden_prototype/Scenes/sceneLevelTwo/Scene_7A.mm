//
//  Scene_7A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_7A.h"
#import "GlobalVariable.h"
#import "Scene_4C.h"
#import "Scene_8A.h"

@implementation Scene_7A
@synthesize sceneStatus;


+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_7A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_7A node];
    if([GlobalVariable sharedInstance].haveKey)
    {
        layer.sceneStatus = 1;
    }
    else
    {
        layer.sceneStatus = 2;
    }
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
        transitionTime = 2.0f;
        
        int _fontSize = 30;
        
        
        label_1 = [CCLabelTTF labelWithString:@"I reach the end of the path." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 450, size.height/2 + 100);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"There is a door awaiting for me." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 450, size.height/2 + 50);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"I         the door with the key." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 450, size.height/2);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
        [self addChild:label_3];
        
        
        //Fade in scripts
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
        
		
        open = [CCMenuItemFont itemWithString:@"open" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_8A sceneWithVar:1] withColor:ccWHITE]];
            [self SceneTransition];
        }];
        [open setFontName:fontName];
        [open setFontSize:_fontSize];
        [open setPosition:ccp( size.width/2 - 395, size.height/2)];
        [open setIsEnabled:false];
        [open setColor:ccc3(0, 0, 0)];
        open.opacity = 0;
        
        
        secret = [CCMenuItemFont itemWithString:@"secret" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:1] withColor:ccWHITE]];
        }];
        [secret setFontName:fontName];
        [secret setFontSize:_fontSize];
        [secret setPosition:ccp( size.width/2 - 310, size.height/2)];
        [secret setIsEnabled:false];
        [secret setColor:ccc3(100, 100, 100)];
        secret.visible = false;
        secret.opacity = 0;
        
        id openAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [open runAction:openAction];
        id secretAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [secret runAction:secretAction];
        
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        action_button = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 3;
            [self updateScene];
        }];
        [action_button setFontName:fontName];
        [action_button setFontSize:_fontSize];
        [action_button setPosition:ccp( size.width - 100, 30)];
        [action_button setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:open, secret, action_button, nil];
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
    
    
    door = [CCSprite spriteWithFile:@"door.png"];
    door.position = ccp(size.width/2, size.height/2);
    door.scale = 1.0f;
    [self addChild: door z:SCENE_Z];
    
    
}

-(void)SceneTransition
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //Fade out scripts and button
    id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_1 runAction:label1Action];
    id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_2 runAction:label2Action];
    id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_3 runAction:label3Action];
    
    id openAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [open runAction:openAction];
    id secretAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [secret runAction:secretAction];
    
    //Transition animation
    id _doorAction = [CCSpawn actions:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2, size.height/2)],
                      [CCFadeTo actionWithDuration:transitionTime opacity:255],
                      [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                      nil];
    id doorAction = [CCSequence actions:_doorAction,
                     [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],
                     nil];
    [door runAction:doorAction];
}

-(void)nextScene
{
    [[CCDirector sharedDirector] replaceScene:[Scene_8A sceneWithVar:1]];
}

-(void)updateScene
{
    if(self.sceneStatus == 1)
    {
        //CGSize size = [[CCDirector sharedDirector] winSize];
        //CCSprite* background = [CCSprite spriteWithFile:@"door_bg.png"];
        //background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        //[self addChild: background z:-1];
        

    }
    else if(self.sceneStatus == 2)
    {
        //CGSize size = [[CCDirector sharedDirector] winSize];
        //CCSprite* background = [CCSprite spriteWithFile:@"door_bg.png"];
        //background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        //[self addChild: background z:-1];
        
        [open setIsEnabled:false];
        open.visible = false;
        secret.visible = true;
        [secret setIsEnabled:true];
        [secret setColor:ccc3(100, 100, 100)];
        
        label_1.string = @"The door is locked";
        label_2.string = @"Where is the key?";
        label_3.string = @"It's a            .";
        action_button.visible = false;
        [action_button setIsEnabled:false];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [secret runAction: [CCSequence actions:action, action2, nil]];
        [secret runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
    else if(self.sceneStatus == 3)
    {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"door_open.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background z:-1];
        
        
        [open setIsEnabled:true];
        [open setColor:ccc3(100, 100, 100)];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [open runAction: [CCSequence actions:action, action2, nil]];
        [open runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
}
@end