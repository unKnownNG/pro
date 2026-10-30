# pro

AI Lab Record - Complete Programs (Prolog & Python)

This repository contains all **14 lab experiments** extracted and developed from the **AI Lab record.pdf**.

For each experiment, two implementations are provided:
1. **Prolog (`.pl`)**: Fully compatible with standard SWI-Prolog / GNU Prolog, matching the exact syntax, predicates, and queries from the lab manual.
2. **Python (`.py`)**: Standalone, executable Python implementations producing the exact same logic, states, and outputs as required by the lab manual.

---

## Directory Structure

```
pro/
│
├── README.md                      # Comprehensive documentation & execution guide
├── run_all.py                     # One-click runner executing all 14 Python programs
│
├── prolog/                        # Complete Prolog (.pl) source files
│   ├── ex01_study_of_prolog.pl
│   ├── ex02_simple_facts_statements.pl
│   ├── ex03_temperature_conversion.pl
│   ├── ex04_factorial.pl
│   ├── ex05_gcd.pl
│   ├── ex06_n_queens.pl
│   ├── ex07_water_jug.pl
│   ├── ex08_depth_first_search.pl
│   ├── ex09_breadth_first_search.pl
│   ├── ex10_missionaries_cannibals.pl
│   ├── ex11_travelling_salesman.pl
│   ├── ex12_library_management.pl
│   ├── ex13_towers_of_hanoi.pl
│   └── ex14_cryptarithmetic.pl
│
└── python/                        # Executable Python (.py) source files
    ├── ex01_study_of_prolog.py
    ├── ex02_simple_facts_statements.py
    ├── ex03_temperature_conversion.py
    ├── ex04_factorial.py
    ├── ex05_gcd.py
    ├── ex06_n_queens.py
    ├── ex07_water_jug.py
    ├── ex08_depth_first_search.py
    ├── ex09_breadth_first_search.py
    ├── ex10_missionaries_cannibals.py
    ├── ex11_travelling_salesman.py
    ├── ex12_library_management.py
    ├── ex13_towers_of_hanoi.py
    └── ex14_cryptarithmetic.py
```

---

## List of Experiments & Expected Outputs

| Ex. No. | Experiment Title | Core Concept | Sample Query / Command | Expected Output Summary |
|---|---|---|---|---|
| **01** | **Study of Prolog** | Facts, rules, kinship, recursion, geometry structures | `?- parent(bob, pat).` | `true.` |
| **02** | **Simple Facts for Statements** | Horn clauses, knowledge representation | `?- likes(prakash, Food).` | `Food = pickles.` |
| **03** | **Temperature Conversion** | Arithmetic expressions & conditions | `?- ctof(100, F).` | `F = 212.` |
| **04** | **Factorial of a Number** | Recursive mathematical computation | `?- fact(5, A).` | `A = 120.` |
| **05** | **GCD of Two Numbers** | Subtraction-based Euclidean algorithm | `?- gcd(75, 30, B).` | `B = 15.` |
| **06** | **N-Queen Problem (8-Queens)** | Constraint satisfaction & backtracking | `?- template(S), solution(S).` | `S = [1/4, 2/2, 3/7, 4/3, 5/6, 6/8, 7/5, 8/1]` |
| **07** | **Water Jug Problem** | Production rules & state space navigation | `?- fill(4, 0).` | 7-step sequence reaching `(2, 0)` |
| **08** | **Depth First Search (DFS)** | Graph traversal with stack / backtracking | `?- solve(a, S).` | `S = [j, e, b, a] ; S = [f, c, a]` |
| **09** | **Breadth First Search (BFS)** | Graph traversal with queue / level order | `?- solve(a, S).` | `S = [f, c, a]` |
| **10** | **Missionaries & Cannibals** | River crossing state space search | `?- find.` | 11 valid transitions `[3,3,left,0,0] -> [0,0,right,3,3]` |
| **11** | **Travelling Salesman Problem** | Graph optimization (minimum cycle) | `?- shortest_path(Path).` | `Path = 22-[a, h, d, c, e, b, a]` |
| **12** | **Library Management System** | Relational database simulation & search | `?- list_borrowed_books.` | Borrowed book details with borrower names |
| **13** | **Towers of Hanoi** | Divide and conquer recursion | `?- stoh(3).` | 7 moves from peg `left` to `right` |
| **14** | **Crypt Arithmetic Problem** | Constraint satisfaction (SEND+MORE=MONEY) | `?- alpha1(S,E,N,D,M,O,R,Y,Sol).` | `S=9, E=5, N=6, D=7, M=1, O=0, R=8, Y=2` |

---

## How to Run the Programs

### Option 1: Running with Python

You can run individual experiments:
```powershell
python AI_Lab_Record_Programs/python/ex01_study_of_prolog.py
python AI_Lab_Record_Programs/python/ex06_n_queens.py
python AI_Lab_Record_Programs/python/ex07_water_jug.py
python AI_Lab_Record_Programs/python/ex10_missionaries_cannibals.py
python AI_Lab_Record_Programs/python/ex14_cryptarithmetic.py
```

Or run all 14 experiments at once with the automated test runner:
```powershell
python AI_Lab_Record_Programs/run_all.py
```

---

### Option 2: Running with SWI-Prolog

If SWI-Prolog is installed on your system or accessed online via [SWISH (SWI-Prolog for Web)](https://swish.swi-prolog.org/):

1. **Load a file:**
   ```prolog
   ?- [ex01_study_of_prolog].
   % or
   ?- consult('ex01_study_of_prolog.pl').
   ```

2. **Run queries:**
   ```prolog
   ?- parent(bob, pat).
   ?- fact(5, Result).
   ?- fill(4, 0).
   ?- find.
   ?- shortest_path(Path).
   ```

3. **To exit Prolog:**
   ```prolog
   ?- halt.
   ```
