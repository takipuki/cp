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
constexpr double pi = 2*acos(0.0);
#define fr(i, l, r) for (int i = (l), __r = (r); i < __r; i++)
#define rf(i, l, r) for (int i = (r)-1, __l = (l); i >= __l; i--)
#define rp(n) for (int __n = (n); __n > 0; __n--)
#define all(x) begin(x), end(x)
#define rll(x) rbegin(x), rend(x)
#define slc(x, l, r) begin(x)+(l), begin(x)+(r)
const string yes[2] = {"NO", "YES"};
template<typename It>
void in(It l, It r)   { for (; l < r; l++) { cin >> *l; } }
constexpr int bit_floor(int n) { return (1ll << (__lg(n)+1)) >> 1; }
constexpr int bit_ceil(int n)  { return bit_floor(n) << !!(n & (n-1)); }

void solve();
signed main() {
  int ts = 1;
#ifndef DEBUG
  cin.tie(0)->sync_with_stdio(0);
  cin >> ts;
#endif
  for (int tc = 1; tc <= ts; tc++) {
    cout << "Case " << tc << ": ";
    solve();
  }
}

#define fx  [&](auto xx)
#define fxy [&](auto xx, auto yy)

void solve() {
}
