//
//  AudioManager.h
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-27.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

#import "fmod.hpp"
#import "fmod_errors.h"

#define OUTPUTRATE      48000
#define SPECTRUMSIZE    8192
#define SPECTRUMRANGE   ((float)OUTPUTRATE / 2.0f)      /* 0 to nyquist */
#define BINSIZE         (SPECTRUMRANGE / (float)SPECTRUMSIZE)

static const float notefreq[8] =
{
    261.6f, 293.7f, 329.6f, 349.2f, 392.0f, 440.0f, 493.0f, 523.3f};

static const char *note[8] =
{
    "Do", "Re", "Mi", "Fa", "So", "La", "Si", "Do+"
};

@interface AudioManager : NSObject
{
    AVAudioRecorder *recorder;
    
    FMOD::System   *system;
    FMOD::Sound    *sound;
    FMOD::Channel  *channel;
    FMOD::Channel  *sound_effect_channel;
    
    FMOD::Sound    *keySound;
    FMOD::Sound    *doorSound;
    FMOD::Sound    *endingSound;
    
    
    int dominantnote;
    
}
+(AudioManager *)sharedInstance;
-(float)getAverageVolume;
- (NSString*)getNote;
-(float)getFundamentalFrequency;

-(void)playKeySound;
-(void)playDoorSound;
-(void)playEndingSound;
-(void)stopSoundEffect;

@end
