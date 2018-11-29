" forces true colour on, since vim can’t detect it within tmux. 
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set shell=/bin/bash
set encoding=UTF-8

"-------------------------------
"       Vundle
"-------------------------------
set nocompatible
set ttyfast
" set lazyredraw
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
" Plugin 'skammer/vim-css-color'  " too slow in tmux
Plugin 'tpope/vim-markdown'
" Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
" Plugin 'groenewege/vim-less'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'mitechie/pyflakes-pathogen'
" Plugin 'fs111/pydoc.vim'
" Plugin 'klen/python-mode'
Plugin 'rstacruz/sparkup'
Plugin 'corntrace/bufexplorer'

Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'Townk/vim-autoclose'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'https://github.com/wannesm/wmgraphviz.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'

" Track ultisnips engine
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" vim-scripts repos
Plugin 'L9'
Plugin 'closetag.vim'
Plugin 'tComment'
" Plugin 'pep8'
Plugin 'EasyGrep'
Plugin 'matchit.zip'
Plugin 'mru.vim'
Plugin 'loremipsum'

Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim'
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 12 "The comment brightness can be increased by 1 - 20
let g:nord_cursor_line_number_background = 1

" Use forked version of solarized colors with fixes for git gutters
" Plugin 'abuecker/vim-colors-solarized'

Plugin 't9md/vim-chef'
Plugin 'dag/vim-fish'

"tern for intelligent js completion
" Plugin 'marijnh/tern_for_vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
" Plugin 'rizzatti/dash.vim' 
" Plugin 'Valloric/YouCompleteMe'

" Toggle split fullscreen
" Plugin 'vim-scripts/ZoomWin'
" Plugin 'Hydrotoast/vim-gss'

Plugin 'terryma/vim-expand-region'

Plugin 'itchyny/lightline.vim'

Plugin 'b4b4r07/vim-hcl'
Plugin 'fatih/vim-go'
" Plugin 'Yggdroot/indentLine'
" let mapleader='\<Space>'

" Plugin 'vimwiki/vimwiki'
" Plugin 'tbabej/taskwiki'
Plugin 'powerman/vim-plugin-AnsiEsc'
" Plugin 'blindFS/vim-taskwarrior'

Plugin 'direnv/direnv.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'Glench/Vim-Jinja2-Syntax'

Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-vagrant'

Plugin 'digitaltoad/vim-pug'

Plugin 'ruanyl/vim-fixmyjs'
Plugin 'tpope/vim-obsession'
Plugin 'styled-components/vim-styled-components'
Plugin 'cespare/vim-toml'

" Icons and colors
Plugin 'ryanoasis/vim-devicons'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#528AB3",  
    \ "Staged"    : "#538B54",  
    \ "Untracked" : "#BE5849",  
    \ "Dirty"     : "#299999",  
    \ "Clean"     : "#87939A"   
    \ } 

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

" Highlight full name (not only icons).
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

Plugin 'prettier/vim-prettier'
Plugin 'flowtype/vim-flow'
let g:flow#autoclose = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ------------
" Vim options
" ------------
set history=1000      " Store lots of :cmdline history
set showcmd           " show incomplete cmds down the bottom
set showmode          " show current mode down the bottom
set incsearch         " find the next match as we type the search
set hlsearch          " hilight searches by default
set wrap              " dont wrap lines
set linebreak         " wrap lines at convenient points
set nobackup          " no backup
set noswapfile        " no swap files
set hidden            " hide buffers when not displayed
syntax enable         " switch on syntax highlighting
set background=dark   " use dark soloarized theme
colorscheme nord " set the color scheme
highlight Comment cterm=italic
set cursorline        " highlight the current line
set number            " show line numbers
set showmatch         " jump to the matching brace when you insert one
set ruler             " Display ruler
set tabstop=2         " default tabwidth
set softtabstop=2     " default tab width in insert mode
set shiftwidth=2      " default indent
set expandtab         " expand tabs to spaces
set backspace=2       " make backspace work like most other app
set noerrorbells visualbell " disable the bell
set clipboard+=unnamed      " share clipboard with windows clipboard

"display tabs and trailing spaces
set list listchars=tab:➠\ ,trail:⋅,nbsp:⋅

" status line not in use with Powerline
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
" \ [%l/%L\ (%p%%)

" clear search
nmap <leader>\ :noh<return><esc>

" folding
nnoremap <space> za
vnoremap <space> zf

"jsbeautify
map <c-f> :call JsBeautify()<cr>

" Map .jake to javascript
au BufNewFile,BufRead *.jake set filetype=javascript

" copy/paste
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <D-v> :call setreg("\"",system("pbpaste"))<CR>p

" Unfold all by default
au BufRead * normal zR

" set the raml files to use yaml syntax highlighting
autocmd! BufNewFile,BufRead *.raml set filetype=yaml foldmethod=indent

"----------------------------------------
" highlight content over 80 columns
"----------------------------------------
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"----------------------------------------
" set the cursor shape for terminal editing
"----------------------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Insert Mode cursor in tmux to vertical line
if $TMUX != ''
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

"------
" Ruby
"------
au FileType ruby,eruby set ts=2 st=2
map <leader>r :!ruby %<cr> " execute ruby

" ---------
" Python
" ---------
let python_highlight_all = 1
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
au FileType py set softtabstop=4
au FileType py set tabstop=4
au FileType py set backspace=4
map <leader>p :!python %<cr> " run python

" ---------
" Javascript
" ---------
au FileType js,jsx set ts=2 st=2

"---------
" node.js
"---------
" map <leader>j :!node %<cr>
" map <leader>t :!mocha -R spec --no-colors %<cr>

