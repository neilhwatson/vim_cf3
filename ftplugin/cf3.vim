" Vim file plugin
" Language:     Cfengine version 3
" Maintainer:   Neil Watson <neil@watson-wilson.ca>
" Last Change:  Fri Apr 27 2012
" Location:
"
" This is my first attempt at a syntax file.  Feel free to send me correctsion
" or improvements.  I'll give you a credit.
"
" USAGE
" There is already a vim file that uses 'cf' as a file extension.  You can use
" cf3 for your cf3 file extensions or identify via your vimrc file:
" au BufRead,BufNewFile *.cf set ft=cf3

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Abbreviations
iab = =>
iab bu bundle
iab han handle => "<C-R>=Eatchar('\s')<CR>
iab cla classes:
iab comma commands:
iab comme comment => "<C-R>=Eatchar('\s')<CR>
iab fil files:
iab met methods:
iab pro processes:
iab rep reports:
iab var vars:
iab ba bundle agent
iab bc bundle common
iab ub usebundle =>
iab str string =>
iab sli slist =>

" maps
" Wrap WORD in double quotes
nmap ,q dE<ESC>i"<ESC>pa"<ESC>
" Insert blank promise
nmap ,p o""<CR><TAB>handle => "",<CR>comment => ""<ESC>
" quote list items
vmap ,q :s/^\s*\(.*\)\s*$/"\1",/g<CR>
" Insert whole self contained skeleton
nmap ,k Obody common control {
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
\<CR>bundle agent main {
\<CR>
\<CR>methods:
\<CR>
\<CR>"any" usebundle => test;
\<CR>
\<CR>}
\<CR>
\<CR>bundle agent test {
\<CR>
\<CR>}<ESC>

" Function to align groups of => assignment lines.
" Credit to 'Scripting the Vim editor, Part 2: User-defined functions'
" by Damian Conway
" http://www.ibm.com/developerworks/linux/library/l-vim-script-2/index.html
function AlignAssignments ()
    "Patterns needed to locate assignment operators...
    let ASSIGN_OP   = '\(string\|int\|real\|slist\|ilist\|rlist\)* =>'
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

nmap <silent>  ,=  :call AlignAssignments()<CR>


" TODO
" Folding
" Indents

" CREDITS
" Neil Watson <neil@watson-wilson.ca>
" Other Cfengine information: http://watson-wilson.ca/cfengine/
"
" CHANGES
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
