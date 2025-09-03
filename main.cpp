#include <bits/stdc++.h>
using namespace std;

#ifdef DEBUG
#include "debug.cpp"
#else
#define deb(...)
#endif
#define nl "\n"
#define FOR(i, l, r) for (decltype(r) i = (l), _ = (r); i < _; i++)
#define ROF(i, l, r) for (decltype(r) i = (r) - 1, _ = (l); i >= _; i--)
#define REP(n) for (decltype(n) _ = (n); _ > 0; _--)

void solve() {
}

signed main() {
	int ts = 1;

#ifndef DEBUG
	cin.tie(0)->sync_with_stdio(0);
	// cin >> ts;
#endif

	for (;;) {
		if (!ts--) break;
		solve();
	}
}
