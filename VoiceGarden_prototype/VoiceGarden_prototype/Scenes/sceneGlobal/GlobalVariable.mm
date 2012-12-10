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


+ (GlobalVariable *)sharedInstance
{
    // the instance of this class is stored here
    static GlobalVariable *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        myInstance.haveKey = false;
        myInstance.isDesolate = true;
        myInstance.isSlience = true;
        myInstance.keyInThePocket = false;
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

@end
