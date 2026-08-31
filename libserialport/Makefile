include $(TOPDIR)/rules.mk

PKG_NAME:=libserialport
PKG_VERSION:=0.1.2
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/sigrokproject/libserialport.git
PKG_SOURCE_VERSION:=master
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libserialport
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cross-platform serial port library
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/libserialport/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libserialport.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libserialport))