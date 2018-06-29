LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := plist
LOCAL_SRC_FILES := ../libplist.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := usbmuxd
LOCAL_SRC_FILES := ../libusbmuxd.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := ssl
LOCAL_SRC_FILES := ../libssl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := crypto
LOCAL_SRC_FILES := ../libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := decrepit
LOCAL_SRC_FILES := ../libdecrepit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LIBIMOBILEDEVICE_SRC := \
    afc.c \
    debugserver.c \
    device_link_service.c \
    diagnostics_relay.c \
    file_relay.c \
    heartbeat.c \
    house_arrest.c \
    idevice.c \
    installation_proxy.c \
    lockdown.c \
    misagent.c \
    mobileactivation.c \
    mobilebackup2.c \
    mobilebackup.c \
    mobile_image_mounter.c \
    mobilesync.c \
    notification_proxy.c \
    property_list_service.c \
    restore.c \
    sbservices.c \
    screenshotr.c \
    service.c \
    syslog_relay.c \
    webinspector.c

COMMON_SRC := \
    debug.c \
    socket.c \
    thread.c \
    userpref.c \
    utils.c 

LOCAL_MODULE := imobiledevice

LOCAL_SRC_FILES := $(addprefix ../../common/, $(COMMON_SRC)) \
		   $(addprefix ../../src/, $(LIBIMOBILEDEVICE_SRC))

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../../src/ \
    $(LOCAL_PATH)/../../include/ \
    $(LOCAL_PATH)/../../include/libimobiledevice \
    $(LOCAL_PATH)/../../common \
    $(LOCAL_PATH)/../../ \
    $(LOCAL_PATH)/../../../libplist/libcnary/ \
    $(LOCAL_PATH)/../../../libplist/libcnary/include \
    $(LOCAL_PATH)/../../../libplist/include \
    $(LOCAL_PATH)/../../../libusbmuxd/common \
    $(LOCAL_PATH)/../../../libusbmuxd/include \
    $(LOCAL_PATH)/../../../boringssl/include/ 

LOCAL_CFLAGS  += -DHAVE_OPENSSL -DHAVE_ASPRINTF -DHAVE_VASPRINTF -DHAVE_SYS_TYPES_H -DSTRIP_DEBUG_CODE -g
LOCAL_STATIC_LIBRARIES += libplist libusbmuxd libcrypto libssl libdecrepit
#LOCAL_SHARED_LIBRARIES += libcrypto libssl libdecrepit
LOCAL_LDFLAGS += -llog 
 
include $(BUILD_STATIC_LIBRARY)
