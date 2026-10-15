include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_NAME:=ubved
PKG_RELEASE:=1
PKG_VERSION:=1.0.0
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mondaidai/ubved.git

define Package/ubved
	CATEGORY:=Utilities
	TITLE:=ubved
	DEPENDS:=+libubus +libubox +libblobmsg-json +libserialport
endef

define Package/ubved/description
	This is a daemon, which provides ubus methods to control esp devices
endef

define Package/ubved/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/ubved $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/ubved $(1)/etc/init.d/ubved
endef

$(eval $(call BuildPackage,ubved))
