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
        CCSprite* background = [CCSprite spriteWithFile:@"bg1.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        //int _fontSize = 30;
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        label_1 = [CCLabelTTF labelWithString:@"I tried to talk but realize." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 50, size.height/2 + 60);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"My voice               as the garden." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 , size.height/2);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"I am              ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 125, size.height/2 - 60);
        label_3.color = ccc3(0, 0, 0);
		[self addChild: label_3];
		
        
        withered = [CCMenuItemFont itemWithString:@"withered" block:^(id sender){
            if(self.sceneStatus == 1 || self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 3)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:4] withColor:ccWHITE]];
            }
        }];
        [withered setFontName:fontName];
        [withered setFontSize:_fontSize];
        [withered setPosition:ccp( size.width/2 - 42, size.height/2)];
        [withered setIsEnabled:false];
        [withered setColor:ccc3(0,0,0)];
        
        waiting = [CCMenuItemFont itemWithString:@"waiting" block:^(id sender){
            ;
        }];
        [waiting setFontName:fontName];
        [waiting setFontSize:_fontSize];
        [waiting setPosition:ccp( size.width/2 - 100, size.height/2 - 60)];
        [waiting setIsEnabled:false];
        [waiting setColor:ccc3(0,0,0)];
        
        
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
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        //Init word spawn fucntion
        spawnThreshold = -30;
        levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
        
        //Init word position
        spawnPosition[0].x = size.width/2 ;
        spawnPosition[0].y = size.height/2 + 200 ;
        
        spawnPosition[1].x = size.width/2 - 220;
        spawnPosition[1].y = size.height/2 - 140;
        
        spawnPosition[2].x = size.width/2 + 220;
        spawnPosition[2].y = size.height/2 + 140 ;
        
        spawnPosition[3].x = size.width/2 - 370;
        spawnPosition[3].y = size.height/2 ;
        
        spawnPosition[4].x = size.width/2 + 370;
        spawnPosition[4].y = size.height/2;
        
        spawnPosition[5].x = size.width/2 - 220;
        spawnPosition[5].y = size.height/2 + 140;
        
        spawnPosition[6].x = size.width/2 + 220;
        spawnPosition[6].y = size.height/2 - 140;
        
        spawnPosition[7].x = size.width/2 ;
        spawnPosition[7].y = size.height/2 - 200 ;
        
	}
	return self;
}

- (void)levelTimerCallback:(NSTimer *)timer {
    float currentVolume = [[AudioManager sharedInstance] getAverageVolume];
    if(currentVolume >= spawnThreshold && !hasSpawn)
    {
        //Spawn new word
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
            
            //Word transition effect
//            int i;
//            for(i = 0; i < 7; i++)
//            {
//                [spawnWord[i] runAction:[CCFadeOut actionWithDuration:1]];
//            }
            [waiting runAction:[CCFadeOut actionWithDuration:2]];
            [spawnWord[7] runAction:[CCMoveTo actionWithDuration:2 position:waiting.position]];
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

-(void)updateScene{
    if(self.sceneStatus == 1)
    {
        
    }
    else if(self.sceneStatus == 2 || self.sceneStatus == 3)
    {
        NSLog(@"Bounce");
        [withered setIsEnabled:true];
        [withered setColor:ccc3(100,100,100)];
//        id move = [CCMoveBy actionWithDuration:0.5 position:ccp(0, 10)];
//        id action = [CCEaseElasticInOut actionWithAction:move period:0.3f];
//        id move2 = [CCMoveBy actionWithDuration:0.5 position:ccp(0, -10)];
//        id action2 = [CCEaseElasticInOut actionWithAction:move2 period:0.3f];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];

        [withered runAction: [CCSequence actions:action, action2, nil]];
        [withered runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        //label_3.string = @"I am opening";
        //[waiting setString:@"openning"];
    }
}

@end
