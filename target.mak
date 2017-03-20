include $(dir $(realpath $(lastword ${MAKEFILE_LIST})))/host.mak

ifeq ($(TARGET_OS),)
	TARGET_OS := $(HOST_OS)

	ifeq ($(TARGET_ARCH),)
		TARGET_ARCH := $(HOST_ARCH)
	endif
endif
