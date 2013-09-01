LOCAL_DIR := $(GET_LOCAL_DIR)

MEMBASE := 0x81E00000 # SDRAM
MEMSIZE := 0x00100000 # 1MB

SCRATCH_ADDR     := 0x85000000
HAVE_CACHE_PL310 := no
#//<<EricHsieh,2013/6/18,Bootup time tuning
LK_PROFILING := no
#//<<EricHsieh,2013/6/18,Bootup time tuning
MTK_FASTBOOT_SUPPORT := yes

MACH_TYPE := 6589
# //<2013/05/15-24942-EricLin, [ARIMA][Pelican] S1 enable.
SONY_S1_SUPPORT := yes
# //>2013/05/15-24942-EricLin

DEFINES += \
        MEMBASE=$(MEMBASE)\
	SCRATCH_ADDR=$(SCRATCH_ADDR)\
	MACH_TYPE=$(MACH_TYPE)

ifeq ($(HAVE_CACHE_PL310), yes)
DEFINES += HAVE_CACHE_PL310
endif

ifeq ($(SONY_S1_SUPPORT), yes)
MTK_FASTBOOT_SUPPORT := no
SONY_S1_BOOT_AID := 4
DEFINES += SONY_S1_SUPPORT
DEFINES += SONY_S1_BOOT_AID=$(SONY_S1_BOOT_AID)
endif
ifeq ($(MTK_FASTBOOT_SUPPORT), yes)
DEFINES += MTK_FASTBOOT_SUPPORT
endif

ifeq ($(LK_PROFILING), yes)
DEFINES += LK_PROFILING
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
DEFINES += USER_BUILD
endif


