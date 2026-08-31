set ai si nowrap nu rnu nohls et sw=2 ts=2 bg=light list lcs=tab:\|\ ,trail:~
set hidden autochdir virtualedit=all

nnoremap <c-s> :w<cr>
nnoremap ,y "+y
nnoremap ,p "+p
nnoremap ,Y "+Y
nnoremap ,P "+P
nnoremap gy :%y+<cr>

iabbrev <buffer> ci cin >>
iabbrev <buffer> co cout <<
iabbrev <buffer> str string
iabbrev <buffer> v< vector<
iabbrev <buffer> p< pair<
iabbrev <buffer> m< map<
iabbrev <buffer> s< set<
iabbrev <buffer> a< array<
iabbrev <buffer> q< queue<
iabbrev <buffer> pq< priority_queue<
iabbrev <buffer> vi vector<int>
iabbrev <buffer> vvi vector<vector<int>>
iabbrev <buffer> pii pair<int, int>
iabbrev <buffer> vpii vector<pair<int, int>>
iabbrev <buffer> pb push_back
iabbrev <buffer> pf push_front
iabbrev <buffer> ppb pop_back
iabbrev <buffer> ppf pop_front
