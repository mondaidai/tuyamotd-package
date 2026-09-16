include $(TOPDIR)/rules.mk

PKG_NAME:=tuyamotd
PKG_RELEASE:=1
PKG_VERSION:=1.0.0
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:mondaidai/tuyamotd.git
PKG_SOURCE_VERSION:=HEAD

include $(INCLUDE_DIR)/package.mk

define Package/tuyamotd
	CATEGORY:=Base system
	TITLE:=tuyamotd
	DEPENDS:=+tuya-iot-core +cJSON +libubus +libubox +libblobmsg-json +libpthread +libuci
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
