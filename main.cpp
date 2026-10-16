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
constexpr int bit_floor(int n) { return ((int)1 << (__lg(n)+1)) >> 1; }
constexpr int bit_ceil(int n)  { return bit_floor(n) << !!(n & (n-1)); }

void solve();
signed main() {
  int ts = 1;
#ifndef DEBUG
  cin.tie(0)->sync_with_stdio(0);
  // cin >> ts;
#endif
  for (int tc = 1; tc <= ts; tc++) {
    // cout << "Case " << tc << ": ";
    solve();
  }
}

struct FenTree {
  vector<int> tr;
  FenTree(int n)
    : tr(n+1, 0)
  { }

  void inc(int i, int d=1) {
    for (; i < tr.size(); i += -i&i) {
      tr[i] += d;
    }
  }

  int query(int i) {
    int o = 0;
    for (; i > 0; i -= -i&i) {
      o += tr[i];
    }
    return o;
  }

  int query(int l, int r) {
    return query(r) - query(l-1);
  }
};

struct MaxWindow {
  int cnt_enqueued = 0;
  int cnt_dequeued = 0;

  deque<pair<int, int>> window;

  void dequeue() {
    assert(!window.empty());
    cnt_dequeued += 1;
    if (window.front().first <= cnt_dequeued)
      window.pop_front();
  }

  void enqueue(int x) {
    cnt_enqueued += 1;
    for (; window.size() and window.back().second <= x; )
      window.pop_back();
    window.push_back({cnt_enqueued, x});
  }

  int size() { return cnt_enqueued - cnt_dequeued; }

  int max() {
    if (window.empty()) return 0;
    return window.front().second;
  }
};

template<typename T = int>
struct SegTree {
  const int k;
  vector<T> tr;

  SegTree(int n)
    : k(bit_ceil(n))
    , tr(2*k)
  { }

  void init() {
    rf(i, 1, k) tr[i] = tr[2*i] + tr[2*i+1];
  }

  T query(int l, int r) {
    return query(l, r, 1, 0, k-1);
  }

  T query(int l, int r, int i, int a, int b) {
    if (b < l or r < a) return tr[0];
    if (l <= a and b <= r) return tr[i];

    int m = (a+b)/2;
    return query(l, r, 2*i, a, m) + query(l, r, 2*i+1, m+1, b);
  }
};

struct Node {
  int value;

  Node inc(int cnt_children, int increment) {
    return Node{this->value + cnt_children * increment};
  }

  Node operator+(const Node b) { return Node{this->value + b.value}; }
};

ostream& operator<<(ostream &os, Node &b) {
  return os << b.value;
}
istream& operator>>(istream &is, Node &b) {
  return is >> b.value;
}
void __print(Node a) {
  cerr << a.value;
}

void solve() {
  int n, q; cin >> n >> q;
  SegTree<Node> st(+n);
  in(slc(st.tr, st.k, st.k+n));
  st.init();

  deb(st.tr);
  rp(+q) {
    int l, r; cin >> l >> r;
    deb(st.query(l-1, r-1));
  }
}

