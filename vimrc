"
" ~/.vim/vimrc
"

runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme solarized

call togglebg#map('<F5>')

augroup configgroup
  autocmd!
  autocmd BufNewFile,BufRead *.ejs set filetype=html
  autocmd FileType css set tabstop=2 shiftwidth=2
  autocmd FileType gitcommit set colorcolumn+=51 textwidth=72
  " https://csswizardry.com/2017/03/configuring-git-and-vim/#update-2017-04-09
  autocmd FileType html set tabstop=2 shiftwidth=2
  autocmd FileType ruby set tabstop=2 shiftwidth=2
augroup END

set background=dark                   " "dark" or "light"; the background color brightness
set colorcolumn=+1                    " columns to highlight
set expandtab                         " expand <Tab> to spaces in Insert mode
set list                              " show <Tab> as ^I and end-of-line as $
set listchars=tab:»-,trail:·,eol:¬    " list of strings used for list mode
    " https://csswizardry.com/2017/05/writing-tidy-code/#invisibles
set nowrap                            " turn off line wrap
set number                            " show the line number for each line
set shiftwidth=4                      " number of spaces used for each step of (auto)indent
set tabstop=4                         " number of spaces a <Tab> in the text stands for
set textwidth=80                      " line length above which to break a line

function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction
:noremap <Leader>w :call TrimWhitespace()<CR>
" https://vi.stackexchange.com/a/456

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
" https://vim.fandom.com/wiki/Switching_case_of_characters#Twiddle_case

