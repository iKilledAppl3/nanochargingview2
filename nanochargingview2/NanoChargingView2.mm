#import "../NanoChargingView2BridgingHeader.h"

@interface NanoChargingView2ListController: HBListController {
}
@end

@implementation NanoChargingView2ListController

+ (NSString *)hb_specifierPlist {
	return @"NanoChargingView2";
}


+ (UIColor *)hb_tintColor {
	return [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
}


-(void)loadView {
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}
- (void)shareTapped {
    NSString *text = [NSString stringWithFormat:@"I'm using #NanoChargingView2 by @bellis1000 & @iKilledAppl3! Download in Cydia on the BigBoss repo for free!"];
    
    if ([UIActivityViewController alloc]) {
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[text] applicationActivities:nil];
        [(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
    }else {
        //awesomeness
    }
}


-(void)respring {

	//Added the sysVersion stuff because of iPhone 7 & 7+ issues on auto respring with backboardd
if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,0}]){
	system ("killall -9 SpringBoard");
}

if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,0,1}]){
	system ("killall -9 SpringBoard");
}

if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){.majorVersion = 10, .minorVersion = 1, .patchVersion = 0}]) {
	system ("killall -9 SpringBoard");
}

if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,1,1}]){
	system ("killall -9 SpringBoard");
}

else {
	system ("killall -9 backboardd");	
}
    
}

@end

// vim:ft=objc
