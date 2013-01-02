//
//  Scene_3B.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_4C.h"
#import "Scene_3B.h"
#import "AudioManager.h"
#import "GlobalVariable.h"
#define _fontSize 30


@implementation Scene_3B
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_3B *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_3B node];
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
        fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
=======
        CCSprite* background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        //int _fontSize = 30;
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        
        transitionTime = 1.0f;
        
        [self initSprites];
        
        label_1 = [CCLabelTTF labelWithString:@"I tried to talk but realize." fontName:fontName fontSize:_fontSize];
<<<<<<< HEAD
		label_1.position =  ccp( size.width /2 - 50, size.height/2 - 150);
=======
		label_1.position =  ccp( size.width /2 + 100, size.height/2 - 200);
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1];
        
<<<<<<< HEAD
        label_2 = [CCLabelTTF labelWithString:@"My voice               as the garden." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 50, size.height/2 - 200);
=======
        label_2 = [CCLabelTTF labelWithString:@"that my voice has               as the garden." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 + 210, size.height/2 - 240);
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"I am              ." fontName:fontName fontSize:_fontSize];
<<<<<<< HEAD
		label_3.position =  ccp( size.width /2 - 50, size.height/2 - 250);
=======
		label_3.position =  ccp( size.width /2 + 20, size.height/2 - 280);
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		[self addChild: label_3];
        
        //Fade in the scripts
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];

        
        withered = [CCMenuItemFont itemWithString:@"withered" block:^(id sender){
//            if(self.sceneStatus == 1 || self.sceneStatus == 2)
//            {
//                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:1] withColor:ccWHITE]];
//            }
//            else if(self.sceneStatus == 3)
//            {
//                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:4] withColor:ccWHITE]];
//            }
            
            [self SceneTransition];
        }];
        [withered setFontName:fontName];
        [withered setFontSize:_fontSize];
<<<<<<< HEAD
        [withered setPosition:ccp( size.width/2 + 140, size.height/2 - 200)];
=======
        [withered setPosition:ccp( size.width/2 + 230, size.height/2 - 240)];
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        [withered setIsEnabled:false];
        [withered setColor:ccc3(0,0,0)];
        withered.opacity = 0;
        
        waiting = [CCMenuItemFont itemWithString:@"waiting" block:^(id sender){
            ;
        }];
        [waiting setFontName:fontName];
        [waiting setFontSize:_fontSize];
<<<<<<< HEAD
        [waiting setPosition:ccp( size.width/2 + 80, size.height/2 - 250)];
=======
        [waiting setPosition:ccp( size.width/2 + 40 , size.height/2 - 280)];
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        [waiting setIsEnabled:false];
        [waiting setColor:ccc3(0,0,0)];
        waiting.opacity = 0;
        
        id witheredAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [withered runAction:witheredAction];
        id waitingAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [waiting runAction:waitingAction];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
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
        
        CCMenuItem *menu = [CCMenu menuWithItems:withered, waiting, action, nil];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        //Init word spawn fucntion
        spawnThreshold = -30;
        levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
        
        //Init word position
        spawnPosition[0].x = size.width/2 ;
        spawnPosition[0].y = size.height/2 + 200 ;
        
        spawnPosition[1].x = size.width/2 + 220;
        spawnPosition[1].y = size.height/2 - 50;
        
        spawnPosition[2].x = size.width/2 +60;
        spawnPosition[2].y = size.height/2 + 140 ;
        
        spawnPosition[3].x = size.width/2 - 370;
        spawnPosition[3].y = size.height/2 ;
        
        spawnPosition[4].x = size.width/2 + 370;
        spawnPosition[4].y = size.height/2 + 200;
        
        spawnPosition[5].x = size.width/2 - 300;
        spawnPosition[5].y = size.height/2 - 300;
        
        spawnPosition[6].x = size.width/2 + 220;
        spawnPosition[6].y = size.height/2 - 100;
        
        spawnPosition[7].x = size.width/2 + 80;
        spawnPosition[7].y = size.height/2 - 250;
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite];
        }
        
        [self initSprites];
        
	}
	return self;
}

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2 - 620, size.height/2 - 20);
    silence.opacity = 255;
    [self addChild:silence];
    
    silence_light = [CCSprite spriteWithFile:@"silence_light.png"];
    silence_light.position = ccp(size.width/2 + 20, size.height/2);
    silence_light.opacity = 255;
    [self addChild:silence_light];
    
    tree = [CCSprite spriteWithFile:@"key_tree_right.png"];
    tree.position = ccp(size.width/2 + 300, size.height/2 - 500);
    tree.opacity = 255;
    tree.scale = 0.5;
    [self addChild:tree];
    
}

