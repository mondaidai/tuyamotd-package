local FunctionService = require("api/FunctionService")
local ubus = require("ubus");
local Tuyamotd = FunctionService:new()

local conn = ubus.connect()

if not conn then
	error("Failed to connect to ubus")
end

-- GET /api/tuyamotd/status
function Tuyamotd:GET_TYPE_status()
	local res = conn:call("tuyamotd", "status", {})
	return self:ResponseOK({
		result = res
	})
end

-- GET /api/tuyamotd/settings
function Tuyamotd:GET_TYPE_settings()
    local name = self.arguments and self.arguments.name

    if not name then
        return self:ResponseError({
            error = "Missing parameter: name"
        })
    end

    local res = conn:call("tuyamotd", "get_setting", {
        name = name
    })

    return self:ResponseOK(res)
end

-- GET /api/tuyamotd/config
function Tuyamotd:GET_TYPE_config()

    local res = conn:call("tuyamotd", "get_config", {})

    return self:ResponseOK(res)
end

return Tuyamotd
