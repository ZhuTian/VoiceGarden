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
        CCSprite* background = [CCSprite spriteWithFile:@"bg1.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        label_1 = [CCLabelTTF labelWithString:@"I reach the end of the path." fontName:fontName fontSize:48];
		label_1.position =  ccp( size.width /2 , size.height/2 - 40);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"There is a door awaiting for me." fontName:fontName fontSize:48];
		label_2.position =  ccp( size.width /2 , size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"I         the door with the key." fontName:fontName fontSize:48];
		label_3.position =  ccp( size.width /2 , size.height/2 - 160);
        label_3.color = ccc3(0, 0, 0);
        [self addChild:label_3];
        
		
        open = [CCMenuItemFont itemWithString:@"open" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_8A sceneWithVar:1] withColor:ccWHITE]];
        }];
        [open setFontName:fontName];
        [open setFontSize:48];
        [open setPosition:ccp( size.width/2 - 240, size.height/2 - 160)];
        [open setIsEnabled:false];
        [open setColor:ccc3(0, 0, 0)];
        
        
        secret = [CCMenuItemFont itemWithString:@"secret" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:1] withColor:ccWHITE]];
        }];
        [secret setFontName:fontName];
        [secret setFontSize:48];
        [secret setPosition:ccp( size.width/2 + 50, size.height/2 - 160)];
        [secret setIsEnabled:false];
        [secret setColor:ccc3(100, 100, 100)];
        secret.visible = false;
        
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 3;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:48];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        
        key = [CCMenuItemImage itemWithNormalImage:@"key.png" selectedImage:@"key.png" block:^(id sender) {
            //            [jump setString:@"Forward"];
        }];
        [key setPosition:ccp(size.width/2, size.height - 150)];
        [key setScale:0.3f];
        key.visible = false;
        
        CCMenuItem *menu = [CCMenu menuWithItems:open, key, secret, action, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

-(void)updateScene
{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else if(self.sceneStatus == 2)
    {
        [open setIsEnabled:false];
        open.visible = false;
        secret.visible = true;
        [secret setIsEnabled:true];
        [secret setColor:ccc3(100, 100, 100)];
        
        label_1.string = @"The door is locked";
        label_2.string = @"Where is the key?";
        label_3.string = @"It's a            .";
        action.visible = false;
        [action setIsEnabled:false];
    }
    else if(self.sceneStatus == 3)
    {
        [open setIsEnabled:true];
        [open setColor:ccc3(100, 100, 100)];
    }
    
    key.visible = [GlobalVariable sharedInstance].haveKey;
}
@end
