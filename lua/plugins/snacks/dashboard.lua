return {
    width = 72,
    sections = {
        {padding = 1}, {text = {'[ hardaf ]', hl = 'neon'}, align = 'center'},
        {
            section = 'terminal',
            align = 'center',
            cmd = 'chafa /home/russell/Pictures/hardaf-padded.png --format symbols --stretch --size 20x10 --center on --speed 11',
            height = 10
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
