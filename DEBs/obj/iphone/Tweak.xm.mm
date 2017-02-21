#line 1 "Tweak.xm"







#import "NanoChargingView2BridgingHeader.h"
	
#include <logos/logos.h>
#include <substrate.h>
@class SBDashBoardChargingViewController; @class SBUIController; 
static void (*_logos_orig$_ungrouped$SBUIController$ACPowerChanged)(SBUIController*, SEL); static void _logos_method$_ungrouped$SBUIController$ACPowerChanged(SBUIController*, SEL); static void (*_logos_orig$_ungrouped$SBDashBoardChargingViewController$viewDidLoad)(SBDashBoardChargingViewController*, SEL); static void _logos_method$_ungrouped$SBDashBoardChargingViewController$viewDidLoad(SBDashBoardChargingViewController*, SEL); static void _logos_method$_ungrouped$SBDashBoardChargingViewController$hide(SBDashBoardChargingViewController*, SEL); 

#line 10 "Tweak.xm"
 
	
static void _logos_method$_ungrouped$SBUIController$ACPowerChanged(SBUIController* self, SEL _cmd) {
	
	if (kAppleWatchChargingSound == YES)  {
	
		
	chimeAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	chimeAudio.numberOfLoops = 0;
	chimeAudio.volume = 0.75;
	[chimeAudio play];
		
		
	}
	
	else {
		
		_logos_orig$_ungrouped$SBUIController$ACPowerChanged(self, _cmd);
	} 

	if (kVibrationEnabled == YES) {
		
		
		
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [NSThread sleepForTimeInterval:0.5];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		
	}
}


	

	
static void _logos_method$_ungrouped$SBDashBoardChargingViewController$viewDidLoad(SBDashBoardChargingViewController* self, SEL _cmd) {
	_logos_orig$_ungrouped$SBDashBoardChargingViewController$viewDidLoad(self, _cmd);
	
	if (kEnabled == YES) {
	window = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
window.backgroundColor = [UIColor clearColor];
[self addSubview:window];
	}
	

	if (kDarkBlurEnabled == YES) {
		
		 UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];


UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
		
	}

	
	else if (kLightBlurEnabled == YES) {
		
		 UIVisualEffect *blurEffect;
		 blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
	} 
	


	else if (kExtraLightBlurEnabled == YES) {
		
		 UIVisualEffect *blurEffect;
		 blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
} 	




UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-65,[UIScreen mainScreen].bounds.size.height*0.40-65,130,130)];

image.image = [UIImage imageWithContentsOfFile:watchImagePath];

[window addSubview:image];

[self performSelector:@selector(hide) withObject:nil afterDelay:1.5];


}



static void _logos_method$_ungrouped$SBDashBoardChargingViewController$hide(SBDashBoardChargingViewController* self, SEL _cmd){


window.hidden = YES;
window = nil;


}


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

static __attribute__((constructor)) void _logosLocalCtor_c0df337f() 
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.billyellis.ikilledappl3.nanochargingview2-prefsreload"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		    loadPrefs();
		}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$_ungrouped$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$_ungrouped$SBUIController$ACPowerChanged);Class _logos_class$_ungrouped$SBDashBoardChargingViewController = objc_getClass("SBDashBoardChargingViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardChargingViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBDashBoardChargingViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBDashBoardChargingViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBDashBoardChargingViewController, @selector(hide), (IMP)&_logos_method$_ungrouped$SBDashBoardChargingViewController$hide, _typeEncoding); }} }
#line 142 "Tweak.xm"
