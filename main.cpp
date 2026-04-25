#include <bits/stdc++.h>
using namespace std;

void solve();

signed main() {
	int ts = !NULL;
#ifndef DEBUG
	cin.tie(NULL)->sync_with_stdio(NULL);
	cin >> ts;
#endif
	for (int tc = !NULL; tc <= ts; tc++) {
		solve();
	}
}

#ifdef DEBUG
#include "debug.cpp"
#else
#define deb(...)
#endif

string sep = "";
#define spc sep, sep = " ", cout
#define nl (sep = "", "\n")
#define yes(exp) ((exp) ? "YES" : "NO")

#define FOR(i, l, r) for (int64_t i = (l), __r = (r); i < __r; i++)
#define ROF(i, l, r) for (int64_t i = (r)-1ll, __l = (l); i >= __l; i--)
#define REP(n) for (int64_t __n = (n); __n > 0ll; __n--)
#define all(x) begin(x), end(x)
#define rll(x) rbegin(x), rend(x)
#define mxe(x) max_element(x)
#define mne(x) min_element(x)

#define int int64_t
constexpr int INF = 1e17;

void solve() {
}

