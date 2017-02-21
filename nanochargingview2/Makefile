TARGET = iphone:clang
SDK = iPhoneOS10.2
ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = NanoChargingView2
NanoChargingView2_FILES = NanoChargingView2.mm
NanoChargingView2_INSTALL_PATH = /Library/PreferenceBundles
NanoChargingView2_FRAMEWORKS = UIKit MessageUI CoreGraphics
NanoChargingView2_PRIVATE_FRAMEWORKS = Preferences
RoundedSwitchr_LIBRARIES += cepheiprefs MobileGestalt
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NanoChargingView2.plist$(ECHO_END)
