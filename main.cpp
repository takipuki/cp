#define _USE_MATH_DEFINES
#include <bits/stdc++.h>
using namespace std;

#ifdef DEBUG
#include "debug.cpp"
#else
#define deb(...)
#endif

#define UwU cin.tie(0)->sync_with_stdio(0)
#define nl '\n'
#define REP(n) for (int64_t _ = (n); _--;)
#define FOR(i, init, n) for (int64_t i = (init), __ = (n); i < __; i++)
#define ROF(i, init, n) for (int64_t i = (init), ___ = (n); i >= ___; i--)
#define all(v) begin(v), end(v)

#define OJMULTI
void solve() {
}


/**
 * run your own tests
 * edge cases n = 1, k = 1 etc.
 */

signed main() {
	int ts = 1;

#if !defined(DEBUG)
	UwU;
#if defined(OJMULTI)
	cin >> ts;
#endif
#endif

	for (; ts--; ) {
		solve();
	}
}
