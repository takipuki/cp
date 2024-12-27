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
#define REP(n) for (auto _ = (n); _--;)
#define FOR(i, init, n) for (auto i = (init), __ = (n); i < __; i++)
#define ROF(i, init, n) for (auto i = (init), ___ = (n); i >= ___; i--)
const int64_t MOD = 1e9 + 7;

#define OJMULTI
void solve() {
}

/**
 * run your own tests
 */

int main() {
#ifndef DEBUG
	UwU;
#endif
	int ts = 1;
#if !defined(DEBUG) && (defined(OJMULTI) || defined(MULTI))
	cin >> ts;
#endif
	// for (cin >> n; n; cin >> n) {
	for (int t = 1; ts--; t++) {
		// cout << "Case " << t << ": ";
		solve();
	}
}

