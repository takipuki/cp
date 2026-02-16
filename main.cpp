#include <bits/stdc++.h>
using namespace std;

string sep = "";
#define spc sep, sep = " ", cout
void solve();

signed main() {
	int ts = 1;
#ifndef DEBUG
	cin.tie(0)->sync_with_stdio(0);
	cin >> ts;
#endif

	for (int tc = 1; tc <= ts; tc++) {
		// cout << "Case " << tc << ": ";
		solve();
		sep = "";
	}
}

#ifdef DEBUG
#include "pprint.hpp"
pprint::PrettyPrinter printer(true);
#define deb(x...) {cerr << #x << " = "; printer.print(x);}
#else
#define deb(...)
#endif
#define nl (sep = "", "\n")
#define FOR(i, l, r) for (int64_t i = (l), _ = (r); i < _; i++)
#define ROF(i, l, r) for (int64_t i = (r) - 1, _ = (l); i >= _; i--)
#define REP(n) for (int64_t _ = (n); _ > 0; _--)
#define all(x) begin(x), end(x)

#define int int64_t
constexpr int MAX = 1e18;

void solve() {
	int n; cin >> n;
	vector<int> v(n+1);
	FOR(i, 1, n+1) cin >> v[i];

	int ans = 0;
	FOR(i, 1, n+1) {
		if (v[i] == v[i-1] or v[i] == 7 - v[i-1]) {
			ans++;
			v[i] = 0;
		}
	}

	cout << ans << nl;
}
