local status_ok, dracula = pcall(require, "dracula")
if not status_ok then
	return
end

dracula.setup({
	italic_comment = true,
	show_end_of_buffer = true
})
