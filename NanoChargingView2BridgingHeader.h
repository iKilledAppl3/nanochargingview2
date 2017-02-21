//NanoChargingView 2 Bridging Header File 
//This file contains all the needed headers,intefaces, and frameworks needed for the tweak to work.
//NanoChargingView (iOS 8/9) (1-1.1) was created by Billy Ellis (@bellis1000).
//NanoChargingView 2 (iOS 10) was created by iKIlledAppl3 (@iKilledAppl3).
//NanoChargingView 2 created on Feb. 20, 2017.
//NanoChargingView is a copyright 2016 Billy Eliis all rights reserved.
//NanoChargingView 2 is a copyright 2017 iKilledAppl3 and Billy Eliis all rights reserved.
///Now the legal stuff is over lets code the header lol :P.

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>

UIView *window;

#define chargeSound @"/System/Library/Audio/UISounds/connect_power.caf"
#define watchImagePath @"/Library/Application Support/NanoChargingView2/NanoImage.png"
#define lockscreenImagePath @"/var/mobile/Library/SpringBoard/LockBackgroundThumbnail.jpg"

AVAudioPlayer *chimeAudio;


NSString *appleWatchChime = [[NSBundle bundleWithPath:@"/Library/Application Support/NanoChargingView2/"] pathForResource:@"AppleWatchCharging" ofType:@"caf"];
NSURL *url = [[NSURL alloc] initFileURLWithPath:appleWatchChime];



/*@interface SBDashBoardChargingViewController : SBDashBoardViewControllerBase {
	SBLockScreenBatteryChargingView* _chargingView;
	
}

@interface SBLockScreenBatteryChargingView : SBDashBoardViewBase {

	_UILegibilitySettings* _legibilitySettings;
	double _alignmentPercent;

}
*/

//Settings Path
#define plist @"/var/mobile/Library/Preferences/com.billyellis.ikilledappl3.nanochargingview2.plist"

//Settings Stuff

static BOOL kEnabled;
static BOOL kDarkBlurEnabled;
static BOOL kLightBlurEnabled;
static BOOL kExtraLightBlurEnabled;
static BOOL kAppleWatchChargingSound;
static BOOL kVibrationEnabled;
