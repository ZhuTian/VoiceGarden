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

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"Spring_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        int yOffset = 50;
        int _fontSize = 26;
        
        label_1 = [CCLabelTTF labelWithString:@"It's April." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 170, size.height/2 + yOffset);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"But where are the signs of spring?" fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 20, size.height/2 - 40 + yOffset);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"The flowers have shrunken" fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 70, size.height/2 - 80 + yOffset);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"and the tree leaves are falling." fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 - 40, size.height/2 - 120 + yOffset);
        label_4.color = ccc3(0, 0, 0);
		[self addChild: label_4];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            if(self.preScene == 1 || self.preScene == 3)
            {
                if(self.sceneStatus == 2)
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:3] withColor:ccWHITE]];
                else
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.preScene == 2 || self.preScene == 4)
            {
                if(self.sceneStatus == 2)
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:4] withColor:ccWHITE]];
                else
                    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:2] withColor:ccWHITE]];
            }
        }];
        
        [back setFontName:fontName];
        [back setFontSize:30];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:30];
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
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite];
        }
        
	}
	return self;
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

    if(position.y == bloomPosition.y && abs(position.x - bloomPosition.x) <= 20)
    {
        bloomCollected = true;
        bloomLabel.visible = false;
    }
    
    if(position.y == swayPosition.y && abs(position.x - swayPosition.x) <= 20)
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
