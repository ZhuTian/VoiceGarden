//
//  Scene_5A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_5B.h"
#import "Scene_4C.h"
#import "AudioManager.h"
#import "GlobalVariable.h"

@implementation Scene_5B
@synthesize sceneStatus;
@synthesize preScene;

+(CCScene *) sceneWithVar: (int)_sceneType preScene:(int)_preScene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene_5B *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_5B node];
    layer.sceneStatus = _sceneType;
    layer.preScene = _preScene;
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
    
    if (loc.x > 400 && loc.x<480 && loc.y > 50 && loc.y < 110) {
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
        
        int yOffset = -150;
        //int _fontSize = 26;
        
        label_1 = [CCLabelTTF labelWithString:@"It's April." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 160, size.height/2 + 40 + yOffset);
        label_1.color = ccc3(0, 0, 0);
        label_1.opacity = 0;
		[self addChild: label_1 z:TEXT_Z];
        
        label_2 = [CCLabelTTF labelWithString:@"The butterfly dances with my voice." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 15, size.height/2 + yOffset);
        label_2.color = ccc3(0, 0, 0);
        label_2.opacity = 0;
		[self addChild: label_2 z:TEXT_Z];
        
        label_3 = [CCLabelTTF labelWithString:@"But where are the signs of spring?" fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 20, size.height/2 - 40 + yOffset);
        label_3.color = ccc3(0, 0, 0);
        label_3.opacity = 0;
		[self addChild: label_3 z:TEXT_Z];
        
        label_4 = [CCLabelTTF labelWithString:@"The flowers have shrunken" fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 - 70, size.height/2 - 80 + yOffset);
        label_4.color = ccc3(0, 0, 0);
        label_4.opacity = 0;
		[self addChild: label_4 z:TEXT_Z];
        
        label_5 = [CCLabelTTF labelWithString:@"and the tree leaves are falling." fontName:fontName fontSize:_fontSize];
		label_5.position =  ccp( size.width /2 - 40, size.height/2 - 120 + yOffset);
        label_5.color = ccc3(0, 0, 0);
        label_5.opacity = 0;
		[self addChild: label_5 z:TEXT_Z];
        
        id labelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:labelAction];
        labelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:labelAction];
        labelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_3 runAction:labelAction];
        labelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_4 runAction:labelAction];
        labelAction = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_5 runAction:labelAction];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){   [self sceneTransition];   }];
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
        
        CCMenuItem *menu = [CCMenu menuWithItems:back, action, keep, nil];
        
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        bloomLabel = [CCLabelTTF labelWithString:@"blooming." fontName:fontName fontSize:_fontSize];
		bloomLabel.position =  ccp(500, 600);
        bloomLabel.color = ccc3(0, 0, 0);
		[self addChild: bloomLabel];
        bloomPosition = bloomLabel.position;
        
        swayLabel = [CCLabelTTF labelWithString:@"swaying." fontName:fontName fontSize:_fontSize];
		swayLabel.position =  ccp(200, 700);
        swayLabel.color = ccc3(0, 0, 0);
		[self addChild: swayLabel];
        swayPosition = swayLabel.position;        
        
        CCSpriteFrameCache *cache =[CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:@"butterfly.plist"];
        
        //frame array
        NSMutableArray *framesArray=[NSMutableArray array];
        
        NSString *frameName=[NSString stringWithFormat:@"butterfly.png"];
        id frameObject =[cache spriteFrameByName:frameName];
        [framesArray addObject:frameObject];
        
        NSString * frameName_2 = [NSString stringWithFormat:@"butterfly_2.png"];
        id frameObject_2 = [cache spriteFrameByName:frameName_2];
        [framesArray addObject:frameObject_2];
        
        //animation object
        id animObject=[CCAnimation animationWithSpriteFrames:framesArray delay:0.1];
        
        //animation action
        id animAction =[CCAnimate actionWithAnimation:animObject];
        animAction = [CCRepeatForever actionWithAction:animAction];
        
        CCSprite* butterflySprite = [CCSprite spriteWithSpriteFrameName:@"butterfly.png"];
        butterflySprite.position = ccp(100, 500);
        [butterflySprite runAction:animAction];
        
        [self addChild:butterflySprite z:10 tag:10];
        
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
    
    CCSprite* background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background];
    
    treeLeft = [CCSprite spriteWithFile:@"finalSpring_tree_L.png"];
    treeLeft.position = ccp(size.width/2,size.height/2);
    [self addChild:treeLeft];
    
    treeRight = [CCSprite spriteWithFile:@"tree_nest.png"];
    treeRight.position = ccp(size.width/2+210,size.height/2+200);
    treeRight.scale = 0.9;
    [self addChild:treeRight];
    
    bottomRight = [CCSprite spriteWithFile:@"finalSpring_BottomRight.png"];
    bottomRight.position=ccp(size.width/2, size.height/2);
    [self addChild:bottomRight];
    
    silence = [CCSprite spriteWithFile:@"silence.png"];
    silence.position = ccp(size.width/2 - 150, size.height/2 + 320);
    silence.scale = 0.7f;
    silence.opacity = 0;
    [self addChild: silence z:BACKGROUND_Z];
    
    tip_down = [CCSprite spriteWithFile:@"tip_down_L.png"];
    tip_down.position = ccp(size.width/2 + 100, size.height/2 - 250);
    [self addChild:tip_down z:3];
    
    tip_up = [CCSprite spriteWithFile:@"tip_spring.png"];
    tip_up.position = ccp(size.width/2 + 100, size.height/2 - 250);
    tip_up.visible = false;
    [self addChild:tip_up z:3];
}

