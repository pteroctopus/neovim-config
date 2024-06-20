--[[ Additional filetypes ]]
vim.filetype.add({
  pattern = {
    -- Automatically set filetype yaml.ansible to files matching patterns
    ['.*/tasks/.*.yml']               = 'yaml.ansible',
    ['.*/tasks/.*.yaml']              = 'yaml.ansible',
    ['.*/handlers/.*.yml']            = 'yaml.ansible',
    ['.*/handlers/.*.yaml']           = 'yaml.ansible',
    ['.*/.*role.*/test.yml']          = 'yaml.ansible',
    ['.*/.*role.*/test.yaml']         = 'yaml.ansible',
    ['.*/.*role.*/playbook.yml']      = 'yaml.ansible',
    ['.*/.*role.*/playbook.yaml']     = 'yaml.ansible',
    ['.*/.*play.*/playbook.yml']      = 'yaml.ansible',
    ['.*/.*play.*/playbook.yaml']     = 'yaml.ansible',
    ['.*/.*role.*/.*deployment.yml']  = 'yaml.ansible',
    ['.*/.*role.*/.*deployment.yaml'] = 'yaml.ansible',

    -- Detect kubernetes configs as yaml
    ['.*/.kube/config']         = 'yaml',
    ['.*/.kube/configs/.*.yml'] = 'yaml',
  }
})
