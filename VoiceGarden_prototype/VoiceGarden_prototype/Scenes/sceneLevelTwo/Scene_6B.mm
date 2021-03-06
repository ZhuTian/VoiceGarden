//
//  Scene_6B.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_6B.h"
#import "GlobalVariable.h"
#import "Scene_7A.h"
#import "AudioManager.h"
//#define sceneFontSize 30

@implementation Scene_6B
@synthesize sceneStatus;


+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Scene_6B *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_6B node];
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
        
        label_1 = [CCLabelTTF labelWithString:@"I see a shimmering reflection of myself." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 50, size.height/2 + 300);
        label_1.anchorPoint = ccp(0,0.5);
        label_1.color = ccc3(0, 0, 0);
        label_1.opacity = 0;
		[self addChild: label_1 z:TEXT_Z];
        
        label_3 = [CCLabelTTF labelWithString:@"A little bit more confidently." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 50, size.height/2 + 250);
        label_3.anchorPoint = ccp(0,0.5);
        label_3.color = ccc3(0, 0, 0);
        label_3.opacity = 0;
		[self addChild: label_3 z:TEXT_Z];
        
        label_4 = [CCLabelTTF labelWithString:@"I step forward with the power of voice." fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 - 50, size.height/2 + 200);
        label_4.anchorPoint = ccp(0,0.5);
        label_4.color = ccc3(0, 0, 0);
        label_4.opacity = 0;
		[self addChild: label_4 z:TEXT_Z];
        
        label_2 = [CCLabelTTF labelWithString:@"I am ready to               ." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 50, size.height/2 + 150);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
        label_2.opacity = 0;
		[self addChild: label_2 z:TEXT_Z];
        
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        id label3Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:label3Action];
        id label4Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_4 runAction:label4Action];
		
        go = [CCMenuItemFont itemWithString:@"move on" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_7A sceneWithVar:1] withColor:ccWHITE]];
            [self SceneTransition];
        }];
        [go setFontName:fontName];
        [go setFontSize:_fontSize];
        [go setPosition:ccp( size.width/2 + 150, size.height/2 + 150)];
        [go setIsEnabled:false];
        [go setColor:ccc3(0,0,0)];
        go.opacity = 0;
        
        id goButtonAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [go runAction:goButtonAction];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Skip" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:go, action, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu z:TEXT_Z];
        
        
        //new
        
        footPrintLeft = [CCSprite spriteWithFile:@"foot_L.png"];
        footPrintLeft.scale = 0.3f;
        footPrintLeft.position = ccp(500, 220);
        footPrintLeft.rotation = 195;
        footPrintLeft.opacity = 0;
        [self addChild:footPrintLeft z:SCENE_Z tag:1];
        
        footPrintRight = [CCSprite spriteWithFile:@"foot_R.png"];
        footPrintRight.scale = 0.3f;
        footPrintRight.position = ccp(470, 270);
        footPrintRight.rotation = 195;
        footPrintRight.opacity = 0;
        [self addChild:footPrintRight z:SCENE_Z tag:2];
        
        //Fade in footprints
        id footLeftAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [footPrintLeft runAction:footLeftAction];
        id footRightAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [footPrintRight runAction:footRightAction];
        
        status = 1;
        timer = 30;
        isLeft = true;
        [self scheduleUpdate];
        
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
    
    path = [CCSprite spriteWithFile:@"path.png"];
    path.position = ccp(size.width/2 + 900, size.height/2 - 300);
    [self addChild: path z:SCENE_Z];
    
    pond = [CCSprite spriteWithFile:@"pond.png"];
    pond.position = ccp(size.width/2 + 470, size.height/2);
    pond.scale = 0.8f;
    [self addChild: pond z:SCENE_Z];
    
    door = [CCSprite spriteWithFile:@"door.png"];
    door.position = ccp(size.width/2 - 300, size.height/2 + 100);
    door.scale = 0.8f;
    [self addChild: door z:SCENE_Z];

    tip_down = [CCSprite spriteWithFile:@"tip_down_L.png"];
    tip_down.position = ccp(size.width/2 - 100, size.height/2 - 250);
    [self addChild:tip_down z:3];
    
    tip_up = [CCSprite spriteWithFile:@"tip_footstep.png"];
    tip_up.position = ccp(size.width/2 - 100, size.height/2 - 250);
    tip_up.visible = false;
    [self addChild:tip_up z:3];

    
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
    
    //Fade out button
    id goButtonAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [go runAction:goButtonAction];
    
    //Fade out footprints
    id footLeftAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [footPrintLeft runAction:footLeftAction];
    id footRightAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [footPrintRight runAction:footRightAction];
    
    //Transition animation
    id _pathAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 900 + 400, size.height/2 - 300 - 300)]],
                      [CCFadeTo actionWithDuration:transitionTime opacity:0],
                      [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                      nil];
    id pathAction = [CCSequence actions:_pathAction,
                     [CCCallFunc actionWithTarget:self selector:@selector(nextScene)],
                     nil];
    [path runAction:pathAction];
    
    
    id pondAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 470 + 400, size.height/2 - 300)]],
                     [CCScaleTo actionWithDuration:transitionTime scale:0.8f],
                     [CCFadeTo actionWithDuration:transitionTime opacity:0],
                     nil];
    [pond runAction:pondAction];
    
    id doorAction = [CCSpawn actions:[CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2, size.height/2)]],
                     [CCScaleTo actionWithDuration:transitionTime scale:1.0f],
                     [CCFadeTo actionWithDuration:transitionTime opacity:255],
                     nil];
    [door runAction:doorAction];
    
    id tipAction = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    if (tip_down.visible==true) {
        [tip_down runAction:tipAction];
    }
    else{
        [tip_up runAction:tipAction];
    }

}

