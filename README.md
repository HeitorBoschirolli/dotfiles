# Dotfiles


# Sections

* Setting up
* Common Problems


## 1. Setting up


### 1.0 (optional) change the default keyboard settings
* change the keyboard layout to "English (intl, with AltGr dead keys)"
* swap the escape key with the caps lock key (gnome-tweaks should allow that)
* swap the left alt key with the left ctrl key (gnome-tweaks should allow that)
* create a keyboard shortcut for "Switch windows directly" and map it
to Ctrl+Space


### 1.1. Clone this repository
```
$ cd <wherever_you_want_to_store_this>
$ git clone git@github.com:HeitorBoschirolli/dotfiles.git
```


### 1.2 Create a soft link for the bashrc
The general form of the command:
```
$ ln -s <absolute_path_to_dotfiles>/bash/.bashrc $HOME/
```

An example:
```
$ ln -s $HOME/dotfiles/bash/.bashrc $HOME
```

Restart the terminal to apply the changes.


### 1.3. Install neovim
The safest way to install neovim is to follow what's described in
[their documentation](https://github.com/neovim/neovim). Here I will describe
how to do it using an appimage, it always worked fine for me.

Download the appimage of the desired version
[here](https://github.com/neovim/neovim/releases).

Rename it to "nvim"
```
$ mv nvim.appimage nvim
```

Allow it to be executed:
```
$ chmod +x nvim
```

Move it to "/usr/bin" (sudo required)
```
$ sudo mv nvim /usr/bin
```


### 1.4. Install vim-plug (other plugin managers should work fine as well)
Follow the instructions described [here](https://github.com/junegunn/vim-plug).
Be careful not to install it for vim, there's both a vim and a neovim version!


### 1.5. Create a directory for the neovim configuration
```
$ mkdir ~/.config/nvim
```


### 1.6. Create a soft link for the neovim configuration file
The general form of the command:
```
$ ln -s <absolute_path_to_dotfiles>/nvim/init.vim $HOME/.config/nvim/
```

An example:
```
$ ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/
```


### 1.7 Create a soft link for coc-settings.json
The general form of the command:
```
$ ln -s <absolute_path_to_dotfiles>/nvim/coc-settings.json $HOME/.config/nvim/
```

An example:
```
$ ln -s $HOME/dotfiles/nvim/coc-settings.json $HOME/.config/nvim
```


### 1.8 Install xclip
Your system's package manager should have xclip.

An example (Ubuntu 20.04):
```
$ sudo apt update
$ sudo apt-get install xclip
```


### 1.9. Install nodejs
If you use nodejs for development you might prefer to install it via the node
version manager (NVM). The method described here will not use NVM since
it's simpler and I don't use nodejs for development (at least at the time of
writing this).
```
$ curl -sL install-node.now.sh/lts | bash
```
note: restarting the terminal might be necessary

In case of permission problems with npm, do:
```
$ sudo chown $USER <the_directory_with_permission_problems>
```


### 1.10. Install the "neovim" package for nodejs
```
$ npm install -g neovim
```


### 1.11. Install pip
Your system's package manager should contain pip.

An example (Ubuntu 20.04):
```
$ sudo apt install python3-pip
```


### 1.12. Install the "neovim" package for python
```
$ pip3 install neovim
```


### 1.13. Install CoC extensions
From inside of neovim, run:
```
:CocInstall coc-eslint
```
and
```
:CocInstall coc-json
```
and
```
:CocInstall coc-tsserver
```


### 1.11. Install a nerd font
The safest way to install any nerd font is to follow what's described in
[their documentation](https://github.com/ryanoasis/nerd-fonts).
Here I will described a method that worked to install JetBrainsMono at the time
of writing. I think any nerd font will work.

Clone the nerd-fonts repository wherever you want and run the install script:
```
$ cd <wherever_you_want>
$ git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git
$ cd nerd-fonts
$ ./install JetBrainsMono
```


### 1.12. Install tmux
Your system's package manager should have tmux.

An example (Ubuntu 20.04):
```
$ sudo apt update
$ sudo apt-get install tmux
```


### 1.13. Soft link the tmux configuration files
```
$ ln -s <absolute_path_to_dotfiles>/tmux/.tmux.conf $HOME/
$ ln -s <absolute_path_to_dotfiles>/tmux.tmux.conf.local $HOME/
```


### 1.14. Install powerline fonts
The safest way to install the powerline fonts is to follow what's described
[here](https://github.com/powerline/fonts). That should always be up to date.

I never had problems installing it using apt nor dnf:
```
$ sudo apt update
$ sudo apt-get install fonts-powerline
```


### 1.15. Soft link bash_profile
```
$ ln -s <absolute_path_to_dotfiles>/bash/.bash_profile $HOME/
```


## 2. Create a python project using the language server
Depending on what you use to manage the virtual environments some configuration
might change. Here I will describe the step by step to create a python project
using poetry to manage the virtual environments.


### 2.0. Install poetry
Follow the installation instructions from
[poetry's documentation](https://python-poetry.org/docs/)


### 2.1. Create the project
```
$ mkdir demo_project
$ cd demo_project
$ poetry init
```


### 2.2. Add flake8
You can use another linting tool for your project, flake8 is just an example
```
$ poetry add flake8
```


### 2.3. Add the language server
```
$ poetry add --dev python-language-server
```


### 2.4. Install everything into a virtual environment
```
$ poetry install
```

The output from this command will be used in future steps, so we need to save
some info from it. The output should look something like this:
```
Recreating virtualenv pomodorus-zdbNqdz1-py3.6 in <path_to_a_virtual_env>
Installing dependencies from lock file


Package operations: 30 installs, 0 updates, 0 removals

  - Installing markupsafe (1.1.1)
  - Installing zipp (1.2.0)
  - Installing click (7.1.2)
  - Installing importlib-metadata (1.6.1)
  - Installing itsdangerous (1.1.0)
```

The important information is `<path_to_a_virtual_env>`. Store it somewhere.


### 2.5. Configure CoC
Create a directory named `.vim` inside `demo_project/`
```
$ mkdir .vim
```

Open neovim
```
$ nvim
```

Run `:CocLocalConfig`

Use whatever configuration you want. Here's an example:
```
{
    "languageserver": {
        "python": {
            "command": "/home/hboschirolli/.cache/pypoetry/virtualenvs/pomodorus-zdbNqdz1-py3.6/bin/python",
            "args": [
                "-mpyls",
                "-vv",
                "--log-file",
                "/tmp/lsp_python.log"
            ],
            "trace.server": "verbose",
            "filetypes": [
                "python"
            ],
            "settings": {
                "pyls": {
                    "enable": true,
                    "trace": {
                        "server": "verbose"
                    },
                    "commandPath": "",
                    "configurationSources": [
                        "flake8"
                    ],
                    "plugins": {
                        "jedi_completion": {
                            "enabled": true
                        },
                        "jedi_hover": {
                            "enabled": true
                        },
                        "jedi_references": {
                            "enabled": true
                        },
                        "jedi_signature_help": {
                            "enabled": true
                        },
                        "jedi_symbols": {
                            "enabled": true,
                            "all_scopes": true
                        },
                        "mccabe": {
                            "enabled": true,
                            "threshold": 15
                        },
                        "preload": {
                            "enabled": true
                        },
                        "pycodestyle": {
                            "enabled": true
                        },
                        "pydocstyle": {
                            "enabled": false,
                            "match": "(?!test_).*\\.py",
                            "matchDir": "[^\\.].*"
                        },
                        "pyflakes": {
                            "enabled": true
                        },
                        "rope_completion": {
                            "enabled": true
                        },
                        "yapf": {
                            "enabled": false
                        }
                    }
                }
            }
        }
    }
}
```
The important part is
`/home/hboschirolli/.cache/pypoetry/virtualenvs/pomodorus-zdbNqdz1-py3.6/bin/python`
replace it with `<path_to_a_virtual_env>` obtained in a previous step.

Restart neovim


### 2.6. Configure flake8
Any valid configuration will work. As an example you can place the code bellow
in a file named `.flake8`
```
[flake8]
max-line-length = 80

# ignored rules:
# W503: Line break occurred before a binary operator. This goes against PEP8.
# C901: Function is too complex. I just don't care whether the function have
# too many ifs.
ignore = W503, C901

# count the number of occurrences of each error/warning code and print a report
statistics = true

# print the source code generating the error/warning in question
show-source = true
```

With this the CoC linter should work in your project


## Common Problems


### [vista.vim] Error when calling CocActionAsync...
This happens when CoC (os vista, idk) tries to load a language server for
an invalid filetype. There's no harm caused by this error message.
