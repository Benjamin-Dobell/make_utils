include $(dir $(realpath $(lastword ${MAKEFILE_LIST})))/target.mak

VARIANT := $(TARGET_OS)-$(TARGET_ARCH)-release

ifneq ($(RELEASE), on)
	ifneq ($(RELEASE), true)
	    VARIANT = $(TARGET_OS)-$(TARGET_ARCH)-debug
    endif
endif
