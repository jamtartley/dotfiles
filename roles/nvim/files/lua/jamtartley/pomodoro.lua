local M = {}

local timer = nil
local command = "CellularAutomaton make_it_rain"
local start_time = nil
local timer_duration = 1000 * 60 * 20 -- 20 minutes

local function _ms_to_human_readable(ms)
	local total_seconds = math.floor(ms / 1000)
	local minutes = math.floor(total_seconds / 60)
	local seconds = total_seconds % 60
	return string.format("%d minutes and %d seconds", minutes, seconds)
end

local function _stop_timer()
	if timer then
		timer:stop()
		timer:close()
		timer = nil
		start_time = nil
		print("Pomodoro stopped")
	end
end

local function _start_timer()
	if not timer then
		timer = vim.loop.new_timer()
		start_time = vim.loop.now()
		timer:start(
			timer_duration,
			0,
			vim.schedule_wrap(function()
				_stop_timer()
				vim.cmd(command)
			end)
		)
		print("Starting pomodoro for " .. _ms_to_human_readable(timer_duration))
	end
end

function M.toggle_timer()
	if timer then
		_stop_timer()
	else
		_start_timer()
	end
end

function M.peek()
	if timer and start_time then
		local elapsed_time = vim.loop.now() - start_time
		local remaining_time = timer_duration - elapsed_time
		print("Remaining time: " .. _ms_to_human_readable(remaining_time))
	else
		print("No timer is running")
	end
end

return M
