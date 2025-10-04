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
        }, {
            icon = '󰏓 ',
            title = 'projects',
            section = 'projects',
            indent = 2,
            padding = 1
        }, {
            icon = '',
            title = 'recent',
            section = 'recent_files',
            indent = 2,
            padding = 1
        }, {
            icon = " ",
            title = "git status",
            cmd = "git --no-pager diff --stat -B -M -C",
            height = 10
        }, {text = {'[q]uit', hl = 'brightred'}, align = 'center', padding = 1},
        {text = '', action = ':Lazy update', key = 'u'}, {
            text = '',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            key = 'c'
        }, {text = '', action = ':Mason', key = 'm'},
        {text = '', action = ':Telescope find_files cwd=~/', key = 'f'}, {
            text = '',
            action = ':lua require("persistence").load({ last = true })',
            key = 'l'
        }, {text = '', action = ':Telescope live_grep', key = 'g'},
        {text = '', action = ':qa!', key = 'q'}
    }
}
