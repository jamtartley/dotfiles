--[[ docker_compose_language_service expects the filetype to be yaml.docker-compose ]]
function detect_compose_for_lsp()
	local filename = vim.fn.expand("%:t")

	if string.match(filename, "docker%-compose%.ya*ml") then
		vim.bo.filetype = "yaml.docker-compose"
	end
end

vim.cmd([[au BufRead * lua detect_compose_for_lsp()]])
