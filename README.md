## To run the project

ruby lib/portfolio_summary.rb file_path

## Purpose of the project

To calculate the value of a portfolio for a day, the last security price for each day is multiplied with the quantity the investor holds.

## Scenario

Given a sample `market.json` of

```
[
  {"time": "2018-01-13T01:00:00Z", "security": "VGS", "price": 69.26},
  {"time": "2018-01-13T01:00:00Z", "security": "AAA", "price": 50.11},
  {"time": "2018-01-13T02:00:00Z", "security": "VGS", "price": 69.36},
  {"time": "2018-01-14T01:00:00Z", "security": "VGS", "price": 69.39},
  {"time": "2018-01-13T01:00:00Z", "security": "AAA", "price": 69.42}
]
```

The daily prices for VGS would be

| Date       | Security | Price |
| ---------- | -------- | ----- |
| 2018-01-13 | VGS      | 69.36 |
| 2018-01-14 | VGS      | 69.39 |
| 2018-01-13 | AAA      | 50.11 |
| 2018-01-14 | AAA      | 49.86 |

We want to combine this with `portfolio.json` which looks like

```
[
  {"date": "2018-01-13", "holdings": {"VGS": 5, "AAA": 6}},
  {"date": "2018-01-13", "holdings": {"VGS": 7, "AAA": 6}},
]
```

The goal of this test is to write a program in Ruby), which takes these two data files and returns an output JSON describing the portoflio balance for each day

Sample Output

```
[
  {
    "date": "2018-01-13",
    "holdings": {
      "VGS": 346.3,
      "AAA": 300.66,
    }
  },
  {
    "date": "2018-01-14",
    "holdings": {
      "VGS": 485.73,
      "AAA": 299.16
    }
  }
]
```
