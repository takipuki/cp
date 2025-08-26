#include <bits/stdc++.h>
using namespace std;

#ifdef DEBUG
#include "debug.cpp"
#else
#define deb(...)
#endif
#define nl "\n"
#define range(l, r) views::iota((decltype(r))(l), r)
#define rrange(l, r) views::iota((decltype(r))(l), r) | views::reverse

void solve() {
}

signed main() {
	signed ts = 1;

#ifndef DEBUG
	cin.tie(0)->sync_with_stdio(0);
	cin >> ts;
#endif

	for (int tc = 1; ; tc++) {
		if (!ts--) break;
		solve();
	}
}

// vim: set cinoptions+="(s,l1,:0" hid ai si ts=4 sw=4 nu rnu nohls nowrap bg=light list lcs=tab\:\ \ :
