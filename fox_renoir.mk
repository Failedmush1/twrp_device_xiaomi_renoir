# Custom pic for maintainers about section info
# Image should be 32 bit PNG 192 x 192 px - Size of image should be as small as possible 50kb
OF_MAINTAINER := Failedmush

# screen settings
OF_SCREEN_H := 2400
OF_STATUS_H := 80
OF_STATUS_INDENT_LEFT := 58
OF_STATUS_INDENT_RIGHT := 58
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1

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

# frp
OF_ENABLE_FRP_ADDON := 1

# refresh encryption props before formatting data
#  OF_REFRESH_ENCRYPTION_PROPS_BEFORE_FORMAT := 1

ifneq ($(FOX_VENDOR_BOOT_RECOVERY),1)
   OF_USE_LZ4_COMPRESSION := 1
endif

# build all the partition tools
OF_ENABLE_ALL_PARTITION_TOOLS := 1

