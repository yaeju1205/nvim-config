local packages = {}

local plugin = {}
plugin.index = "https://github.com/"
plugin.directory = vim.fn.expand(vim.fn.stdpath("data") .. "/site/pack/plugins/opt/")

function plugin.install(repo, spec)
	spec = spec or {}
	local name = string.match(repo, "^.+/(.+)$")
	local index = spec.index or plugin.index
	local directory = (spec.directory or plugin.directory) .. name
	local branch = spec.branch

	if vim.fn.isdirectory(directory) == 0 then
		local cmd = { "git", "clone", "--depth=1" }

		if branch then
			table.insert(cmd, "--branch")
			table.insert(cmd, branch)
		end

		table.insert(cmd, index .. repo)
		table.insert(cmd, directory)

		local out = vim.fn.system(cmd)

		if vim.v.shell_error ~= 0 then
			vim.notify(out, vim.log.levels.ERROR)
		end
	end

	vim.cmd("packadd " .. name)

	return function(module)
		return require(module)
	end
end

packages.plugin = plugin
_G.packages = packages
