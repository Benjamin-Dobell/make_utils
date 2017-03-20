ifeq ($(OS),Windows_NT)
	HOST_OS := WIN32

	ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
		HOST_ARCH := AMD64
	else
		ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
			HOST_ARCH := AMD64
		endif
		ifeq ($(PROCESSOR_ARCHITECTURE),x86)
			HOST_ARCH := IA32
		endif
	endif
else
	UNAME_S := $(shell uname -s)

	HOST_OS := $(shell echo $(UNAME_S) | tr a-z A-Z)
	HOST_ARCH := $(shell uname -m)

	ifeq ($(UNAME_S), Darwin)
		HOST_OS := MACOS
	endif

	ifneq ($(findstring FreeBSD,$(UNAME_S)),)
		HOST_OS := FREEBSD
	endif
	ifneq ($(findstring OpenBSD,$(UNAME_S)),)
		HOST_OS := OPENBSD
	endif
	ifneq ($(findstring NetBSD,$(UNAME_S)),)
		HOST_OS := NETBSD
	endif
	ifneq ($(findstring DragonFly,$(UNAME_S)),)
		HOST_OS := DRAGONFLY
	endif

	ifneq ($(findstring SunOS,$(UNAME_S)),)
		HOST_OS  := SOLARIS
	endif

	ifneq ($(findstring CYGWIN,$(UNAME_S)),)
		HOST_OS := CYGWIN
	endif
endif
