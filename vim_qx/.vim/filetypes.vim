
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
endif " has("autocmd")

if has('autocmd')
	" when event "set filetype" occurs (see :help filetype)
	autocmd FileType sh call ShellDetected()
	autocmd Filetype cpp call CppDetected()
	autocmd Filetype perl call PerlDetected()
	autocmd Filetype awk call AwkDetected()
	autocmd Filetype tex call TeXDetected()
	autocmd Filetype bib call BibDetected()
	autocmd Filetype dot call DotDetected()
	autocmd Filetype make colorscheme zellner
endif

"=================================================
" C++
"=================================================
func CppDetected()
	" tag
	nnoremap ~ :TlistToggle<CR>
	nnoremap ` <C-W>w
	map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

	" compile
	nmap <F9> :w<CR> :make SKIPROOTCHECK=yes %:r.o<CR>
	nmap <F10> :w<CR> :make SKIPROOTCHECK=yes<CR>
	nmap <F11> :w<CR> :make SKIPROOTCHECK=yes clean<CR> :!make SKIPROOTCHECK=yes<CR>
	nmap <F2> :cc<CR>
	nmap <F3> :cp<CR>
	nmap <F1> :cn<CR>

	" folder
	if !&diff
		set fdm=indent
		set fdl=2
		set fml=3
		" set fdc=3
	endif

	" auto change to the path
	set autochdir
endfunc

"=================================================
" Shell
"=================================================
func ShellDetected()
	nnoremap <F9> :w<CR> :!sh %<CR>
endfunc

"=================================================
" perl
"=================================================
func PerlDetected()
	"<F1> == see perldoc for current word under cursor
	map <F1> :call PerlDoc(expand("<cword>"))<CR>

	"<F7> for perl debugging
	"map <F7> :w<CR>:!perl -wd "%"<CR>
	"<F8> for perl syntax checking (autosave first)
	map <F7> :w<CR>:!perl -wc "%"<CR>
	"<F9> to run by perl (autosave first) "",'' are both ok
	map <F9> :w<CR>:!perl "%"<CR>
	" set dictionary for perl keywords completion
	set dictionary=$HOME/.perl.dictionary
endfunc

func PerlDoc(keyword)
	if a:keyword=~"::"
		"module name;
		exec ':!perldoc '.a:keyword
	elseif a:keyword=~"^perl"
		"perl pod
		exec ':!perldoc '.a:keyword
	else
		"perl function
		exec ':!perldoc -f '.a:keyword
	endif
endfunc

"=================================================
" Awk
"=================================================
func AwkDetected()
	map <F7> :w<CR>
endfunc

"=================================================
" Graphviz
"=================================================
func DotDetected()
	map <F9> :w<CR> :!dot -Tjpg -o %:r.jpg "%"<CR>
	set wrap
endfunc

"=================================================
" LaTeX
"=================================================
func TeXDetected()
	map <F9> :w<CR> :!latex "%"<CR>
	map <F12> :w<CR> :!latex "%"<CR>:!latex "%"<CR>

	set wrap
endfunc

func BibDetected()
	set nowrap
	set nonu
endfunc

"=================================================
" auto file syntax
"=================================================
" autocmd BufEnter * call DoWordComplete()

au BufNewFile,BufRead *.cct
			\ setf cpp

au BufNewFile,BufRead *.nscp
			\ if exists("cynlib_syntax_for_cpp")|setf cynlib|else|setf cpp|endif

au BufNewFile,BufRead *.nsch
			\ if exists("c_syntax_for_h") | setf c |
			\ elseif exists("ch_syntax_for_h") | setf ch |
			\ else | setf cpp | endif

au BufNewFile,BufRead *.sv setf verilog


