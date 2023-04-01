TARGET := iphone:clang:14.5
INSTALL_TARGET_PROCESSES = SpringBoard
export THEOS_DEVICE_IP=192.168.50.114

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Everest

$(TWEAK_NAME)_FILES = $(wildcard *.x *.xm *.m)
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += everestprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
