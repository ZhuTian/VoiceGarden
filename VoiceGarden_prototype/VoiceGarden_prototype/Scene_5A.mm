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
        background1 = [CCSprite spriteWithFile:@"footprint_bg.png" rect:CGRectMake(0, 0, 2048, 768)];
        background1.position = ccp(size.width/2, size.height/2);
        //background1.anchorPoint = ccp(0,0);
        offset1 = 0;
        
        background2 = [CCSprite spriteWithFile:@"footprint_bg.png" rect:CGRectMake(0, 0, 2048, 768)];
        offset2 = 2048;
        background2.position = ccp(size.width/2 + offset2, size.height/2);
        
        scrollSpeed = 100;
        
        
        // add the label as a child to this Layer
        [self addChild: background1];
        [self addChild: background2];
        
        int xOffset = 150, yOffset = 250;
        int _fontSize = 32;
        
        
        label_1 = [CCLabelTTF labelWithString:@"I follow the footprint." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 + xOffset, size.height/2 - 40 + yOffset);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"People who are gone." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 + xOffset, size.height/2 - 100 + yOffset);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"Were they once belong here?" fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 + xOffset, size.height/2 - 160 + yOffset);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"I                                  " fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 + xOffset, size.height/2 - 220 + yOffset);
        label_4.color = ccc3(0, 0, 0);
		[self addChild: label_4];
        
        label_5 = [CCLabelTTF labelWithString:@"and pick up things left by them" fontName:fontName fontSize:_fontSize];
		label_5.position =  ccp( size.width /2 + xOffset, size.height/2 - 280 + yOffset);
        label_5.color = ccc3(0, 0, 0);
		[self addChild: label_5];
		
        
        keep = [CCMenuItemFont itemWithString:@"keep moving forward" block:^(id sender){

            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_7A sceneWithVar:1] withColor:ccWHITE]];

        }];
        [keep setFontName:fontName];
        [keep setFontSize:_fontSize];
        [keep setPosition:ccp( size.width/2 + 20 + xOffset, size.height/2 - 220 + yOffset)];
        [keep setIsEnabled:true];
        [keep setIsEnabled:false];
        [keep setColor:ccc3(0,0,0)];
        
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                self.sceneStatus = 2;
            }
            else if(self.sceneStatus == 3)
            {
                self.sceneStatus = 4;
            }
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
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:keep, nil];
        //CCMenuItem *menu = [CCMenu menuWithItems:keep, middle, low, high, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
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
		[self addChild: faithLabel];
        
        couragePosition = CGPointMake(1200, footprintManager->lowY),
        courageLabel = [CCLabelTTF labelWithString:@"courage" fontName:fontName fontSize:40];
		courageLabel.position =  couragePosition;
        courageLabel.color = ccc3(0, 0, 0);
		[self addChild: courageLabel];
        
        friendshipPosition = CGPointMake(1900, footprintManager->highY),
        friendshipLabel = [CCLabelTTF labelWithString:@"friendship" fontName:fontName fontSize:40];
		friendshipLabel.position =  friendshipPosition;
        friendshipLabel.color = ccc3(0, 0, 0);
		[self addChild: friendshipLabel];
        
        collisionThreshold = 40;
        
        [self schedule:@selector(updateFootOpacity:) interval:0.03];
        
	}
	return self;
}

- (void)levelTimerCallback:(NSTimer *)timer {
    [footprintManager addFoot:[[AudioManager sharedInstance] getAverageVolume]];
    [self detectCollision];
    float temp = [[AudioManager sharedInstance] getFundamentalFrequency];
    NSLog(@"%f", temp);
    NSLog([[AudioManager sharedInstance] getNote]);
}

- (void)scrollCallback:(ccTime)dt {
    CGSize size = [[CCDirector sharedDirector] winSize];
    offset1 -= dt * scrollSpeed;
    background1.position = ccp(size.width/2 + offset1, size.height/2);
    offset2 -= dt * scrollSpeed;
    background2.position = ccp(size.width/2 + offset2, size.height/2);
    if(offset2 <= 0)
    {
        offset1 = offset2 + 2048;
    }
    if(offset1 <= 0)
    {
        offset2 = offset1 + 2048;
    }
    
    
    int temp = faithLabel.position.x - dt*scrollSpeed;
    if(temp < 0)
        temp += 2048;
    faithLabel.position = ccp(temp, faithLabel.position.y);
    temp = courageLabel.position.x - dt*scrollSpeed;
    if(temp < 0)
        temp += 2048;
    courageLabel.position = ccp(temp, courageLabel.position.y);
    temp = friendshipLabel.position.x - dt*scrollSpeed;
    if(temp < 0)
        temp += 2048;
    friendshipLabel.position = ccp(temp, friendshipLabel.position.y);
    
    [self detectCollision];

    
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
    if(footPosition.y == friendshipLabel.position.y && abs(footPosition.x - friendshipLabel.position.x) <= collisionThreshold)
    {
        friendshipCollected = true;
        friendshipLabel.visible = false;
    }
    
    if(friendshipCollected && courageCollected && faithCollected)
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
