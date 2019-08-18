
local M = {}

local YVEC = vmath.vector3(0, 1, 0)
local NEG_YVEC = vmath.vector3(0, -1, 0)
local XVEC = vmath.vector3(1, 0, 0)
local NEG_XVEC = vmath.vector3(-1, 0, 0)

local msgData = {}

function M.applyTorque(t, pos, url)
	pos = pos or go.get_world_position()
	url = url or "#collisionobject"
	local halfT = t / 2
	msgData.force = NEG_XVEC * halfT;  msgData.position = pos + NEG_YVEC
	msg.post(url, "apply_force", msgData)
	msgData.force = XVEC * halfT;  msgData.position = pos + YVEC
	msg.post(url, "apply_force", msgData)
end

function M.applyForce(force, pos, url)
	pos = pos or go.get_world_position()
	url = url or "#collisionobject"
	msgData.force = force;  msgData.position = pos
	msg.post(url, "apply_force", msgData)
end

return M
