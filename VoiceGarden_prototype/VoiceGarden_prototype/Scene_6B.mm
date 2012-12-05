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
#define sceneFontSize 30

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

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"I.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        label_1 = [CCLabelTTF labelWithString:@"I see a shimmering reflection of myself." fontName:fontName fontSize:sceneFontSize];
		label_1.position =  ccp( size.width /2 , size.height/2 - 40);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"I am ready to               ." fontName:fontName fontSize:sceneFontSize];
		label_2.position =  ccp( size.width /2 , size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
		
        go = [CCMenuItemFont itemWithString:@"move on" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_7A sceneWithVar:1] withColor:ccWHITE]];
        }];
        [go setFontName:fontName];
        [go setFontSize:sceneFontSize];
        [go setPosition:ccp( size.width/2 + 70, size.height/2 - 100)];
        [go setIsEnabled:false];
        [go setColor:ccc3(0,0,0)];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
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
        
        
        key = [CCMenuItemImage itemWithNormalImage:@"key.png" selectedImage:@"key.png" block:^(id sender) {
            //            [jump setString:@"Forward"];
        }];
        [key setPosition:ccp(size.width/2, size.height - 150)];
        [key setScale:0.3f];
        key.visible = false;
        
        CCMenuItem *menu = [CCMenu menuWithItems:go, action, key, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        
        //new
        
        footPrintLeft = [CCSprite spriteWithFile:@"foot_L.png"];
        footPrintLeft.scale = 0.3f;
        footPrintLeft.position = ccp(125, 170);
        [self addChild:footPrintLeft z:2 tag:1];
        
        footPrintRight = [CCSprite spriteWithFile:@"foot_R.png"];
        footPrintRight.scale = 0.3f;
        footPrintRight.position = ccp(100, 135);
        [self addChild:footPrintRight z:2 tag:2];
        
        rock_1 = [CCSprite spriteWithFile:@"I_rock.png"];
        rock_1.position = ccp(230, 180);
        [self addChild:rock_1];
        
        rock_2 = [CCSprite spriteWithFile:@"I_rock.png"];
        rock_2.position = ccp(700, 240);
        [self addChild:rock_2];
        
        status = 1;
        timer = 30;
        isLeft = false;
        [self scheduleUpdate];
        
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
        [go setIsEnabled:true];
        [go setColor:ccc3(100, 100, 100)];
    }
    
    key.visible = [GlobalVariable sharedInstance].haveKey;
}

-(void)update:(ccTime)dt
{
    float volumn = [[AudioManager sharedInstance] getAverageVolume];
    NSLog(@"%f",volumn);
    if (status == 1) {
        if(volumn>-20){
            status = 2;
        }
    }
    else if(status == 2){
        CGPoint orig_position = rock_1.position;
        if(rock_1.position.y>120){
            if(orig_position.x<270){
                rock_1.position = ccp(orig_position.x+dt*20, orig_position.y);
            }
            else{
                rock_1.position = ccp(orig_position.x+dt*80, orig_position.y-dt*120);
            }
            rock_1.rotation = rock_1.rotation+dt*50;
        }
        else{
            status = 3;
        }
    }
    else if (status== 3){
        timer -- ;
        if(timer==0){
            if(isLeft==false){
                if(footPrintRight.position.x<350){
                    footPrintRight.position = ccp(footPrintRight.position.x+50, footPrintRight.position.y);
                    isLeft = true;
                }
                else if(footPrintRight.position.x>=350&&footPrintRight.position.x<=550){
                    footPrintRight.rotation = -15;
                    footPrintRight.position = ccp(footPrintRight.position.x+50, footPrintRight.position.y+10);
                    isLeft = true;
                }
            }
            else{
                if(footPrintLeft.position.x<350){
                    footPrintLeft.position = ccp(footPrintLeft.position.x+50, footPrintLeft.position.y);
                    isLeft = false;
                }
                else if (footPrintLeft.position.x>=350&&footPrintLeft.position.x<=550){
                    footPrintLeft.rotation = -15;
                    footPrintLeft.position = ccp(footPrintLeft.position.x+50, footPrintLeft.position.y+10);
                    isLeft = false;
                }
                else{
                    status = 4;
                }
            }
            timer = 30;
        }
    }
    else if(status == 4){
        if(volumn>-20){
            status = 5;
        }
    }
    else if(status ==5){
        CGPoint orig_position = rock_2.position;
        if(rock_2.position.y>200){
            if(orig_position.x<750){
                rock_2.position = ccp(orig_position.x+dt*20, orig_position.y);
            }
            else{
                rock_2.position = ccp(orig_position.x+dt*80, orig_position.y-dt*120);
            }
            rock_2.rotation = rock_2.rotation+dt*50;
        }
        else{
            status = 6;
        }
    }
    else if(status == 6){
        timer -- ;
        if(timer==0){
            if(isLeft==false){
                if(footPrintRight.position.x<900){
                    footPrintRight.position = ccp(footPrintRight.position.x+50, footPrintRight.position.y+10);
                    isLeft = true;
                }
                else{
                    self.sceneStatus = 2;
                    [self updateScene];
                    status = 7;
                }
            }
            else{
                if(footPrintLeft.position.x<900){
                    footPrintLeft.position = ccp(footPrintLeft.position.x+50, footPrintLeft.position.y+10);
                    isLeft = false;
                }
            }
            timer = 30;
        }
    }
}

@end
