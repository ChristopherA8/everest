TARGET := iphone:clang:14.5

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = everestprefs

everestprefs_FILES = $(wildcard *.m)
everestprefs_FRAMEWORKS = UIKit
everestprefs_PRIVATE_FRAMEWORKS = Preferences
everestprefs_EXTRA_FRAMEWORKS = CepheiPrefs
everestprefs_INSTALL_PATH = /Library/PreferenceBundles
everestprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
