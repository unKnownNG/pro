"""
EX.NO: 10 - MISSIONARIES AND CANNIBALS PROBLEM (Python Equivalent)
AIM: To solve the Missionaries and Cannibals problem using state-space search.
"""

def is_legal(cl, ml, cr, mr):
    if ml < 0 or cl < 0 or mr < 0 or cr < 0:
        return False
    if ml > 0 and ml < cl:
        return False
    if mr > 0 and mr < cr:
        return False
    return True

def get_moves(state):
    cl, ml, boat, cr, mr = state
    moves = []
    
    if boat == 'left':
        # Candidate transitions (cannibals_cross, missionaries_cross)
        candidates = [
            (0, 2),  # Two missionaries
            (2, 0),  # Two cannibals
            (1, 1),  # One missionary and one cannibal
            (0, 1),  # One missionary
            (1, 0),  # One cannibal
        ]
        for c, m in candidates:
            cl2 = cl - c
            ml2 = ml - m
            cr2 = cr + c
            mr2 = mr + m
            if is_legal(cl2, ml2, cr2, mr2):
                moves.append((cl2, ml2, 'right', cr2, mr2))
    else:  # boat == 'right'
        candidates = [
            (0, 2),  # Two missionaries
            (2, 0),  # Two cannibals
            (1, 1),  # One missionary and one cannibal
            (0, 1),  # One missionary
            (1, 0),  # One cannibal
        ]
        for c, m in candidates:
            cl2 = cl + c
            ml2 = ml + m
            cr2 = cr - c
            mr2 = mr - m
            if is_legal(cl2, ml2, cr2, mr2):
                moves.append((cl2, ml2, 'left', cr2, mr2))
                
    return moves

def solve_dfs(current_state, goal_state, explored, path_history):
    if current_state == goal_state:
        return path_history

    for next_state in get_moves(current_state):
        if next_state not in explored:
            res = solve_dfs(next_state, goal_state, explored | {next_state}, path_history + [(current_state, next_state)])
            if res is not None:
                return res
    return None

def format_state(s):
    return f"[{s[0]},{s[1]},{s[2]},{s[3]},{s[4]}]"

def main():
    print("=" * 60)
    print("EX.NO.10: MISSIONARIES AND CANNIBALS PROBLEM")
    print("State format: [CL, ML, Boat, CR, MR]")
    print("=" * 60)

    start_state = (3, 3, 'left', 0, 0)
    goal_state = (0, 0, 'right', 3, 3)

    steps = solve_dfs(start_state, goal_state, {start_state}, [])
    if steps:
        for prev_s, next_s in steps:
            print(f"{format_state(prev_s)} -> {format_state(next_s)}")
    print("=" * 60)

if __name__ == "__main__":
    main()
