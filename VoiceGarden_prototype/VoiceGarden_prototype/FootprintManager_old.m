//
//  FootprintManager.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-15.
//
//

#import "FootprintManager_old.h"
#import "cocos2d.h"

@implementation FootprintManager_old
@synthesize footArray;
@synthesize scene;
@synthesize currentX;
@synthesize previousAudioLevl;

+(FootprintManager_old*)initManager :(CCLayer*)_scene
{
    FootprintManager_old* manager = [[[self class] alloc] init];
    manager.footArray = [[NSMutableArray alloc] initWithCapacity: 16];
    manager.scene = _scene;
    manager.previousAudioLevl = manager->low_mid;
    manager->heightIncrease = 80;
    manager->currentX = 50;
    manager->midY = 140;
    manager->lowY = manager->midY - manager->heightIncrease;
    manager->highY = manager->midY + manager->heightIncrease;
    manager->footGap = 60;
    manager->footScale = 0.3;
    manager->currentLeft = true;
    manager->leftOffset = 30;
    manager->maxFootprint = 16;
    manager->opacityDecrease = 50;
    
    manager->low_mid = -40;
    manager->mid_high = -30;
    manager->previousY = manager->midY;
    
    manager->goUp = false;
    manager->goDown = false;
    
    return manager;
}

-(void)addFoot:(float)audioLevel
{
    CCSprite* footSprite;
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    //Restart
    if(currentX > size.width)
    {
        currentX = 50;
    }
    
    //Decide Y
    if(audioLevel >= mid_high)
    {
        currentY = highY;
    }
    else if(audioLevel >= low_mid && audioLevel < mid_high)
    {
        currentY = midY;
    }
    else
    {
        currentY = lowY;
    }
    
    float rotate = 0;
    if(currentY > previousY + heightIncrease / 3)
    {
        
        if(goDown)
        {
            rotate = 0;
            currentY = previousY;
            goDown = false;
        }
        else
        {
            rotate = -45;
            currentY = previousY + heightIncrease / 3;
            goUp = !goUp;
        }
    }
    else if(currentY < previousY - heightIncrease / 3)
    {
        
        
        if(goUp)
        {
            currentY = previousY;
            rotate = 0;
            goUp = false;
        }
        else
        {
            currentY = previousY - heightIncrease / 3;
            rotate = 45;
            goDown = goDown;
        }
    }
    
    if(currentLeft)
    {
        footSprite = [CCSprite spriteWithFile:@"foot_R.png"];
        footSprite.scale = footScale;
        footSprite.position = ccp(currentX, currentY);
    }
    else
    {
        footSprite = [CCSprite spriteWithFile:@"foot_L.png"];
        footSprite.scale = footScale;
        footSprite.position = ccp(currentX, currentY + leftOffset);
    }
    footSprite.rotation = rotate;
    
    previousX = currentX;
    previousY = currentY;
    currentX += footGap;
    
    currentLeft = !currentLeft;
    
    [scene addChild:footSprite z:5];
    [footArray addObject:footSprite];
    
    
}

-(void)updateOpacity:(ccTime)dt
{
    //Fade out the old sprites
    for(int i= 0; i < [footArray count]; i++)
    {
        CCSprite *tempFoot = [footArray objectAtIndex:i];
        tempFoot.opacity -= opacityDecrease * dt;
        if(tempFoot.opacity <= 10)
        {
            [footArray removeObject:tempFoot];
            [scene removeChild:tempFoot cleanup:true];
        }
    }
}

-(CGPoint)getLatestPosition
{
    return CGPointMake(previousX, previousY);
}

@end
