local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("dashboard not found")
  return
end

--db.custom_footer = {
--  "",
--  "",
--  "https://github.com/nshen/learn-neovim-lua",
--}


local customer_header = {
  [[]],
  [[             ▄▄▀▀▀▀▀▀▀▀▄▄              ]],
  [[          ▄▀▀            ▀▄▄           ]],
  [[        ▄▀                  ▀▄         ]],
  [[       ▌             ▀▄       ▀▀▄      ]],
  [[      ▌                ▀▌        ▌     ]],
  [[     ▐                  ▌        ▐     ]],
  [[     ▌▐    ▐    ▐       ▌         ▌    ]],
  [[    ▐ ▌    ▌  ▐ ▌      ▐       ▌▐ ▐    ]],
  [[    ▐ ▌    ▌▄▄▀▀▌▌     ▐▀▌▀▌▄  ▐ ▌ ▌   ]],
  [[     ▌▌    ▐▀▄▌▌▐▐    ▐▐▐ ▐ ▌▌ ▐ ▌▄▐   ]],
  [[   ▄▀▄▐    ▌▌▄▀▄▐ ▌▌ ▐ ▌▄▀▄ ▐  ▐ ▌ ▀▄  ]],
  [[  ▀▄▀  ▌  ▄▀ ▌█▐  ▐▐▀   ▌█▐ ▀▄▐ ▌▌   ▀ ]],
  [[   ▀▀▄▄▐ ▀▄▀ ▀▄▀        ▀▄▀▄▀ ▌ ▐      ]],
  [[      ▀▐▀▄ ▀▄        ▐      ▀▌▐        ]],
  [[        ▌ ▌▐ ▀              ▐ ▐        ]],
  [[        ▐ ▐ ▌    ▄▄▀▀▀▀▄    ▌ ▐        ]],
  [[         ▌▐ ▐▄   ▐     ▌  ▄▀  ▐        ]],
  [[        ▐  ▌▐▐▀▄  ▀▄▄▄▀ ▄▀▐   ▐        ]],
  [[        ▌▌ ▌▐ ▌ ▀▄▄    ▄▌▐ ▌  ▐        ]],
  [[       ▐ ▐ ▐▐ ▌    ▀▀▄▀▌▐  ▌  ▌        ]],
  [[       ▌  ▌▐ ▌        ▐▀▄▌ ▐           ]],
}


-- local customer_header={
--     [[                                    ]],
--     [[     ████▌█████▌█ ████████▐▀██▀     ]],
--     [[   ▄█████ █████▌ █ ▀██████▌█▄▄▀▄    ]],
--     [[   ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀   ]],
--     [[  ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█       ]],
--     [[    ███ ▌▄█▌  ▀  ▀██  ▀██████▌      ]],
--     [[     ▀█▌▀██▀ ▄         ███▐███      ]],
--     [[      ██▌             ▐███████▌     ]],
--     [[      ███     ▀█▀     ▐██▐███▀▌     ]],
--     [[      ▌█▌█▄         ▄▄████▀ ▀       ]],
--     [[        █▀██▄▄▄ ▄▄▀▀▒█▀█            ]],
--     [[]],
--   }


-- local customer_header = {
--     [[          ▀████▀▄▄              ▄█ ]],
--     [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--     [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--     [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--     [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--     [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--     [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--     [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--     [[   █   █  █      ▄▄           ▄▀   ]],
--     [[]],
-- }

local customer_center = {
  {
    -- icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    -- icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    -- icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    -- icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  {
    -- icon = "  ",
    desc = "Find file                           ",
    action = "Telescope find_files",
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit .bashrc                        ",
  --   action = "edit ~/.bashrc",
  -- },
  {
    -- icon = "  ",
    desc = "Change colorscheme                  ",
    -- action = "ChangeColorScheme",
    action = "edit ~/.config/nvim/lua/colorscheme.lua",
  },
  {
    -- icon = "  ",
    desc = "Edit Plugins                       ",
    action = "edit ~/.config/nvim/lua/plugins.lua",
  },

  {
    -- icon = "  ",
    desc = "Edit dashboard                       ",
    action = "edit ~/.config/nvim/lua/config/dashboard.lua",
  },

  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                       ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}

db.setup({
  theme = 'doom',
  config = {
    --header = {
    header = customer_header,
    center = customer_center,
  },
})
