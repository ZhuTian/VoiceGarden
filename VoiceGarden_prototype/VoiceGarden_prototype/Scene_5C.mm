//
//  Scene_5C.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "Scene_4C.h"
#import "Scene_6A.h"
#import "Scene_5C.h"
#import "GlobalVariable.h"
#import "AudioManager.h"
#define sceneFontSize 30


@implementation Scene_5C
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene_5C *layer;
    
    layer= [Scene_5C node];
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
  /*      CCSprite* background;
            background = [CCSprite spriteWithFile:@"key_bg_fall.png"];
        
            background = [CCSprite spriteWithFile:@"key_spring_bg.png"];
       
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background z:0 tag:10];
        
 */      label_1 = [CCLabelTTF labelWithString:@"It looks like autumn in the garden." fontName:fontName fontSize:sceneFontSize];
		label_1.position =  ccp( size.width /2 - 15 , size.height/2+100);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"The bird will not return while the garden is still in rest." fontName:fontName fontSize:sceneFontSize];
		label_2.position =  ccp( size.width /2 + 130, size.height/2+50);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@" " fontName:fontName fontSize:sceneFontSize];
		label_3.position =  ccp( size.width /2 - 60, size.height/2 + 50);
        label_3.color = ccc3(0, 0, 0);
        label_3.visible = false;
        [self addChild: label_3];
        
        label_4 = [CCLabelTTF labelWithString:@" " fontName:fontName fontSize:sceneFontSize];
		label_4.position =  ccp( size.width /2 +315, size.height/2 + 50);
        label_4.color = ccc3(0, 0, 0);
        label_4.visible = false;
        [self addChild:label_4];
        
        spring = [CCMenuItemFont itemWithString:@"spring" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_6A sceneWithVar:1] withColor:ccWHITE]];
        }];
        [spring setFontName:fontName];
        [spring setFontSize:sceneFontSize];
        [spring setPosition:ccp( size.width/2 + 20, size.height/2 + 150)];
        [spring setIsEnabled:true];
        [spring setColor:ccc3(100,100,100)];
        spring.visible = false;
        
        key_button = [CCMenuItemFont itemWithString:@"key" block:^(id sender){
            //[GlobalVariable sharedInstance].haveKey = true;
            //[self updateScene];
        }];
        
        [key_button setFontName:fontName];
        [key_button setFontSize:sceneFontSize];
        [key_button setPosition:ccp( size.width/2 + 75, size.height/2 + 50)];
        [key_button setIsEnabled:true];
        [key_button setColor:ccc3(100,100,100)];
        spring.visible = false;
        [key_button setVisible:false];
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            if(self.sceneStatus == 1)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:2] withColor:ccWHITE]];
            }
            else if(self.sceneStatus == 2)
            {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:4] withColor:ccWHITE]];
            }
        }];
        [back setFontName:fontName];
        [back setFontSize:sceneFontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:sceneFontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        key = [CCMenuItemImage itemWithNormalImage:@"key.png" selectedImage:@"key.png" block:^(id sender) {
            //            [jump setString:@"Forward"];
            //[key setRotation:90.0f];
            CCSprite* keySprite =[CCSprite spriteWithFile:@"key.png"];
            keySprite.position = ccp(180, 570);
            keySprite.scale = 0.3;
            
            [self addChild:keySprite];
            
            id moveKey = [CCMoveTo actionWithDuration:3.0f position:ccp(900, 100)];
            [keySprite runAction:moveKey];
            
            key.visible = false;
            [GlobalVariable sharedInstance].keyInThePocket = true;
            
        }];
        
        [key setScale:0.3f];
        key.visible = false;
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            [key setPosition:ccp(900, 100)];
        }
        else{
            [key setPosition:ccp(180,570)];
        }
        
        CCMenuItem *menu = [CCMenu menuWithItems:spring, back, key, key_button, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
       
        [self scheduleUpdate];
        
	}
	return self;
}

