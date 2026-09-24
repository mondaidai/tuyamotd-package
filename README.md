# tuyamotd-package

OpenWrt packages for controlling ESP devices through `ubus` and Tuya Cloud.

## Packages

- `ubved` discovers ESP devices over USB serial and provides the `ubved` ubus
  object.
- `tuyamotd` connects Tuya Cloud MQTT actions to `ubved`.
- `libserialport` and `tuya-iot-core` provide package dependencies.
- `feeds/vuci/vuci-app-tuyamotd-api` provides the optional VuCI API.

## Building

Add this repository to an OpenWrt build tree as a package feed, update the
feeds, select the packages in `make menuconfig`, and build as usual:

```sh
make package/ubved/compile V=s
make package/tuyamotd/compile V=s
```

The package dependencies are declared in the package Makefiles. Install the
generated packages with `opkg` or `apk`, depending on your OpenWrt version, or
include them in the target image.

## Services

`ubved` is managed by procd and exposes these ubus methods:

- `devices` - list detected devices
- `on` / `off` - set a GPIO state
- `get` - read sensor data

```sh
/etc/init.d/ubved enable
/etc/init.d/ubved start
```

`tuyamotd` supports `switch_pin`, `get_measurements`, and `get_devices`. It
can be run directly:

```sh
tuyamotd -i DEVICE_ID -s DEVICE_SECRET -p PRODUCT_ID
```

For the OpenWrt service, configure `/etc/config/tuyamotd` and enable it:

```sh
uci set tuyamotd.general.enabled='1'
uci set tuyamotd.general.device_id='DEVICE_ID'
uci set tuyamotd.general.device_secret='DEVICE_SECRET'
uci set tuyamotd.general.product_id='PRODUCT_ID'
uci commit tuyamotd
/etc/init.d/tuyamotd enable
/etc/init.d/tuyamotd start
```

## VuCI API

The optional VuCI API package exposes `tuyamotd` configuration remotely,
including Tuya credentials, MQTT settings, ubus timeout, and log level.

## Related projects

- [ubved](https://github.com/mondaidai/ubved)
- [tuyamotd](https://github.com/mondaidai/tuyamotd)