"""
EX.NO: 06 - N-QUEEN PROBLEM (Python Equivalent)
AIM: To solve the 8-Queens Problem using backtracking search matching Prolog's solution.
"""

def is_safe(x, y, others):
    """Checks no-attack condition against already placed queens (others)
       matching Prolog:
       Y =\= Y1,
       Y1 - Y =\= X1 - X,
       Y1 - Y =\= X - X1
    """
    for x1, y1 in others:
        if y == y1:
            return False
        if abs(y1 - y) == abs(x1 - x):
            return False
    return True

def solve_n_queens_prolog_order():
    """In Prolog's recursive rule:
       solution([]).
       solution([X/Y | Others]) :- solution(Others), mem(Y, [1..8]), noattack(X/Y, Others).
       The recursion descends down to the empty list and instantiates Others first (from 8 down to 1).
    """
    solutions = []

    def solve_clause(cols):
        if not cols:
            return [[]]
        x = cols[0]
        others_cols = cols[1:]
        
        # Recursively solve Others first
        others_solutions = solve_clause(others_cols)
        results = []
        for others in others_solutions:
            for y in range(1, 9):
                if is_safe(x, y, others):
                    results.append([(x, y)] + others)
        return results

    # Columns 1 to 8 as in template([1/Y1, 2/Y2, ..., 8/Y8])
    cols = list(range(1, 9))
    return solve_clause(cols)

def format_solution(sol):
    # Sort by column 1 to 8
    sorted_sol = sorted(sol, key=lambda item: item[0])
    return "[" + ", ".join(f"{x}/{y}" for x, y in sorted_sol) + "]"

def main():
    print("=" * 60)
    print("EX.NO.06: N-QUEEN PROBLEM (8-QUEENS)")
    print("Query: ?- template(S), solution(S).")
    print("=" * 60)

    solutions = solve_n_queens_prolog_order()
    print(f"Total solutions found: {len(solutions)}\n")

    print("Sample outputs matching Prolog record:")
    if len(solutions) >= 2:
        print(f"S = {format_solution(solutions[0])} ;")
        print(f"S = {format_solution(solutions[1])}")
    print("=" * 60)

if __name__ == "__main__":
    main()
