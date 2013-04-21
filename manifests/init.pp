# Installs vim and vim-pathogen
# This class require that you're .vimrc is managed by puppet

# Examples
#
#   include vim
#   vim::bundle { 'syntastic':
#     source => 'scrooloose/syntastic',
#   }
#
class vim {

  package { 'vim':
    require => Package['mercurial']
  }
  # Install mercurial since the vim brew package don't satisfy the requirement
  package { 'mercurial': }

  file { ["/Users/${::boxen_user}/.vim",
    "/Users/${::boxen_user}/.vim/autoload",
    "/Users/${::boxen_user}/.vim/bundle"]:
    ensure  => directory,
    recurse => true,
  }

  repository { "/Users/${::boxen_user}/.vim/vim-pathogen":
    source => 'tpope/vim-pathogen'
  }

}
