local status, surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("surround not found!")
	return
end

--[[  
--normal mode
    Old text                    Command         New text ~
    local str = H*ello          ysw"           local str = H"ello"                    
    local str = H*ello          ysiw"           local str = "Hello"                   
    require"nvim-surroun*d"     ysa")           require("nvim-surround")              around "
    char c = *x;                ysl'            char c = 'x';
    int a[] = *32;              yst;}           int a[] = {32}; 

    "hello world"               ds"             hello world                           delete
    'hello world'               cs'"            "hellow world"                        change

visual mode

local str = |some text|        S'               local str = 'some text'



]]

surround.setup({
	-- Configuration here, or leave empty to use defaults
})

