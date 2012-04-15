" Vim file plugin
" Language:     Cfengine version 3
" Maintainer:   Neil Watson <neil@watson-wilson.ca>
" Last Change:  Wednesday October 05 2011 
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
