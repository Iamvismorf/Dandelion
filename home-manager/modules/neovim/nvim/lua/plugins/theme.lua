vim.opt.cursorline = true

-- return {
-- 	"bettervim/yugen.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local p = require("yugen.palette")
-- 		require("yugen").setup({

-- 			highlight_groups = {
-- 				-- #beff89
-- 				Cursor = { fg = p.color200, bg = p.color200 },
-- 				CursorLineNr = { fg = p.primary },
-- 				IncSearch = { fg = p.color800, bg = p.primary },
-- 				-- MatchParen = { fg = p.color800, bg = p.color200, style="underline" },
-- 				MatchParen = { sp = p.placeholder, style = "underline" },
-- 				Search = { fg = p.color800, bg = p.color400 },

-- 				["@operator"] = { fg = "color100" },
-- 				["@punctuation.delimiter"] = { fg = p.color100 },
-- 				["@punctuation.special"] = { fg = p.color100 },
-- 				["@string"] = { fg = p.primary },

-- 				-- Neotree
-- 				NeoTreeDirectoryIcon = { fg = p.primary },
-- 				NeoTreeDirectoryName = { fg = p.primary },
-- 				-- NeoTreeRootName = { fg = "#FFBE89" },
-- 				NeoTreeTitleBar = { fg = p.primary, bg = p.color600 },

-- 				TelescopeBorder = { fg = p.color100 },
-- 				TelescopePromptBorder = { fg = p.color100 },
-- 				TelescopeSelection = { fg = p.color200, bg = p.color600 },
-- 			},
-- 		})
-- 	end,
-- 	init = function()
-- 		vim.cmd.colorscheme("yugen")
-- 		--     local p = require("yugen.palette")
-- 		-- vim.api.nvim_set_hl(0, "MatchParen", {
-- 		-- 	underline = true,
-- 		-- 	bold = true, -- optional: make it bold
-- 		-- 	sp = p.color100,
-- 		-- })
-- 	end,
-- }
return {}
