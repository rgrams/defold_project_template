
-- Stupid-simple module to remember whether actions are pressed or not.

local M = {}

local state = {}

function M.on_input(action_id, action)
	if action.pressed then
		state[action_id] = true
	elseif action.released then
		state[action_id] = false
	end
end

function M.is_pressed(action_id)
	if state[action_id] then  return true
	else  return false  end
end

return M