-(void)updateScene
{
    if(self.sceneStatus == 1)
    {
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background;
        background = [CCSprite spriteWithFile:@"key_bg_fall.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background z:-1 tag:10];
    }
    else if(self.sceneStatus == 2)
    {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* background;
        background = [CCSprite spriteWithFile:@"key_spring_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background z:-1 tag:10];
        
        label_1.string = @"It's         .";
        label_2.string = @"The bird remembers the garden with blooming flowers.";
        label_3.string = @"She is back with the key  .";
        label_4.string = @"I need to save the garden.";
        label_3.visible = true;
        label_4.visible = true;
        
        label_1.position =  ccp( size.width /2 , size.height/2+150);
        label_2.position =  ccp( size.width /2 + 130, size.height/2+100);
        
        spring.visible = true;
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id action = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id action2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [spring runAction: [CCSequence actions:action, action2, nil]];
        [spring runAction:[CCRepeatForever actionWithAction:[CCSequence actions:action, action2, nil]]];
        
        
        
        CCSprite* flower_1 = [CCSprite spriteWithFile:@"key_flower.png"];
        CCSprite* flower_2 = [CCSprite spriteWithFile:@"key_flower.png"];
        CCSprite* flower_3 = [CCSprite spriteWithFile:@"key_flower.png"];
        CCSprite* flower_4 = [CCSprite spriteWithFile:@"key_flower.png"];
        flower_1.position = ccp(100, 200);
        flower_2.position = ccp(300, 350);
        flower_3.position = ccp(180, 570);
        flower_4.position = ccp(650, 650);
        
        flower_1.scale = 0.5;
        flower_2.scale = 0.5;
        flower_3.scale = 0.5;
        flower_4.scale = 0.5;
        
        [self addChild:flower_1 z:99 tag:51];
        [self addChild:flower_2 z:99 tag:52];
        [self addChild:flower_3 z:99 tag:53];
        [self addChild:flower_4 z:99 tag:54];
        
        for(int i=0;i<4;i++){
            flowerTimer[i]=0;
            falling[i] = false;
            floweRotation[i] = 0;
        }
        
        [key_button setVisible:false];
        
        if([GlobalVariable sharedInstance].haveKey == true){
            [flower_1 setVisible:false];
            [flower_2 setVisible:false];
            [flower_3 setVisible:false];
            [flower_4 setVisible:false];
        }
        
    }
    
    key.visible = [GlobalVariable sharedInstance].haveKey;
}

-(void)update:(ccTime)dt
{
    //[self updatePich];
    
    CCSprite* flowerSprite1 = (CCSprite*)[self getChildByTag:51];
    CCSprite* flowerSprite2 = (CCSprite*)[self getChildByTag:52];
    CCSprite* flowerSprite3 = (CCSprite*)[self getChildByTag:53];
    CCSprite* flowerSprite4 = (CCSprite*)[self getChildByTag:54];
    
    NSString* noteString = [[AudioManager sharedInstance] getNote];
    NSLog(@"%@", noteString);
    
    if ([noteString isEqualToString:@"Do"]) {
        dominantnote = 0;
    }
    else if ([noteString isEqualToString:@"Re"]){
        dominantnote = 1;
    }
    else if ([noteString isEqualToString:@"Mi"]){
        dominantnote = 2;
    }
    else if ([noteString isEqualToString:@"Fa"]){
        dominantnote = 3;
    }
    else if ([noteString isEqualToString:@"So"]){
        dominantnote = 4;
    }
    else if ([noteString isEqualToString:@"La"]){
        dominantnote = 5;
    }
    else if ([noteString isEqualToString:@"Si"]){
        dominantnote = 6;
    }
    else
        dominantnote = 7;
    
    switch (dominantnote) {
        case 1: //Re - flower_2
            if (falling[1]==false) {
                flowerTimer[1]+=dt*10;
                floweRotation[1]+=dt*50;
                [flowerSprite2 setRotation:floweRotation[1]];
                if (flowerTimer[1]>20) {
                    falling[1] = true;
                }
            }
            break;
        case 4: //so - flower_3
            if (falling[2]==false) {
                flowerTimer[2]+=dt*10;
                floweRotation[2]+=dt*50;
                [flowerSprite3 setRotation:floweRotation[2]];
                
                if (flowerTimer[2]>20) {
                    falling[2] = true;
                    [GlobalVariable sharedInstance].haveKey = true;
                    key.visible = [GlobalVariable sharedInstance].haveKey;
                }
            }
            break;
        case 6: //Si - flower_4
            if (falling[3]==false) {
                flowerTimer[3]+=dt*10;
                floweRotation[3]+=dt*50;
                [flowerSprite4 setRotation:floweRotation[3]];
                if (flowerTimer[3]>20) {
                    falling[3] = true;
                }
            }
            break;
            
        default:
            break;
    }
    
    for(int i=0;i<4;i++){
        if (falling[i]==false) {
            if (i==0&&dominantnote!=1) {
                flowerTimer[i] = 0;
            }
            else if(i==1&&dominantnote!=1){
                flowerTimer[i] = 0;
            }
            else if(i==2&&dominantnote!=4){
                flowerTimer[i] = 0;
            }
            else if(i==3&&dominantnote!=6){
                flowerTimer[i] = 0;
            }
        }
        else {
            if (i==0) {
                
                CGPoint point = flowerSprite1.position;
                flowerSprite1.position = ccp(point.x, point.y-10);
            }
            if (i==1) {
                
                CGPoint point = flowerSprite2.position;
                flowerSprite2.position = ccp(point.x, point.y-10);
            }
            if (i==2) {
                
                CGPoint point = flowerSprite3.position;
                flowerSprite3.position = ccp(point.x, point.y-10);
            }
            if (i==3) {
                
                CGPoint point = flowerSprite4.position;
                flowerSprite4.position = ccp(point.x, point.y-10);
            }
        }/// end of else
    }///end of for
}

-(void)dealloc
{
    [super dealloc];
}

@end
