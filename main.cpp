#include <bits/stdc++.h>
using namespace std;

string sep = "";
#define spc sep, sep = " ", cout
#define nl (sep = "", "\n")
void solve();

signed main() {
	int ts = 1;
#ifndef DEBUG
	cin.tie(0)->sync_with_stdio(0);
	cin >> ts;
#endif
	for (int tc = 1; tc <= ts; tc++) {
		solve();
	}
}

#ifdef DEBUG
#include "debug.cpp"
#else
#define deb(...)
#endif
#define FOR(i, l, r) for (int64_t i = (l), _ = (r); i < _; i++)
#define ROF(i, l, r) for (int64_t i = (r) - 1, _ = (l); i >= _; i--)
#define REP(n) for (int64_t _ = (n); _ > 0; _--)
#define all(x) begin(x), end(x)
#define rll(x) rbegin(x), rend(x)

#define int int64_t
constexpr int operator"" _ (unsigned long long x) { return x; }
constexpr int INF = 1e17;

void solve() {
	int n; cin >> n;
	vector<pair<int, int>> v(+n);
	for (auto &[c, p] : v) cin >> c >> p, p /= 100;
}

