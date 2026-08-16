local ConfigService = require("api/ConfigService")

local TuyamotdAPI = ConfigService:new({
	delete = false,
	create = true,
})

local TuyamotdConfigSection = TuyamotdAPI:section("tuyamotd", "general")
TuyamotdConfigSection:make_primary()

local opt_enable = TuyamotdConfigSection:option("enabled")
	function opt_enable:validate(val)
		return self.dt:is_bool(val)
	end

local opt_device_id = TuyamotdConfigSection:option("device_id")
	opt_device_id.maxlength = 64

local opt_device_secret = TuyamotdConfigSection:option("device_secret")
	opt_device_secret.maxlength = 64

local opt_product_id = TuyamotdConfigSection:option("product_id")
	opt_product_id.maxlength = 64

function TuyamotdAPI:PUT_after_commit_hook()
	os.execute("/etc/init.d/tuyamotd restart")
end

return TuyamotdAPI
