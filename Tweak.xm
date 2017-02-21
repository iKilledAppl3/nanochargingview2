//NanoChargingView (iOS 8/9) (1-1.1) was created by Billy Ellis (@bellis1000).
//NanoChargingView 2 (iOS 10) was created by iKIlledAppl3 (@iKilledAppl3).
//NanoChargingView 2 created on Feb. 20, 2017.
//NanoChargingView is a copyright 2016 Billy Eliis all rights reserved.
//NanoChargingView 2 is a copyright 2017 iKilledAppl3 and Billy Eliis all rights reserved.
///Now the legal stuff is over lets code the tweak lol :P.

#import "NanoChargingView2BridgingHeader.h"
	
%hook SBUIController 
	
-(void)ACPowerChanged {
	
	if (kAppleWatchChargingSound == YES)  {
	
		
	chimeAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	chimeAudio.numberOfLoops = 0;
	chimeAudio.volume = 0.75;
	[chimeAudio play];
		
		
	}
	
	else {
		
		%orig;
	} 

	if (kVibrationEnabled == YES) {
		
		//Borrowed from @Ziph0n thanks again!
		
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [NSThread sleepForTimeInterval:0.5];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		
	}
}

%end
	
%hook SBDashBoardChargingViewController
	
-(void)viewDidLoad {
	%orig;
	
	if (kEnabled == YES) {
	window = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
window.backgroundColor = [UIColor clearColor];
[self addSubview:window];
	}
	
//blur
	if (kDarkBlurEnabled == YES) {
		
		 UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];


UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
		
	}

	//light blur method
	else if (kLightBlurEnabled == YES) {
		
		 UIVisualEffect *blurEffect;
		 blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
	} 
	

//light blur method
	else if (kExtraLightBlurEnabled == YES) {
		
		 UIVisualEffect *blurEffect;
		 blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
} 	


//charging icon (originally from Carousel.app on the Apple Watch)

UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-65,[UIScreen mainScreen].bounds.size.height*0.40-65,130,130)];

image.image = [UIImage imageWithContentsOfFile:watchImagePath];

[window addSubview:image];

[self performSelector:@selector(hide) withObject:nil afterDelay:1.5];


}

%new

-(void)hide{


window.hidden = YES;
window = nil;


}
%end

static void loadPrefs()
{	
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:plist];
    if(prefs)
    {	
		kEnabled = ( [prefs objectForKey:@"kEnabled"] ? [[prefs objectForKey:@"kEnabled"] boolValue] : kEnabled );
		kDarkBlurEnabled = ( [prefs objectForKey:@"kDarkBlurEnabled"] ? [[prefs objectForKey:@"kDarkBlurEnabled"] boolValue] : kDarkBlurEnabled);
		kExtraLightBlurEnabled = ( [prefs objectForKey:@"kExtraLightBlurEnabled"] ? [[prefs objectForKey:@"kExtraLightBlurEnabled"] boolValue] : kExtraLightBlurEnabled);
		kLightBlurEnabled = ( [prefs objectForKey:@"kLightBlurEnabled"] ? [[prefs objectForKey:@"kLightBlurEnabled"] boolValue] : kDarkBlurEnabled);
		kAppleWatchChargingSound = ( [prefs objectForKey:@"kAppleWatchChargingSound"] ? [[prefs objectForKey:@"kAppleWatchChargingSound"] boolValue] : kAppleWatchChargingSound);
		kVibrationEnabled = ( [prefs objectForKey:@"kVibrationEnabled"] ? [[prefs objectForKey:@"kVibrationEnabled"] boolValue] : kVibrationEnabled);
		
	 }
}

%ctor 
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.billyellis.ikilledappl3.nanochargingview2-prefsreload"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		    loadPrefs();
		}