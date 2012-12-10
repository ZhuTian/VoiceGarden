//
//  GlobalVariable.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import <Foundation/Foundation.h>


@interface GlobalVariable : NSObject
{
    @public
    bool haveKey;
    bool keyInThePocket;
    bool isSlience;
    bool isDesolate;
}

+(GlobalVariable *)sharedInstance;
@property bool haveKey;
@property bool isSlience;
@property bool isDesolate;
@property bool keyInThePocket;

@end
