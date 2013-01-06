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
//#define _fontSize 30


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

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint loc=[touch locationInView:[touch view]];
    loc=[[CCDirector sharedDirector] convertToGL:loc];
    
    if (loc.x > 850 && loc.x<900 && loc.y > 110 && loc.y < 150) {
        if (tip.visible == true) {
            tip.visible = false;
            tipSilence.visible = true;
        }
        else if (tip.visible == false){
            tipSilence.visible = false;
            tip.visible = true;
        }
    }
    
    
    NSLog(@"(%g,%g)", loc.x,loc.y);
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        self.isTouchEnabled = true;
        
        fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        transitionTime = 1.0f;
        
        [self initSprites];
        
        label_1 = [CCLabelTTF labelWithString:@"I tried to talk but realize." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 50, size.height/2 + 250);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
        label_1.opacity = 0;
		[self addChild: label_1 z:TEXT_Z];
        
        label_2 = [CCLabelTTF labelWithString:@"My voice               as the garden." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 50, size.height/2 + 200);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2  z:TEXT_Z];
        
        label_3 = [CCLabelTTF labelWithString:@"I am              ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 50, size.height/2 + 150);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        label_3.opacity = 0;
		[self addChild: label_3  z:TEXT_Z];
        
        //Fade in the scripts
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];

        
        withered = [CCMenuItemFont itemWithString:@"withered" block:^(id sender){            
            [self SceneTransition];
        }];
        [withered setFontName:fontName];
        [withered setFontSize:_fontSize];
        [withered setPosition:ccp( size.width/2 + 100, size.height/2 + 200)];
        [withered setIsEnabled:false];
        [withered setColor:ccc3(0,0,0)];
        withered.opacity = 0;
        
        waiting = [CCMenuItemFont itemWithString:@"waiting" block:^(id sender){
            ;
        }];
        [waiting setFontName:fontName];
        [waiting setFontSize:_fontSize];
        [waiting setPosition:ccp( size.width/2 + 50, size.height/2 + 150)];
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
		[self addChild:menu z:TEXT_Z];
        
        //Init word spawn fucntion
        spawnThreshold = -30;
        levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
        
        //Init word position
        spawnPosition[0].x = size.width/2 ;
        spawnPosition[0].y = size.height/2 - 200 ;
        
        spawnPosition[1].x = size.width/2 + 220;
        spawnPosition[1].y = size.height/2 - 250;
        
        spawnPosition[2].x = size.width/2 - 260;
        spawnPosition[2].y = size.height/2 + 140 ;
        
        spawnPosition[3].x = size.width/2 - 370;
        spawnPosition[3].y = size.height/2 ;
        
        spawnPosition[4].x = size.width/2 + 370;
        spawnPosition[4].y = size.height/2 - 200;
        
        spawnPosition[5].x = size.width/2 - 300;
        spawnPosition[5].y = size.height/2 - 300;
        
        spawnPosition[6].x = size.width/2 + 220;
        spawnPosition[6].y = size.height/2 - 100;
        
        spawnPosition[7].x = size.width/2 + 50;
        spawnPosition[7].y = size.height/2 + 150;
        
        spawnContent[0] = @"O";
        spawnContent[1] = @"Op";
        spawnContent[2] = @"Ope";
        spawnContent[3] = @"Open";
        spawnContent[4] = @"Openi";
        spawnContent[5] = @"Openin";
        spawnContent[6] = @"Opening";
        
        if ([GlobalVariable sharedInstance].haveKey == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key_collect.png"];
            keySprite.position = ccp(950, 200);
            [self addChild:keySprite z: 10 tag:20];
        }
        
        [self initSprites];
        
	}
	return self;
}


- (void)levelTimerCallback:(NSTimer *)timer {
    float currentVolume = [[AudioManager sharedInstance] getAverageVolume];
    if(currentVolume >= spawnThreshold && !hasSpawn)
    {
        if(spawnIndex < 7)
        {
            spawnWord[spawnIndex] = [CCLabelTTF labelWithString:spawnContent[spawnIndex] fontName:fontName fontSize:_fontSize];
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
        
    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2, size.height/2);
    silence.scale = 1.0f;
    [self addChild: silence z:BACKGROUND_Z];
    
    tree_nest = [CCSprite spriteWithFile:@"tree_nest.png"];
    tree_nest.position = ccp(size.width/2 + 250 + 400, size.height/2 - 100 - 400);
    tree_nest.scale = 0.7f;
    tree_nest.opacity = 0;
    [self addChild: tree_nest z:BACKGROUND_Z];
    
    tip = [CCSprite spriteWithFile:@"tip_up_R.png"];
    tip.position = ccp(size.width/2 + 100, size.height/2 - 200);
    [self addChild:tip];
    
    tipSilence = [CCSprite spriteWithFile:@"tip_silence.png"];
    tipSilence.position = ccp(size.width/2 + 100, size.height/2 - 200);
    tipSilence.visible = false;
    [self addChild:tipSilence];
    
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
    id silenceAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 - 150, size.height/2 + 120)]],
                     [CCFadeTo actionWithDuration:transitionTime opacity:255],
                     [CCScaleTo actionWithDuration:transitionTime scale:0.7f],
                     nil];
    
    [silence runAction:silenceAction];
    
    id tipAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    if (tip.visible==true) {
        [tip runAction:tipAction];
    }
    else{
        [tipSilence runAction:tipAction];
    }
    
    
    id _treeAction = [CCSpawn actions: [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 250, size.height/2 - 100)]],
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
        
    }
}

@end