-(void)nextScene
{
    [[CCDirector sharedDirector] replaceScene:[Scene_7A sceneWithVar:1]];
}

-(void)updateScene
{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else if(self.sceneStatus == 2)
    {
        [go setIsEnabled:true];
        [go setColor:ccc3(100, 100, 100)];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [go runAction: [CCSequence actions:action, action2, nil]];
        [go runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
    }
}

-(void)update:(ccTime)dt
{
    float volume = [[AudioManager sharedInstance] getAverageVolume];
    //NSLog(@"%f",volume);
    if (volume>-30&&status !=7) {
        timer-=1;
        
        if(timer == 0)
        {
            timer = 30;
            if(isLeft == false)
            {
                isLeft = true;
                if(footPrintRight.position.y <= 300)
                {
                    footPrintRight.position = ccp(footPrintRight.position.x - 80, footPrintRight.position.y + 30);
                }
                else if(footPrintRight.position.y <= 350)
                {
                    footPrintRight.position = ccp(footPrintRight.position.x - 50, footPrintRight.position.y + 30);
                    footPrintRight.rotation = 240;
                }
                else if(footPrintRight.position.y <= 380)
                {
                    footPrintRight.position = ccp(footPrintRight.position.x + 10, footPrintRight.position.y + 60);
                    footPrintRight.rotation = 290;
                }
                else if(footPrintRight.position.y <= 470)
                {
                    footPrintRight.position = ccp(footPrintRight.position.x + 80, footPrintRight.position.y + 40);
                    footPrintRight.rotation = 330;
                }
                else
                {
                    self.sceneStatus = 2;
                    [self updateScene];
                    status = 7;
                }
            }
            else
            {
                isLeft = false;
                if(footPrintLeft.position.y <= 300)
                {
                    footPrintLeft.position = ccp(footPrintLeft.position.x - 80, footPrintLeft.position.y + 30);
                }
                else if(footPrintLeft.position.y <= 330)
                {
                    footPrintLeft.position = ccp(footPrintLeft.position.x - 50, footPrintLeft.position.y + 50);
                    footPrintLeft.rotation = 240;
                }
                else if(footPrintLeft.position.y <= 400)
                {
                    footPrintLeft.position = ccp(footPrintLeft.position.x + 30, footPrintLeft.position.y + 80);
                    footPrintLeft.rotation = 290;
                }
                else if(footPrintLeft.position.y <= 470)
                {
                    footPrintLeft.position = ccp(footPrintLeft.position.x + 120, footPrintLeft.position.y + 60);
                    footPrintLeft.rotation = 330;
                }
                
            }
        }
//        if (timer==0) {
//            if(isLeft==false){
//                if(footPrintRight.position.x<350){
//                    footPrintRight.position = ccp(footPrintRight.position.x+50, footPrintRight.position.y);
//                    isLeft = true;
//                }
//                else if(footPrintRight.position.x>=350&&footPrintRight.position.x<=550){
//                    footPrintRight.rotation = -15;
//                    footPrintRight.position = ccp(footPrintRight.position.x+50, footPrintRight.position.y+10);
//                    isLeft = true;
//                }
//                else if(footPrintRight.position.x<900&&footPrintRight.position.x>550){
//                    footPrintRight.position = ccp(footPrintRight.position.x+50, footPrintRight.position.y+10);
//                    isLeft = true;
//                }
//                else{
//                    self.sceneStatus = 2;
//                    [self updateScene];
//                    status = 7;
//                }
//            }
//            else{
//                if(footPrintLeft.position.x<350){
//                    footPrintLeft.position = ccp(footPrintLeft.position.x+50, footPrintLeft.position.y);
//                    isLeft = false;
//                }
//                else if (footPrintLeft.position.x>=350&&footPrintLeft.position.x<=550){
//                    footPrintLeft.rotation = -15;
//                    footPrintLeft.position = ccp(footPrintLeft.position.x+50, footPrintLeft.position.y+10);
//                    isLeft = false;
//                }
//                else if(footPrintLeft.position.x<900&&footPrintLeft.position.x>550){
//                    footPrintLeft.position = ccp(footPrintLeft.position.x+50, footPrintLeft.position.y+10);
//                    isLeft = false;
//                }
//            }
//            timer = 30;
//        }
    }
}

@end