- (void)levelTimerCallback:(NSTimer *)timer {
    float currentVolume = [[AudioManager sharedInstance] getAverageVolume];
    if(currentVolume >= spawnThreshold && !hasSpawn)
    {
        if(spawnIndex < 7)
        {
            spawnWord[spawnIndex] = [CCLabelTTF labelWithString:@"Hewow" fontName:fontName fontSize:_fontSize];
            spawnWord[spawnIndex].position =  spawnPosition[spawnIndex];
            spawnWord[spawnIndex].color = ccc3(0, 0, 0);
            [self addChild: spawnWord[spawnIndex]];
            [spawnWord[spawnIndex] runAction:[CCFadeOut actionWithDuration:1]];
            spawnIndex++;
            hasSpawn = true;
        }
        else if(spawnIndex == 7)
        {
            spawnWord[spawnIndex] = [CCLabelTTF labelWithString:@"openning" fontName:fontName fontSize:_fontSize];
            spawnWord[spawnIndex].position =  spawnPosition[spawnIndex];
            spawnWord[spawnIndex].color = ccc3(0, 0, 0);
            [self addChild: spawnWord[spawnIndex]];
            spawnIndex++;
            hasSpawn = true;
            
<<<<<<< HEAD
            //Word transition effect
//            int i;
//            for(i = 0; i < 7; i++)
//            {
//                [spawnWord[i] runAction:[CCFadeOut actionWithDuration:1]];
//            }
            [waiting runAction:[CCFadeOut actionWithDuration:0.01]];
            //[spawnWord[7] runAction:[CCMoveTo actionWithDuration:1 position:waiting.position]];
            spawnWord[7].opacity = 0;
            [spawnWord[7] runAction:[CCFadeTo actionWithDuration:transitionTime opacity:255]];
=======
            [waiting runAction:[CCFadeOut actionWithDuration:2]];
            [spawnWord[7] runAction:[CCMoveTo actionWithDuration:2 position:waiting.position]];
>>>>>>> c6746c9406feea18e1b2a6be883b48d99ac94c4d
        }
    }
    if(currentVolume < spawnThreshold && hasSpawn)
    {
        hasSpawn = false;
    }
    
    //Trigger action
    if(waiting.opacity == 0 && self.sceneStatus != 2)
    {
        //waiting.opacity = 255;
        //spawnWord[7].opacity = 0;
        self.sceneStatus = 2;
        [self updateScene];
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
    light = [CCSprite spriteWithFile:@"silence_light.png"];
    light.position = ccp(size.width/2, size.height/2);
    light.scale = 1.0f;
    [self addChild: light z:BACKGROUND_Z];
    
    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2 - 600, size.height/2 - 50);
    silence.scale = 1.0f;
    [self addChild: silence z:BACKGROUND_Z];
    
    tree_nest = [CCSprite spriteWithFile:@"tree_nest.png"];
    tree_nest.position = ccp(size.width/2 + 250 + 400, size.height/2 - 100 - 400);
    tree_nest.scale = 0.7f;
    tree_nest.opacity = 0;
    [self addChild: tree_nest z:BACKGROUND_Z];

    
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
    
    id witheredAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [withered runAction:witheredAction];
    id waitingAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [waiting runAction:waitingAction];
    
    //Scene Transition Animation
    id silenceAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 600, size.height/2 + 100)],
                     [CCFadeTo actionWithDuration:transitionTime opacity:255],
                     [CCScaleTo actionWithDuration:transitionTime scale:0.7f],
                     nil];
    
    [silence runAction:silenceAction];
    
    id lightAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150, size.height/2 + 120)],
                        [CCFadeTo actionWithDuration:transitionTime opacity:255],
                        [CCScaleTo actionWithDuration:transitionTime scale:0.7f],
                        nil];
    
    [light runAction:lightAction];
    
    id _treeAction = [CCSpawn actions: [CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 250, size.height/2 - 100)],
                      [CCFadeTo actionWithDuration:transitionTime opacity:255],
                      [CCScaleTo actionWithDuration:transitionTime scale:0.9f],
                      nil];
    
    id treeAction = [CCSequence actions:_treeAction, [CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
    [tree_nest runAction:treeAction];
    
}

-(void)nextScene
{
    if(self.sceneStatus == 1 || self.sceneStatus == 2)
    {
        [[CCDirector sharedDirector] replaceScene:[Scene_4C sceneWithVar:1]];
    }
    else if(self.sceneStatus == 3)
    {
        [[CCDirector sharedDirector] replaceScene:[Scene_4C sceneWithVar:4]];
    }
}

-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        
    }
    else if(self.sceneStatus == 2 || self.sceneStatus == 3)
    {
        //NSLog(@"Bounce");
        [withered setIsEnabled:true];
        [withered setColor:ccc3(100,100,100)];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];

        [withered runAction: [CCSequence actions:action, action2, nil]];
        [withered runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
    }
}

@end
