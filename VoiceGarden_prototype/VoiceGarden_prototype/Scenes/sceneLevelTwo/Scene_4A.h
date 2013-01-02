//
//  Scene_4A.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "SceneCommon.h"

@interface Scene_4A : CCLayer
{    @private
    CCMenuItemFont *my;
    CCMenuItemFont *company;
    CCMenuItemFont *back;
    CCLabelTTF *label_1;
    CCLabelTTF *label_2;
    CCLabelTTF *label_3;
    CCLabelTTF *label_4;
    
    CCSprite* background;
    CCSprite *desolate;
    CCSprite *path;
    CCSprite *footprint_path;
    CCSprite *fear;
    
    //For previous scene
    CCSprite *wind;
    CCSprite *garden;
    
    //For own way scene
    CCSprite *pond;
    
    //For companion scene
    CCSprite *road_loop;
    
    int transitionTime;
    int _nextScene;
    
@public
    int sceneStatus;
    int preSceneStatus;
};

+(CCScene *) sceneWithVar: (int)_sceneType  preScene:(int)_preSceneType;

@property int sceneStatus;
@property int preSceneStatus;

@end
