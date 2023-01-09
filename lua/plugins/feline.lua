local M = {
    'feline-nvim/feline.nvim',
    event = 'VeryLazy',
}

function M.config()
    local feline = require 'feline'
    local rose_pine = {
        base = '#191724',
        surface = '#1f1d2e',
        bg = '#1f1d2e',
        overlay = '#26233a',
        muted = '#6e6a86',
        subtle = '#908caa',
        text = '#e0def4',
        fg = '#e0def4',
        love = '#eb6f92',
        gold = '#f6c177',
        rose = '#ebbcba',
        pine = '#31748f',
        foam = '#9ccfd8',
        iris = '#c4a7e7',
        highlight_low = '#21202e',
        highlight_med = '#403d52',
        highlight_high = '#524f67',
        none = 'NONE',
    }

    local assets = {
        file = '  ',
        lsp = {
            server = '  ',
            error = '  ',
            warning = '  ',
            info = '  ',
            hint = '  ',
        },
        git = {
            branch = '   ',
            added = '   ',
            changed = '   ',
            removed = '   ',
        },
    }

    local vi_mode_colors = {
        NORMAL = 'rose',
        OP = 'foam',
        INSERT = 'foam',
        VISUAL = 'iris',
        LINES = 'iris',
        BLOCK = 'iris',
        REPLACE = 'love',
        COMMAND = 'gold',
    }

    local c = {
        vim_mode = {
            provider = {
                name = 'vi_mode',
                opts = {
                    show_mode_name = true,
                    padding = 'center', -- Uncomment for extra padding.
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
                fg = 'rose',
                bg = 'overlay',
            },
            left_sep = 'block',
            right_sep = 'block',
            icon = assets.git.branch,
        },
        gitDiffAdded = {
            provider = 'git_diff_added',
            hl = {
                fg = 'foam',
                bg = 'overlay',
            },
            left_sep = 'block',
            right_sep = 'block',
            icon = assets.git.added,
        },
        gitDiffRemoved = {
            provider = 'git_diff_removed',
            hl = {
                fg = 'love',
                bg = 'overlay',
            },
            left_sep = 'block',
            right_sep = 'block',
            icon = assets.git.removed,
        },
        gitDiffChanged = {
            provider = 'git_diff_changed',
            hl = {
                fg = 'fg',
                bg = 'overlay',
            },
            left_sep = 'block',
            right_sep = 'right_filled',
            icon = assets.git.changed,
        },
        separator = {
            provider = '',
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
        },
        diagnostic_errors = {
            provider = 'diagnostic_errors',
            hl = {
                fg = 'love',
            },
            icon = assets.lsp.error,
        },
        diagnostic_warnings = {
            provider = 'diagnostic_warnings',
            hl = {
                fg = 'rose',
            },
            icon = assets.lsp.warning,
        },
        diagnostic_hints = {
            provider = 'diagnostic_hints',
            hl = {
                fg = 'pine',
            },
            icon = assets.lsp.hint,
        },
        diagnostic_info = {
            provider = 'diagnostic_info',
            icon = assets.lsp.info,
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
                fg = 'rose',
            },
        },
        lsp_client_names = {
            provider = 'lsp_client_names',
            hl = {
                fg = 'iris',
                bg = 'overlay',
                style = 'bold',
            },
            left_sep = 'left_filled',
            right_sep = 'block',
        },
        file_type = {
            provider = {
                name = 'file_type',
                opts = {
                    filetype_icon = true,
                    case = 'titlecase',
                },
            },
            hl = {
                fg = 'love',
                bg = 'overlay',
                style = 'bold',
            },
            left_sep = 'block',
            right_sep = 'block',
        },
        file_encoding = {
            provider = 'file_encoding',
            hl = {
                fg = 'gold',
                bg = 'overlay',
                style = 'italic',
            },
            left_sep = 'block',
            right_sep = 'block',
        },
        position = {
            provider = 'position',
            hl = {
                fg = 'foam',
            },
            left_sep = 'block',
            right_sep = 'block',
        },
        line_percentage = {
            provider = 'line_percentage',
            hl = {
                fg = 'pine',
                bg = 'overlay',
                style = 'bold',
            },
            left_sep = 'block',
            right_sep = 'block',
        },
        scroll_bar = {
            provider = 'scroll_bar',
            hl = {
                fg = 'rose',
                style = 'bold',
            },
        },
    }

    local left = {
        c.vim_mode,
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
        -- c.lsp_client_names,
        -- c.file_type,
        -- c.file_encoding,
        c.gitBranch,
        c.gitDiffAdded,
        c.gitDiffRemoved,
        c.gitDiffChanged,
        -- c.line_percentage,
        -- c.scroll_bar,
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
        theme = rose_pine,
        vi_mode_colors = vi_mode_colors,
    }
end

return M