" -----------
" Git Gutter
" -----------
highlight clear SignColumn

" -------------------------
" html syntax completion
" -------------------------
let g:user_emmet_leader_key='<C-Z>'

" ---------------------
" Integrate with Dash
" ---------------------
:nmap <silent> <leader>d <Plug>DashSearch

" -----------
" React JSX
" -----------
let g:jsx_ext_required = 0  " JSX in .js files

"-------------------------------
"     Powerline
"-------------------------------
" set laststatus=2
" set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
" set encoding=utf-8
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"----------------------------------
" Font
"----------------------------------
if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
else
    "some stuff to get the mouse going in term
    set mouse=a
    if !has('nvim')
      set ttymouse=xterm2
    endif
    "tell the term has 256 colors
    set t_Co=256
endif


"------------------------
" NERD_tree config
"------------------------
" let NERDTreeHighlightCursorline=1
" let NERDTreeChDirMode=0
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '^_.+[[dir]]', '^dist$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>
map <leader>e   :NERDTreeToggle<CR>
let NERDTreeMapOpenVSplit='<leader>v'
let NERDTreeMapOpenSplit='s'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"----------
" Tagbar
"----------
" let g:tagbar_ctags_bin='/usr/local/bin/ctags'
" let g:tagbar_sort = 0
" let g:tagbar_foldlevel = 0
" let g:tagbar_iconchars = ['▸', '▾']
" let g:tagbar_compact = 1
" map <F7> :TagbarToggle<CR>
"
" " markdown
" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"         \ 'h:Heading_L1',
"         \ 'i:Heading_L2',
"         \ 'k:Heading_L3'
"     \ ]
" \ }

"-----------------------------
" Diff the current buffer with saved on disc
"-----------------------------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"-----------------------------
" Swap buffer contents
"-----------------------------
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

" \mw marks split, \pw in pane to swap with
nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

"------------------------------------------------
" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
"------------------------------------------------
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"------------------------------------
"spell check when writing commit logs
"------------------------------------
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell


"--------------------------------------------------
" search and replace with selected text
"--------------------------------------------------
vnoremap <leader>s "hy:%s/<C-r>h/<C-r>h/g<left><left>
vnoremap <leader>n "hy/<C-r>h<CR>
noremap  <leader>st "hy:%s/\t/    /g
noremap  <leader>se "hy:%s/\s\+$//g

"------------------------------
" javascript libs
"------------------------------
let g:used_javascript_libs = 'react'

"----------------------------------------
" Ultisnip
"----------------------------------------
let g:UltiSnipsSnippetDirectories=["~/.vim/ab_snips"]
let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsJumpForwardTrigger='<C-tab>'
" let g:UltiSnipsJumpBackwardTrigger='<C-S-tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit="horizontal"

"----------------------------------------
" Syntastic
"----------------------------------------
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" let g:syntastic_auto_loc_list=1
let g:syntastic_html_checkers=['tidy']
let g:syntastic_html_tidy_ignore_errors = [
    \ 'proprietary attribute',
    \ 'trimming empty',
    \ 'is not recognized',
    \ 'discarding unexpected',
    \ '<script> escaping malformed URI reference'
    \ ]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers            = ['mri']
" let g:syntastic_python_checkers          = ['pylint']
let g:syntastic_javascript_checkers      = ['eslint']
" let g:syntastic_javascript_checkers      = ['jshint']
" let g:syntastic_javascript_checkers      = ['eslint', 'jshint']

"----------------------------------------
" Tabularize
"----------------------------------------
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif


"----------------------------------------
" Pangloss javascript options
"----------------------------------------
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_plugin_jsdoc = 1
set foldmethod=syntax " Please note this can have a dramatic effect on performance
let g:javascript_plugin_flow = 1

"----------------------------------------
" YouCompleteMe
"----------------------------------------
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

"----------------------------------------
" Hexmode
"----------------------------------------
nnoremap <leader>h :Hexmode<CR>
inoremap <leader>h <Esc>:Hexmode<CR>
vnoremap <leader>h :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" ----------------------------------
" Check for file changes on disk
" ----------------------------------
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

" Options
let autoreadargs={'autoread':1}
" Startup autoread silently
silent! execute WatchForChanges("*",autoreadargs)

" expand region configuration
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightLineFugitive',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
function! LightLineFugitive()
  return exists('*fugitive#head') ? printf("\ue0a0 %s", fugitive#head()) : ''
endfunction

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Remap arrow keys
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" Omni Complete
set omnifunc=syntaxcomplete#Complete

" ctrl p
let g:ctrlp_map = '<c-P>'
let g:ctrlp_cmd = 'CtrlP'
" set wildignore+=*/node_modules/*
" let g:ctrlp_custom_ignore = '(\.git|node_modules)$'
let g:ctrlp_custom_ignore = '\v[\/]\.?(git|node_modules|stud_modules|dist|wercker|direnv\..+)$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
let g:ctrlp_show_hidden = 1

" TODO list
command! Todo noautocmd vimgrep /TODO\|FIXME/j src/** | cw

" Wiki
let g:vimwiki_list = [{'path': '~/Dropbox\ \(Personal\)/vimwiki/wiki', 'path_html': '~/Dropbox\ \(Personal\)/vimwiki/html'}]

"Go
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Fixmyjs
let g:fixmyjs_rc_filename = ['.eslintrc', '.eslintrc.json']
let g:fixmyjs_rc_local = 1
noremap <Leader><Leader>f :Fixmyjs<CR>

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Yapf
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
autocmd BufWritePre *.py 0,$!yapf

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
