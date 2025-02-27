local node_alias = vim.fn.expand("$HOME/.nvm/alias/nvim")
if vim.fn.filereadable(node_alias) == 1 then
	local node_version = vim.fn.readfile(node_alias)[1]
	local node_bin = vim.fn.expand("$HOME/.nvm/versions/node/v" .. node_version .. "/bin")
	vim.g.node_host_prog = node_bin .. "/node"
	vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")
end

-- source/create python virtual env if present, otherwise use pyenv
local function get_git_root()
	local git = vim.fs.find({ ".git" }, { upward = true, limit = 1, type = "directory", stop = vim.fn.expand("$HOME") })
	if #git == 1 then
		return vim.fn.fnamemodify(git[1], ":h")
	end
	return nil
end

local get_venv = function()
	local envvar_virtualenv = os.getenv("VIRTUAL_ENV")
	if envvar_virtualenv ~= nil then
		-- virtual env already activated, return
		vim.fs.normalize(envvar_virtualenv)
	end

	local gitroot = get_git_root()

	if gitroot == nil then
		-- could not get the root from the git repo, return nil
		return nil
	end

	local venv = vim.fs.find({ ".venv", "env" }, { path = gitroot, limit = 1, type = "directory" })
	if #venv == 1 then
		-- virtual environment already created, return it
		return venv[1]
	end

	local setupcfg = vim.fs.find({ "setup.cfg" }, { path = gitroot, limit = 1, type = "file" })
	if #setupcfg == 1 then
		print("Creating virutal environment with cnvr-pyenv")
		-- legacy setup.cfg/mkrpm based virtual environment
		-- create venv and then activate it just for nvim
		vim.fn.system("cd " .. gitroot .. " && cnvr-pyenv create")
		return gitroot .. "/env"
	end

	local pyproject = vim.fs.find({ "pyproject.toml" }, { path = gitroot, limit = 1, type = "file" })
	if #pyproject == 1 then
		print("Creating virutal environment with uv")
		-- create venv and then activate it just for nvim
		vim.fn.system("cd " .. gitroot .. " && uv sync --locked")
		return gitroot .. "/.venv"
	end

	local pyenv = vim.fn.expand("$HOME/.pyenv/versions/neovim3")
	if vim.fn.filereadable(pyenv) == 1 then
		return pyenv
	end

	return nil
end

local python_venv_dir = get_venv()
if python_venv_dir ~= nil then
	vim.g.custom_python_venv = python_venv_dir
	local python_bin = python_venv_dir .. "/bin"
	vim.g.python3_host_prog = python_bin .. "/python"
	vim.cmd("let $PATH = '" .. python_bin .. ":' . $PATH")
	vim.fn.setenv("VIRTUAL_ENV", venv)
end
