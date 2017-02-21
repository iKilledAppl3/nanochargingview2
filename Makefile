TARGET = iphone:clang
SDK = iPhoneOS10.2
ARCHS = armv7 arm64
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = NanoChargingView2
NanoChargingView2_FILES = Tweak.xm
NanoChargingView2_CFLAGS = -Wno-error
NanoChargingView2_LDFLAGS += -Wl,-segalign,4000
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nanochargingview2
include $(THEOS_MAKE_PATH)/aggregate.mk
