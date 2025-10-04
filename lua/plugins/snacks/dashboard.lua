return {
    width = 72,
    sections = {
        {padding = 1}, {
            section = 'terminal',
            align = 'center',
            cmd = 'printf "%*s\n" $(((72 + $(echo "[ $(whoami)@$(hostname) ]" | wc -c)) / 2)) "[ $(whoami)@$(hostname) ]"',
            hl = 'neon',
            padding = 0,
            height = 2
        }, {
            section = 'terminal',
            align = 'center',
            cmd = 'chafa ~/.config/nvim/lua/plugins/snacks/holyspirit.png --format symbols --symbols quad --stretch --size 72x14 --center on --speed 11',
            height = 14,
            padding = 1
        }, {
            align = 'center',
            padding = 1,
            text = {
                {'  [u]pdate ', hl = 'Label'},
                {'  [f]iles ', hl = 'DiagnosticInfo'},
                {'  [g]rep ', hl = '@property'},
                {'  [l]ast session ', hl = 'Number'},
                {'  [m]ason ', hl = '@string'}, {'  [c]onfig '}
            }
        }, {title = '[p]rojects', section = 'projects', padding = 1},
        {title = '[r]ecent', section = 'recent_files', limit = 3}, {
            section = "terminal",
            enabled = function() return Snacks.git.get_root() ~= nil end,
            cmd = "echo '' && echo ' git status' && echo '' && git --no-pager diff --stat -B -M -C",
            hl = "Statement",
            height = 5,
            padding = 1
        },
        {
            text = {'[q]uit', hl = 'DiagnosticError'},
            align = 'center',
            padding = 1
        }, {text = '', action = ':Lazy update', key = 'u'}, {
            text = '',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            key = 'c'
        }, {text = '', action = ':Mason', key = 'm'},
        {text = '', action = ':Telescope find_files cwd=~/', key = 'f'}, {
            text = '',
            action = ':lua require("persistence").load({ last = true })',
            key = 'l'
        },
        {
            text = '',
            action = ":Telescope find_files cwd=~/nolife/projects",
            key = 'p'
        }, {text = '', action = ":Telescope oldfiles", key = 'r'},
        {text = '', action = ':Telescope live_grep', key = 'g'},
        {text = '', action = ':qa!', key = 'q'}
    }
}
