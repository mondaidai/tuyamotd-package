include $(TOPDIR)/rules.mk

PKG_NAME:=tuyamotd
PKG_RELEASE:=1
PKG_VERSION:=1.0.0
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=http://84.15.161.187/ervgas/tuyamotd.git
PKG_SOURCE_VERSION:=ac81f1ee9aaf7325dbfed0ac3f2c94baa6d829a0

include $(INCLUDE_DIR)/package.mk

define Package/tuyamotd
	CATEGORY:=Base system
	TITLE:=tuyamotd
	DEPENDS:=+tuya_iot_core +cJSON +libubus +libubox +libblobmsg-json +libpthread +libuci +rpcd +lua +libubus-lua
endef

define Package/tuyamotd/description
	This is a monitoring daemon that monitors the device and sends data to the cloud.
endef

define Package/tuyamotd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/tuyamotd $(1)/usr/bin

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/tuyamotd $(1)/etc/config/tuyamotd

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/tuyamotd $(1)/etc/init.d/tuyamotd

endef

$(eval $(call BuildPackage,tuyamotd))
