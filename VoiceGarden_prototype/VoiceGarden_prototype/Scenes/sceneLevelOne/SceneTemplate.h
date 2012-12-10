//
//  SceneTemplate.h
//  VoiceGarden_Tutorial
//
//  Created by Tian Zhu on 12-11-27.
//
//

#import "cocos2d.h"

@interface SceneTemplate : CCLayer
{
@protected
    int preSceneStatus;
    int currentSceneStatus;
    Class preSceneClass;
}
+(CCScene *) sceneWithPreviousScene:(Class)_preSceneClass PreviousStatus:(int)_preSceneStatus SceneStatus:(int)_status;
-(void) updateScene;

@end
