require("nwpersonal.helpers.keyboard")

return {
    "linguini1/pulse.nvim",
    version = "*", -- Latest stable release
    config = function() 
        local pulse = require("pulse")
        pulse.setup()

        pulse.add("break", {
            interval = 1,
            enabled = false,
            message = "Break timer",
            level = vim.log.levels.INFO,
            cb = function (timer) 
                require("notify")("Break timer alarm", vim.log.levels.WARN)
            end
        })

        nm("<leader>tb", function()
            local pulse = require("pulse")
            local timer = pulse._timers["break"]
            local notify = require("notify")

            if timer then
                local toggled = timer.toggle()
                if toggled then
                    notify("Timer break enabled", vim.log.levels.INFO)
                else
                    notify("Timer break disabled", vim.log.levels.INFO)
                end
            else
                notify("Timer 'break' not found", vim.log.levels.ERROR)
            end
        end, "Timer break toggle")
     end 
}