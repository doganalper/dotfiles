local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = wilder.popupmenu_renderer({
			highlighter = wilder.basic_highlighter(),
			apply_incsearch_fix = 0,
		}),
		["/"] = wilder.popupmenu_renderer({
			highlighter = wilder.basic_highlighter(),
		}),
	})
)
