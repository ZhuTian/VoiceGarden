//
//  Scene_2.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_2.h"
#import "Scene_3B.h"
#import "GlobalVariable.h"
#import "Scene_3A.h"
#import "StartScene.h"
#define _fontSize 30

@implementation Scene_2
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	CCScene *scene = [CCScene node];
	Scene_2 *layer;
    layer= [Scene_2 node];
    
    if([GlobalVariable sharedInstance].isSlience && [GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 1;
    }
    else if(![GlobalVariable sharedInstance].isSlience && [GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 2;
    }
    else if([GlobalVariable sharedInstance].isSlience && ![GlobalVariable sharedInstance].isDesolate)
    {
        layer.sceneStatus = 3;
    }
    else
    {
        layer.sceneStatus = 4;
    }
    [layer updateScene];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        background = [CCSprite spriteWithFile:@"openeyes_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        [self addChild: background];
   
        CCLabelTTF *label_1 = [CCLabelTTF labelWithString:@"I open my eyes." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 250, size.height/2 - 50);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
		[self addChild: label_1];
        
        CCLabelTTF *label_2 = [CCLabelTTF labelWithString:@"I see a              garden." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 250, size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
		[self addChild: label_2];
        
        CCLabelTTF *label_3 = [CCLabelTTF labelWithString:@"I am surrounded by the sound of          ." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 250, size.height/2 - 150);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
		[self addChild: label_3];
		
        
        desolate_beautiful = [CCMenuItemFont itemWithString:@"desolate" block:^(id sender){
            if([GlobalVariable sharedInstance].isDesolate)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:1] withColor:ccWHITE]];
            }
            else
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3A sceneWithVar:3] withColor:ccWHITE]];
            }
        }];
        [desolate_beautiful setFontName:fontName];
        [desolate_beautiful setFontSize:_fontSize];
        [desolate_beautiful setPosition:ccp( size.width/2 - 89, size.height/2 - 100)];
        [desolate_beautiful setColor:ccc3(100,100,100)];
        
        slience_XXX = [CCMenuItemFont itemWithString:@"slience" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3B sceneWithVar:1] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_3B sceneWithVar:3] withColor:ccWHITE]];
            }
        }];
        [slience_XXX setFontName:fontName];
        [slience_XXX setFontSize:_fontSize];
        [slience_XXX setPosition:ccp( size.width/2 + 250, size.height/2 - 150)];
        [slience_XXX setColor:ccc3(100,100,100)];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [desolate_beautiful runAction: [CCSequence actions:action, action2, nil]];
        [desolate_beautiful runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        id move_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action_2 = [CCEaseIn actionWithAction:move_2 rate:1];
        id move2_2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2_2 = [CCEaseOut actionWithAction:move2_2 rate:1];
        [slience_XXX runAction: [CCSequence actions:action_2, action2_2, nil]];
        [slience_XXX runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action_2, action2_2, nil]]];
        
        back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartScene scene] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        [back setVisible:false];
        
        CCMenuItem *menu = [CCMenu menuWithItems:desolate_beautiful, slience_XXX, back, nil];
		[menu setPosition:ccp( 0, 0)];
		[self addChild:menu];
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite z: 10 tag:20];
        }
        
	}
	return self;
}

- (void)updateScene
{
    if(self.sceneStatus == 1)
    {
        
    }
    else if(self.sceneStatus == 2)
    {
        [slience_XXX setString:@"life"];
    }
    else if(self.sceneStatus == 3)
    {
        [desolate_beautiful setString:@"thriving"];
    }
    else if(self.sceneStatus == 4)
    {
        [slience_XXX setString:@"life"];
        [slience_XXX stopAllActions];
        [slience_XXX setIsEnabled:false];
        [slience_XXX setColor:ccc3(0, 0, 0)];
        
        [desolate_beautiful setString:@"thriving"];
        [desolate_beautiful stopAllActions];
        [desolate_beautiful setIsEnabled:false];
        [desolate_beautiful setColor:ccc3(0, 0, 0)];
        
        [background setTexture:[[CCTextureCache sharedTextureCache] addImage:@"garden_life.png"]];
        
        CCSprite* key = (CCSprite*)[self getChildByTag:20];
        [key setVisible:false];
     
        [back setVisible:true];
    }
}

@end
