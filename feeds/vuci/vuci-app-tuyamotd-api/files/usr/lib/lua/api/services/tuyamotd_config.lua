local ConfigService = require("api/ConfigService")

local TuyamotdAPI = ConfigService:new({
	delete = false,
	create = true,
})

local TuyamotdGeneralSection = TuyamotdAPI:section("tuyamotd", "general")
TuyamotdGeneralSection:make_primary()

local opt_enable = TuyamotdGeneralSection:option("enabled")
	function opt_enable:validate(val)
		return self.dt:is_bool(val)
	end

local opt_device_id = TuyamotdGeneralSection:option("device_id")
	opt_device_id.maxlength = 64

local opt_device_secret = TuyamotdGeneralSection:option("device_secret")
	opt_device_secret.maxlength = 64

local opt_product_id = TuyamotdGeneralSection:option("product_id")
	opt_product_id.maxlength = 64


local TuyamotdMqttSection = TuyamotdAPI:section("tuyamotd", "mqtt")

local opt_host = TuyamotdMqttSection:option("host")
	function opt_host:validate(val)
		return self.dt:hostname(val) or self.dt:ipaddr(val)
	end

local opt_port = TuyamotdMqttSection:option("port")
	function opt_port:validate(val)
		return self.dt:port(val)
	end

local opt_keepalive = TuyamotdMqttSection:option("keepalive")
	function opt_keepalive:validate(val)
		return self.dt:irange(val, 1, 3600)
	end

local TuyamotdSystemSection = TuyamotdAPI:section("tuyamotd", "system")

local opt_ubus_timeout_ms = TuyamotdSystemSection:option("ubus_timeout_ms")
	function opt_ubus_timeout_ms:validate(val)
		return self.dt:irange(val, 100, 30000)
	end

local TuyamotdLogSection = TuyamotdAPI:section("tuyamotd", "log")

local opt_log_level = TuyamotdLogSection:option("log_level")
	function opt_log_level:validate(val)
		local allowed = {
			LOG_ALERT = true,
			LOG_CRIT = true,
			LOG_ERR = true,
			LOG_WARNING = true,
			LOG_NOTICE = true,
			LOG_INFO = true,
			LOG_DEBUG = true,
		}

		return allowed[val] and val
	end


return TuyamotdAPI