-(void)sceneTransition
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
    
    id label5Action = [CCFadeTo actionWithDuration:transitionTime opacity:0];
    [label_5 runAction:label5Action];
    
    id silenceAction = [CCSpawn actions:    [CCFadeTo actionWithDuration:transitionTime opacity:255],
                                            [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, -200)]],
                                            nil];
    [silence runAction:silenceAction];
    
    id treeLeftAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                                        [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, -200)]],
                                        nil];
    [treeLeft runAction:treeLeftAction];
    
    id bottomAction = [CCSpawn actions:[CCFadeTo actionWithDuration:transitionTime opacity:0],
                       [CCEaseExponentialOut actionWithAction:[CCMoveBy actionWithDuration:transitionTime position:ccp(0, -200)]],
                       nil];
    [bottomRight runAction:bottomAction];
    
    id _treeRightAction = [CCEaseExponentialOut actionWithAction:[CCMoveTo actionWithDuration:transitionTime position:ccp(size.width/2 + 250, size.height/2 - 100)]];
    id treeRightAction = [CCSequence actions:_treeRightAction,[CCCallFunc actionWithTarget:self selector:@selector(nextScene)], nil];
    [treeRight runAction:treeRightAction];
    
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
    if(self.preScene == 1 || self.preScene == 3)
    {
        if(self.sceneStatus == 2)
            [[CCDirector sharedDirector] replaceScene:[Scene_4C sceneWithVar:3]];
        else
            [[CCDirector sharedDirector] replaceScene:[Scene_4C sceneWithVar:1]];
    }
    else if(self.preScene == 2 || self.preScene == 4)
    {
        if(self.sceneStatus == 2)
            [[CCDirector sharedDirector] replaceScene:[Scene_4C sceneWithVar:4]];
        else
            [[CCDirector sharedDirector] replaceScene:[Scene_4C sceneWithVar:2]];
    }
}


- (void)dealloc {

  	[super dealloc];
}

-(void)update:(ccTime)dt
{
    CCSprite* butterfly = (CCSprite* )[self getChildByTag:10];
    CGPoint position = butterfly.position;
    if (position.x > 1024) {
        position.x = 0;
    }
    
    float fre = [[AudioManager sharedInstance] getFundamentalFrequency];
    float volume = [[AudioManager sharedInstance] getAverageVolume];
    
    if (volume>-40) {
    
        if (fre>0&&fre<300) {
            if (position.y> 500) {
                position.y -= 3;
            }
            if (position.y<500) {
                position.y = 500;
            }
        }
        else if(fre >= 300&&fre<700){
            if (position.y>600) {
                position.y-=3;
            }
            else if(position.y<600){
                position.y+=10;
            }
        }
        else if(fre >= 700){
            if (position.y<700) {
                position.y+=3;
            }
            else
                position.y = 700;
        }
    
    }
    else {
        if (position.y > 500) {
            position.y -=3;
        }
        if (position.y<=500) {
            position.y = 500;
        }
    }
    
    butterfly.position = ccp(position.x+2, position.y);
    
    [self detectCollision];
}


-(void)updateScene
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    if(self.sceneStatus == 2)
    {
        label_3.string = @"The flowers have blooming";
        label_3.position = ccp(size.width /2 - 75, label_3.position.y);
        label_4.string = @"and the tree leaves are swaying.";
        label_4.position = ccp(size.width /2 - 40+ 10, label_4.position.y);
        CCSprite* butterfly = (CCSprite*)[self getChildByTag:10];
        [butterfly setVisible:false];
        [bloomLabel setVisible:false];
        [swayLabel setVisible:false];
    }
}

-(void)detectCollision
{
    //CGPoint footPosition = [footprintManager getLatestPosition];
    CCSprite* butterfly = (CCSprite*)[self getChildByTag:10];
    CGPoint position = butterfly.position;

    if(abs(position.y - bloomPosition.y) <= 30 && abs(position.x - bloomPosition.x) <= 80)
    {
        bloomCollected = true;
        bloomLabel.visible = false;
    }
    
    if(abs(position.y - swayPosition.y) <= 30 && abs(position.x - swayPosition.x) <= 80)
    {
        swayCollected = true;
        swayLabel.visible = false;
    }
    
    if(swayCollected && bloomCollected)
    {
        sceneStatus = 2;
        [self updateScene];
    }
}

@end
