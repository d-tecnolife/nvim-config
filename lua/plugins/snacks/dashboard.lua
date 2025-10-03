return {
  width = 72,
  sections = {
    {
      section = 'terminal',
      align = 'center',
      cmd = 'chafa /home/russell/Pictures/hardaf-padded.png --format symbols --size 18x14 --center on --speed 11',
      height = 12,
    },
    {
      align = 'center',
      padding = 1,
      text = {
        { '  [u]pdate ', hl = 'Label' },
        { '  [s]essions ', hl = '@property' },
        { '  [l]ast session ', hl = 'Number' },
        { '  [f]iles ', hl = 'DiagnosticInfo' },
        { '  [m]ason ', hl = '@string' },
      },
    },
    { section = 'startup', padding = 1 },
    { icon = '󰏓 ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
    { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
    { text = '', action = ':Lazy update', key = 'u' },
    { text = '', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", key = 'c' },
    { text = '', action = ':Mason', key = 'm' },
    { text = '', action = ':Telescope find_files', key = 'f' },
    { text = '', action = ':lua require("persistence").load({ last = true })', key = 'l' },
    { text = '', action = ':lua require("persistence").select()', key = 's' },
  },
}
