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
        CCSprite* background = [CCSprite spriteWithFile:@"bg1.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        int xOffset = 150, yOffset = 250;
        int _fontSize = 32;
        
        label_1 = [CCLabelTTF labelWithString:@"It's April." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 + xOffset, size.height/2 - 40 + yOffset);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"But where are the signs of spring?" fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 + xOffset, size.height/2 - 100 + yOffset);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"The flowers have shrunken and the tree leaves are falling to the ground." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 + xOffset, size.height/2 - 160 + yOffset);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
        
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
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:48];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:back, action, keep, nil];
        
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.5 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
        
        //Initiate footprint manager
        footprintManager = [FootprintManager_old initManager:self];
        
        //Initiate collectable items;
        bloomCollected = false;
        swayCollected = false;
        
        bloomPosition = CGPointMake(200, footprintManager->midY),
        bloomLabel = [CCLabelTTF labelWithString:@"blooming" fontName:fontName fontSize:40];
		bloomLabel.position =  bloomPosition;
        bloomLabel.color = ccc3(0, 0, 0);
		[self addChild: bloomLabel];
        
        swayPosition = CGPointMake(400, footprintManager->lowY),
        swayLabel = [CCLabelTTF labelWithString:@"swaying" fontName:fontName fontSize:40];
		swayLabel.position =  swayPosition;
        swayLabel.color = ccc3(0, 0, 0);
		[self addChild: swayLabel];
        
        collisionThreshold = 40;
        
        [self schedule:@selector(updateFootOpacity:) interval:0.03];
	}
	return self;
}

- (void)levelTimerCallback:(NSTimer *)timer {
    [footprintManager addFoot:[[AudioManager sharedInstance] getAverageVolume]];
    [self detectCollision];
}

- (void)dealloc {
    [levelTimer invalidate];
    levelTimer = nil;
	[levelTimer release];
  	[super dealloc];
}

-(void)updateScene
{
    if(self.sceneStatus == 2)
    {
        label_3.string = @"The flowers have blooming and the tree leaves are swaying.";
    }
}

-(void)detectCollision
{
    CGPoint footPosition = [footprintManager getLatestPosition];
    
    //For faith
    if(footPosition.y == bloomPosition.y && abs(footPosition.x - bloomPosition.x) <= collisionThreshold)
    {
        bloomCollected = true;
        bloomLabel.visible = false;
    }
    
    //For courage
    if(footPosition.y == swayPosition.y && abs(footPosition.x - swayPosition.x) <= collisionThreshold)
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

-(void)updateFootOpacity:(ccTime)dt
{
    [footprintManager updateOpacity:dt];
}
@end
