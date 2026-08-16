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

return Tuyamotd
