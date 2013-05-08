" Vim file plugin
" This is my first attempt at a ftplugin file.  Feel free to send me
" corrections or improvements.  I'll give you a credit.
"
" USAGE
" There is already a vim file that uses 'cf' as a file extension.  You can use
" cf3 for your cf3 file extensions or identify via your vimrc file:
" au BufRead,BufNewFile *.cf set ft=cf3

" Check to see if DisableCF3Ftplugin is defined
" If you only want the syntax plugin add "let g:DisableCF3Ftplugin=1" in
" ~/.vimrc
if exists("g:DisableCF3Ftplugin")
    finish
endif


" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" =============== Keyword Abbreviations  ===============
" disable keyword abbreviations with by adding 
" "let g:DisableCFE3KeywordAbbreviations=0" to your vimrc
" Convenience function ToggleCFE3KeywordAbbreviations
" mapped to ,i by default to toggle abbreviations off or on
"
function! EnableCFE3KeywordAbbreviations()
    iab <buffer> = =>
    iab <buffer> ba bundle agent
    iab <buffer> bc bundle common
    iab <buffer> bu bundle
    iab <buffer> cano canonify( "<C-R>=Eatchar('\s')<CR>
    iab <buffer> cla classes:
    iab <buffer> comma commands:
    iab <buffer> comme comment => "<C-R>=Eatchar('\s')<CR>
    iab <buffer> exp expression => <C-R>=Eatchar('\s')<CR>
    iab <buffer> fil files:
    iab <buffer> han handle => "<C-R>=Eatchar('\s')<CR>
    iab <buffer> ifv ifvarclass => <C-R>=Eatchar('\s')<CR>
    iab <buffer> met methods:
    iab <buffer> pro processes:
    iab <buffer> rep reports:
    iab <buffer> sli slist => {
    iab <buffer> str string => "<C-R>=Eatchar('\s')<CR>
    iab <buffer> sysw ${sys.workdir}
    iab <buffer> ub usebundle =>
    iab <buffer> var vars:
    echo "CFEngine 3 Keyword Abbreviations enabled"
endfunction

function! DisableCFE3KeywordAbbreviations()
     iunab <buffer> =
     iunab <buffer> ba
     iunab <buffer> bc
     iunab <buffer> bu
     iunab <buffer> cano
     iunab <buffer> cla
     iunab <buffer> comma
     iunab <buffer> comme
     iunab <buffer> exp
     iunab <buffer> fil
     iunab <buffer> han 
     iunab <buffer> ifv
     iunab <buffer> met
     iunab <buffer> pro
     iunab <buffer> rep
     iunab <buffer> sli
     iunab <buffer> str
     iunab <buffer> sysw
     iunab <buffer> ub
     iunab <buffer> var
    echo "CFEngine 3 Keyword Abbreviations disabled"
endfunction

" Default abbreviations on
" to disable let g:DisableCFE3KeywordAbbreviations=1 in ~/.vimrc
if !exists('g:DisableCFE3KeywordAbbreviations')
    let b:DisableCFE3KeywordAbbreviations=1
    call EnableCFE3KeywordAbbreviations()
endif

function! ToggleCFE3KeywordAbbreviations()
    if !exists('b:DisableCFE3KeywordAbbreviations')
        let b:DisableCFE3KeywordAbbreviations=1
        call EnableCFE3KeywordAbbreviations()
    else
        unlet b:DisableCFE3KeywordAbbreviations
        call DisableCFE3KeywordAbbreviations()
    endif
endfunction

function! EnableCFE3PermissionFix()
" On Save set the permissions of the edited file so others can't access
    :autocmd BufWritePost *.cf silent !chmod o-rwx %
endfunction

" Default permission fix on
" To disable permission fixing in your main .vimrc
" let g:DisableCFE3PermissionFix=0
if !exists('g:DisableCFE3PermissionFix')
    let g:DisableCFE3PermissionFix=1
    call EnableCFE3PermissionFix()
endif

" maps
" Toggle KeywordAbbreviations
nmap <buffer> ,i :call ToggleCFE3KeywordAbbreviations()<CR>
" Wrap WORD in double quotes
nmap <buffer> ,q dE<ESC>i"<ESC>pa"<ESC>
" Insert blank promise
nmap <buffer> ,p o""<CR><TAB>handle => "",<CR>comment => ""<ESC>
" quote list items
vmap <buffer> ,q :s/^\s*\(.*\)\s*$/"\1",/g<CR>
" Insert whole self contained skeleton
nmap <buffer> ,k Obody common control
\<CR>{
\<CR>
\<CR>bundlesequence => {
\<CR>"main",
\<CR>};
\<CR>
\<CR>inputs => {
\<CR>"cfengine_stdlib.cf",
\<CR>};
\<CR>}
\<CR>
\<CR>bundle agent main
\<CR>{
\<CR>
\<CR>methods:
\<CR>
\<CR><TAB>"any" usebundle => test;
\<CR>
\<CR>}
\<CR>
\<CR>bundle agent test
\<CR>{
\<CR>
\<CR>}<ESC>

" Function to align groups of => assignment lines.
" Credit to 'Scripting the Vim editor, Part 2: User-defined functions'
" by Damian Conway
" http://www.ibm.com/developerworks/linux/library/l-vim-script-2/index.html
if !exists("*CF3AlignAssignments")
function CF3AlignAssignments (AOP)
    "Patterns needed to locate assignment operators...
    if a:AOP == 'vars'
       let ASSIGN_OP   = '\(string\|int\|real\|slist\|ilist\|rlist\|expression\|and\|or\|not\|volume\)*\s\+=>'
    else
       let ASSIGN_OP   = '=>'
    endif
    let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

    "Locate block of code to be considered (same indentation, no blanks)
    let indent_pat = '^' . matchstr(getline('.'), '^\s*') . '\S'
    let firstline  = search('^\%('. indent_pat . '\)\@!','bnW') + 1
    let lastline   = search('^\%('. indent_pat . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif

    "Find the column at which the operators should be aligned...
    let max_align_col = 0
    let max_op_width  = 0
    for linetext in getline(firstline, lastline)
        "Does this line have an assignment in it?
        let left_width = match(linetext, '\s*' . ASSIGN_OP)

        "If so, track the maximal assignment column and operator width...
        if left_width >= 0
            let max_align_col = max([max_align_col, left_width])

            let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
            let max_op_width  = max([max_op_width, op_width+1])
         endif
    endfor

    "Code needed to reformat lines so as to align operators...
    let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
    \                                    max_op_width,  submatch(2))'

    " Reformat lines with operators aligned in the appropriate column...
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
        call setline(linenum, newline)
    endfor
endfunction
endif

nmap <buffer> <silent>  ,=  :call CF3AlignAssignments("null")<CR>
nmap <buffer> <silent>  <ESC>=  :call CF3AlignAssignments("vars")<CR>

" For pasting code snippets
function! Pastefile( FILE )
        let arg_file = $HOME."/.vim/snippets/".a:FILE
        let @" = join( readfile( arg_file ), "\n" )
        put 
        return ""
endfunction

imap <buffer> //tmp <c-r>=Pastefile( "template.cf" )<CR><ESC>A

" TODO
" Folding
" Indents

" CREDITS
" Neil Watson <neil@watson-wilson.ca>
" Other Cfengine information: http://watson-wilson.ca/cfengine/
"
" CHANGES
" Wednesday January 09 2013 
" Operator alignment now works for just '=>' with ',=' or 'string, stlist ,etc
" and => ' with '<ESC>='
"
" Wednesday October 05 2011
" - Added comment and handle abbs.  Assumes you have the Eatchar and Getchar
" functions.
" - Can now wrap words and lists in quotes.
" - Insert blank promises (,p)
" - Insert blank testing skeleton (,k)
"
" CHANGES
" Monday November 21 2011
" - IAB's for string, slist and usebundle.

" CHANGES
" Fri Apr 27 2012
" Added function to align assigment operators

" vim_cf3 files (https://github.com/neilhwatson/vim_cf3)
" Copyright (C) 2011 Neil H. Watson <neil@watson-wilson.ca>
" 
" This program is free software: you can redistribute it and/or modify it under
" the terms of the GNU General Public License as published by the Free Software
" Foundation, either version 3 of the License, or (at your option) any later
" version.
" 
" This program is distributed in the hope that it will be useful, but WITHOUT ANY
" WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
" PARTICULAR PURPOSE.  See the GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License along with
" this program.  If not, see <http://www.gnu.org/licenses/>.
