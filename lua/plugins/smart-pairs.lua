local status_ok, pairs = pcall(require, "pairs")
if not status_ok then
	return
end

pairs:setup({
	enter = {
		enable_mapping = false,
	},
})
