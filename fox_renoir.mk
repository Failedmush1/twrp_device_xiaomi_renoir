#
"FOX_MAINTAINER_PATCH_VERSION" [NEW]
  - use this to add your maintainer version information (if desired) to the OrangeFox release version number
  - the value supplied here should not be preceded by any separator (an underscore is added automatically)
  - eg. export FOX_MAINTAINER_PATCH_VERSION="Failedmush" (produces something like "R11.3_04")
  - default = Failedmush

# screen settings
export OF_SCREEN_H=2400
export OF_STATUS_H=100
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=150

# other stuff
OF_USE_GREEN_LED := 0
OF_QUICK_BACKUP_LIST := /boot;/data;
OF_ENABLE_LPTOOLS := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# full size
OF_DYNAMIC_FULL_SIZE := 9126805504

# number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9

# ----- data format stuff -----
# ensure that /sdcard is bind-unmounted before f2fs data repair or format
OF_UNBIND_SDCARD_F2FS := 1

# automatically wipe /metadata after data format
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1

# avoid MTP issues after data format
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1

# refresh encryption props before formatting data
#  OF_REFRESH_ENCRYPTION_PROPS_BEFORE_FORMAT := 1

ifneq ($(FOX_VENDOR_BOOT_RECOVERY),1)
   OF_USE_LZ4_COMPRESSION := 1
endif

# build all the partition tools
OF_ENABLE_ALL_PARTITION_TOOLS := 1
#
