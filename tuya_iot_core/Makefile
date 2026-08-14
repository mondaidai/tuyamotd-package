include $(TOPDIR)/rules.mk

PKG_NAME:=tuya_iot_core
PKG_RELEASE:=1
PKG_VERSION:=1.0.0
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/tuya/tuya-iot-core-sdk.git
PKG_SOURCE_VERSION:=0208badefb2003d30e70b5b875395e3187c850d9
PKG_HASH:=2153b293478bf735dd84b6928fc2590ba13079743e490adbc4aa37dc71f2a695

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_INSTALL:=0
CMAKE_OPTIONS += -DBUILD_SHARED_LIBS=ON
CMAKE_BINARY_SUBDIR:=build

define Package/tuya_iot_core
	CATEGORY:=Libraries
	TITLE:=libtuyacore
endef

define Package/tuya_iot_core/description
	This is tuya-iot-code-sdk library
endef

define Package/tuyamotd/conffiles
/etc/config/tuyamotd
endef

define Build/Install
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/lib $(PKG_INSTALL_DIR)/usr/include
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CMAKE_BINARY_SUBDIR)/lib/*.so $(PKG_INSTALL_DIR)/usr/lib/

	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/cipher_wrapper.h $(PKG_INSTALL_DIR)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/tuya_config_defaults.h $(PKG_INSTALL_DIR)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/tuya_endpoint.h $(PKG_INSTALL_DIR)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/tuyalink_core.h $(PKG_INSTALL_DIR)/usr/include/
	
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/utils/cJSON.h $(PKG_INSTALL_DIR)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/utils/tuya_error_code.h $(PKG_INSTALL_DIR)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/interface/mqtt_client_interface.h $(PKG_INSTALL_DIR)/usr/include/

endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/include
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CMAKE_BINARY_SUBDIR)/lib/*.so $(1)/usr/lib/

	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/cipher_wrapper.h $(1)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/tuya_config_defaults.h $(1)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/tuya_endpoint.h $(1)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/include/tuyalink_core.h $(1)/usr/include/

	$(INSTALL_DATA) $(PKG_BUILD_DIR)/utils/cJSON.h $(1)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/utils/tuya_error_code.h $(1)/usr/include/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/interface/mqtt_client_interface.h $(1)/usr/include/

endef

define Package/tuya_iot_core/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CMAKE_BINARY_SUBDIR)/lib/*.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,tuya_iot_core))
