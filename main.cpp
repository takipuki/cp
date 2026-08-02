#include <bits/stdc++.h>
#include <cassert>
using namespace std;

#ifdef DEBUG
#include "debug.cpp"
#else
#define deb(...)
#endif

string __sep = "";
#define spc __sep, __sep = " ", cout
#define nl (__sep = "", "\n")

#define int long long
constexpr int inf = 1e17;
#define FOR(i, l, r) for (int i = (l), __r = (r); i < __r; i++)
#define ROF(i, l, r) for (int i = (r)-1, __l = (l); i >= __l; i--)
#define REP(n) for (int __n = (n); __n > 0; __n--)
#define all(x) begin(x), end(x)
#define rll(x) rbegin(x), rend(x)
const string yes[2] = {"NO", "YES"};

void solve();
signed main() {
#ifdef DEBUG
  solve();
#else
  cin.tie(0)->sync_with_stdio(0);
  int ts = 1;
  cin >> ts;
  for (int tc = 1; tc <= ts; tc++) {
    // cout << "Case " << tc << ": ";
    solve();
  }
#endif
}

void solve() {
}
