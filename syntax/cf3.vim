" Vim syntax file
"
" This is my first attempt at a syntax file.  Feel free to send me correctsion
" or improvements.  I'll give you a credit.
"
" USAGE
" There is already a vim file that uses 'cf' as a file extention.  You can use
" cf3 for your cf3 file extentions or identify via your vimrc file:
" au BufRead,BufNewFile *.cf set ft=cf3
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists ("b:current_syntax")
    finish
endif

syn case ignore
syn keyword cf3BodyTypes agent common server executor reporter monitor runagent action classes contain copy_from delete delete_select depth_search edit_defaults file_select link_from perms process_count process_select rename contained
syn match   cf3Body /^\s*\(body\|bundle\)\s*\w\+/ contains=Cf3BodyTypes
syn region	cf3Fold start="{" end="}" transparent fold
syn keyword TODO todo contained
syn match   cf3Comment      /#.*/ contains=TODO
syn match   cf3Identifier   /=>/
" For actions e.g. reports:, commands:
syn match   cf3Action       /\w\+:\s*$/
syn match   cf3Class        /[^:#]\+::\s*$/
" Escape sequences in regexes
syn match   cf3Esc          /\\\\[sSdD+][\+\*]*/ contained
" Array indexes contained in [].  Does not seems to be working.
syn region  cf3Array        start=/\[/ end=/\]/ contained contains=cf3Var
" Variables wrapped in {} or ()
syn region  cf3Var          start=/[$@][{(]/ end=/[})]/ contained contains=cf3Var,cf3Array
syn region  cf3String       start=/\z\("\|'\)/ skip=/\\\z1/ end=/\z1/ contains=cf3Var,cf3Array,cf3Esc
syn keyword cf3Type         int ilist slist float not and string expression real rlist
syn keyword cf3OnOff        on off yes no true false  

if version >= 508 || !exists("did_cfg_syn_inits")
    if version < 508
        let did_cfg_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink cf3BodyTypes     Function
    HiLink cf3Comment	    Comment
    HiLink cf3Identifier    Identifier
    HiLink cf3Action        Underlined
    HiLink cf3Class         Statement
    HiLink cf3Esc           Special
    HiLink cf3Array         Special
    HiLink cf3Var           Identifier
    HiLink cf3String        String
    HiLink cf3Type          Type
    HiLink cf3OnOff         Boolean

    delcommand HiLink
endif
let b:current_syntax = "cf3"

set foldmethod=syntax

" CREDITS
" Neil Watson <neil@watson-wilson.ca>
" Aleksey Tsalolikhin
" John Coleman of Yale U
" Matt Lesko

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
