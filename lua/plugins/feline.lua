local M = {
    'feline-nvim/feline.nvim',
    event = 'VeryLazy',
}

function M.config()
    local feline = require 'feline'

    local kanagawa = require 'ui.kanagawa'

    local assets = {
        file = '  ',
        lsp = {
            server = '  ',
            error = '  ',
            warning = '  ',
            info = '  ',
            hint = '  ',
        },
        git = {
            branch = '   ',
            added = '   ',
            changed = '   ',
            removed = '   ',
        },
    }

    local vi_mode_colors = {
        NORMAL = 'sumiInk1c',
        OP = 'winterBlue',
        INSERT = 'winterBlue',
        VISUAL = 'winterYellow',
        LINES = 'winterYellow',
        BLOCK = 'winterYellow',
        REPLACE = 'winterRed',
        COMMAND = 'winterRed',
        TERM = 'winterRed',
    }

    local c = {
        vim_mode = {
            provider = {
                name = 'vi_mode',
                opts = {
                    show_mode_name = true,
                    -- padding = 'center', -- Uncomment for extra padding.
                },
            },
            icon = '',
            hl = function()
                return {
                    bg = require('feline.providers.vi_mode').get_mode_color(),
                    fg = 'base',
                    style = 'bold',
                    name = 'NeovimModeHLColor',
                }
            end,
            left_sep = 'block',
            right_sep = 'block',
        },
        gitBranch = {
            provider = 'git_branch',
            hl = {
                fg = 'crystalBlue',
                bg = 'sumiInk1c',
            },
            left_sep = 'block',
            right_sep = 'block',
            icon = assets.git.branch,
        },
        gitDiffAdded = {
            provider = 'git_diff_added',
            hl = {
                fg = 'autumnGreen',
                bg = 'sumiInk1c',
            },
            left_sep = 'block',
            right_sep = 'block',
            icon = assets.git.added,
        },
        gitDiffRemoved = {
            provider = 'git_diff_removed',
            hl = {
                fg = 'autumnRed',
                bg = 'sumiInk1c',
            },
            left_sep = 'block',
            right_sep = 'block',
            icon = assets.git.removed,
        },
        gitDiffChanged = {
            provider = 'git_diff_changed',
            hl = {
                fg = 'autumnYellow',
                bg = 'sumiInk1c',
            },
            left_sep = 'block',
            right_sep = 'right_filled',
            icon = assets.git.changed,
        },
        separator = {
            provider = ' ',
        },
        fileinfo = {
            provider = {
                name = 'file_info',
                opts = {
                    type = 'relative-short',
                },
            },
            left_sep = ' ',
            right_sep = ' ',
            hl = {
                fg = 'sakuraPink',
            },
        },
        diagnostic_errors = {
            provider = 'diagnostic_errors',
            hl = {
                fg = 'samuraiRed',
            },
            icon = assets.lsp.error,
        },
        diagnostic_warnings = {
            provider = 'diagnostic_warnings',
            hl = {
                fg = 'roninYellow',
            },
            icon = assets.lsp.warning,
        },
        diagnostic_hints = {
            provider = 'diagnostic_hints',
            hl = {
                fg = 'dragonBlue',
            },
            icon = assets.lsp.hint,
        },
        diagnostic_info = {
            provider = 'diagnostic_info',
            icon = assets.lsp.info,
            hl = {
                fg = 'waveAqua1',
            },
        },
        lsp_load = {
            provider = function()
                local Lsp = vim.lsp.util.get_progress_messages()[1]

                if Lsp then
                    local msg = Lsp.message or ''
                    local percentage = Lsp.percentage
                    if not percentage then
                        return ''
                    end
                    local title = Lsp.title or ''
                    local spinners = {
                        ' ',
                        ' ',
                        ' ',
                    }
                    local success_icon = {
                        ' ',
                        ' ',
                        ' ',
                    }
                    local ms = vim.loop.hrtime() / 1000000
                    local frame = math.floor(ms / 120) % #spinners

                    if percentage >= 70 then
                        return string.format(' %%<%s %s %s (%s%%%%) ', success_icon[frame + 1], title, msg, percentage)
                    end

                    return string.format(' %%<%s %s %s (%s%%%%) ', spinners[frame + 1], title, msg, percentage)
                end

                return ''
            end,
            hl = {
                fg = 'oldWhite',
            },
        },
        position = {
            provider = 'position',
            hl = {
                fg = 'oniViolet',
                style = 'bold',
            },
            left_sep = 'block',
            right_sep = 'block',
        },
        search_count = {
            provider = 'search_count',
            hl = {
                fg = 'autumnYellow',
            },
        },
    }

    local left = {
        c.vim_mode,
        c.separator,
        c.search_count,
        c.fileinfo,
        c.position,
        c.separator,
        c.lsp_load,
    }

    local middle = {
        c.diagnostic_errors,
        c.diagnostic_warnings,
        c.diagnostic_info,
        c.diagnostic_hints,
    }

    local right = {
        c.gitBranch,
        c.gitDiffAdded,
        c.gitDiffRemoved,
        c.gitDiffChanged,
    }

    local components = {
        active = {
            left,
            middle,
            right,
        },
        inactive = {
            left,
            middle,
            right,
        },
    }

    feline.setup {
        components = components,
        theme = kanagawa,
        vi_mode_colors = vi_mode_colors,
    }
end

return M
