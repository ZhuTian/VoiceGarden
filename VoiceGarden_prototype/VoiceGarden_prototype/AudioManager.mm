//
//  AudioManager.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-27.
//
//

#import "AudioManager.h"

@implementation AudioManager

+ (AudioManager *)sharedInstance
{
    // the instance of this class is stored here
    static AudioManager *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

-(id) init
{
    if( (self=[super init]) )
    {
        
        [self initFMOD];
        [self initVolumeMeter];
    }
    return self;
}

-(void)initVolumeMeter
{
    //Initiate volumen meter
    NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
    
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                              [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
                              nil];
    
    NSError *error;
    
    recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
    
    if (recorder) {
        [recorder prepareToRecord];
        recorder.meteringEnabled = YES;
        [recorder record];
    } else
    {
        NSLog(@"%@", [error description]);
    }

}

-(float)getAverageVolume
{
    [recorder updateMeters];
    return [recorder averagePowerForChannel:0];
}

void ERRCHECK(FMOD_RESULT result)
{
    if (result != FMOD_OK)
    {
        fprintf(stderr, "FMOD error! (%d) %s\n", result, FMOD_ErrorString(result));
        exit(-1);
    }
}

- (void)initFMOD
{
    FMOD_RESULT             result      = FMOD_OK;
    unsigned int            version     = 0;
    FMOD_CREATESOUNDEXINFO  exinfo      = {0};
    
    /*
     Create a System object and initialize
     */
    result = FMOD::System_Create(&system);
    ERRCHECK(result);
    
    result = system->getVersion(&version);
    ERRCHECK(result);
    
    if (version < FMOD_VERSION)
    {
        fprintf(stderr, "You are using an old version of FMOD %08x.  This program requires %08x\n", version, FMOD_VERSION);
        exit(-1);
    }
    
    result = system->setSoftwareFormat(OUTPUTRATE, FMOD_SOUND_FORMAT_PCM16, 1, 0, FMOD_DSP_RESAMPLER_LINEAR);
    ERRCHECK(result);
    
    result = system->init(32, FMOD_INIT_NORMAL | FMOD_INIT_ENABLE_PROFILE, NULL);
    ERRCHECK(result);
    
    memset(&exinfo, 0, sizeof(FMOD_CREATESOUNDEXINFO));
    
    exinfo.cbsize           = sizeof(FMOD_CREATESOUNDEXINFO);
    exinfo.numchannels      = 1;
    exinfo.format           = FMOD_SOUND_FORMAT_PCM16;
    exinfo.defaultfrequency = OUTPUTRATE;
    exinfo.length           = exinfo.defaultfrequency * sizeof(short) * exinfo.numchannels * 5;
    
    result = system->createSound(NULL, FMOD_2D | FMOD_SOFTWARE | FMOD_LOOP_NORMAL | FMOD_OPENUSER, &exinfo, &sound);
    ERRCHECK(result);
    
    result = system->recordStart(0, sound, true);
    ERRCHECK(result);
    
    usleep(200 * 1000);      /* Give it some time to record something */
    
    result = system->playSound(FMOD_CHANNEL_REUSE, sound, false, &channel);
    ERRCHECK(result);
    
    /* Dont hear what is being recorded otherwise it will feedback.  Spectrum analysis is done before volume scaling in the DSP chain */
    result = channel->setVolume(0);
    ERRCHECK(result);
    
}

-(float)getFundamentalFrequency
{
    FMOD_RESULT     result                  = FMOD_OK;
    static float    spectrum[SPECTRUMSIZE]  = {0};
    float           dominanthz              = 0.0f;
    float           max                     = 0.0f;
    float           binsize                 = BINSIZE;
    int             bin                     = 0;
    
    result = channel->getSpectrum(spectrum, SPECTRUMSIZE, 0, FMOD_DSP_FFT_WINDOW_TRIANGLE);
    ERRCHECK(result);
    
    int i;
    for(i = 0; i < SPECTRUMSIZE; i++)
    {
        //if (spectrum[i] > 0.01f && spectrum[i] > max)
        if (spectrum[i] > max && spectrum[i] > 0.0001f)
        {
            max = spectrum[i];
            bin = i;
        }
    }
    
    dominanthz = (float)bin * binsize;
    
    return dominanthz;

}

- (NSString*)getNote
{
    /*
     Main loop
     */
    FMOD_RESULT     result                  = FMOD_OK;
    static float    spectrum[SPECTRUMSIZE]  = {0};
    float           dominanthz              = 0.0f;
    float           max                     = 0.0f;
    float           binsize                 = BINSIZE;
    int             bin                     = 0;
    
    dominantnote = 0;
    
    result = channel->getSpectrum(spectrum, SPECTRUMSIZE, 0, FMOD_DSP_FFT_WINDOW_TRIANGLE);
    ERRCHECK(result);
    
    int startBin, endBin;
    startBin = notefreq[0] / binsize;
    endBin = notefreq[7] / binsize + 1;
    
    for (int i = startBin; i < endBin; i++)
    {
        //if (spectrum[i] > 0.01f && spectrum[i] > max)
        if (spectrum[i] > max && spectrum[i] > 0.001f)
        {
            max = spectrum[i];
            bin = i;
        }
    }
    
    dominanthz = (float)bin * BINSIZE;       /* dominant frequency min */
    
    for (int i = 0; i < 8; i++)
    {
        if (dominanthz >= notefreq[i] && dominanthz < notefreq[i + 1])
        {
            /* Which is it closer to, this note or the next note */
            if (fabs(dominanthz - notefreq[i]) < fabs(dominanthz - notefreq[i + 1]))
            {
                dominantnote = i;
            }
            else
            {
                dominantnote = i + 1;
            }
            
            break;
        }
    }
    
    if (system != NULL)
    {
        result = system->update();
        ERRCHECK(result);
    }
    
    //NSLog(@"%s", note[dominantnote]);
    return [[NSString alloc] initWithFormat:@"%s",note[dominantnote]];
}


@end
