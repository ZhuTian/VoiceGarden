//
//  SceneTemplate.m
//  VoiceGarden_Tutorial
//
//  Created by Tian Zhu on 12-11-27.
//
//

#import "SceneTemplate.h"

@implementation SceneTemplate
+(CCScene *) sceneWithPreviousScene:(Class)_preSceneClass PreviousStatus:(int)_preSceneStatus SceneStatus:(int)_status
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	//Scene_1 *layer = [Scene_1 node];
    SceneTemplate *layer= [[self class] node];
    layer->currentSceneStatus = _status;
    layer->preSceneClass = _preSceneClass;
    layer->preSceneStatus = _preSceneStatus;
    [layer updateScene];
	[scene addChild: layer];
	// add layer as a child to scene
	// return the scene
	return scene;
}

-(void)updateScene
{
    ;
}

@end
