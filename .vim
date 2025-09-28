set nu rnu nohls noet sw=4 ts=4 bg=light list lcs=tab:\ \ 

nnoremap <c-s> :w<cr>
nnoremap ,y '*y
nnoremap ,p '*p

iabbrev <buffer> ci cin >>
iabbrev <buffer> co cout <<
iabbrev <buffer> ll int64_t
iabbrev <buffer> str string
iabbrev <buffer> v< vector<
iabbrev <buffer> p< pair<
iabbrev <buffer> m< map<
iabbrev <buffer> s< set<
iabbrev <buffer> a< array<
iabbrev <buffer> vi vector<int>
iabbrev <buffer> vvi vector<vector<int>>
iabbrev <buffer> vll vector<int64_t>
iabbrev <buffer> vvll vector<vector<int64_t>>
