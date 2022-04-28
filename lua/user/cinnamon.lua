local status_ok, cinnamon = pcall(require, "cinnamon")
if not status_ok then
	return
end

cinnamon.setup({
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = true, -- Create extra keymaps.
	extended_keymaps = true, -- Create extended keymaps.
	centered = true, -- Keep cursor centered in window when using window scrolling.
	default_delay = 5, -- The default delay (in ms) between each line when scrolling.
	horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
	scroll_limit = 150,
})
