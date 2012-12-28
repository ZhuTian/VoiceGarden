//
//  GlobalVariable.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "GlobalVariable.h"

@implementation GlobalVariable
@synthesize haveKey;
@synthesize isDesolate;
@synthesize isSlience;
@synthesize keyInThePocket;
@synthesize SceneStack;
@synthesize SceneStatusStack;


+ (GlobalVariable *)sharedInstance
{
    // the instance of this class is stored here
    static GlobalVariable *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        myInstance.haveKey = true;
        myInstance.isDesolate = true;
        myInstance.isSlience = true;
        myInstance.keyInThePocket = false;
        myInstance.SceneStack = [[NSMutableArray alloc] init];
        myInstance.SceneStatusStack = [[NSMutableArray alloc] init];
    }
    // return the instance of this class
    return myInstance;
}

@end
