return {
  {
    'tyru/open-browser-github.vim',
    enabled = false,
    lazy = true,
    cmd = {
     'OpenBrowser',
     'OpenBrowserSearch',
     'OpenBrowserSmartSearch',
     'OpenGithubCommit',
     'OpenGithubFile',
     'OpenGithubIssue',
     'OpenGithubProject',
     'OpenGithubPullReq',
    },
    dependencies = {
      'tyru/open-browser.vim',
    },
  },
  {
    'tyru/open-browser.vim',
    enabled = false,
  }
}
