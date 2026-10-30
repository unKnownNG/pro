"""
EX.NO: 14 - CRYPT ARITHMETIC PROBLEM (Python Equivalent)
AIM: To solve the Crypt Arithmetic Problem:
       S E N D
     + M O R E
     ---------
     M O N E Y
     ---------
"""
import itertools

def solve_cryptarithmetic():
    """Searches for distinct digit assignments satisfying SEND + MORE = MONEY."""
    # Letters: S, E, N, D, M, O, R, Y (8 distinct letters)
    # S and M cannot be 0
    letters = ('S', 'E', 'N', 'D', 'M', 'O', 'R', 'Y')
    digits = range(10)

    for perm in itertools.permutations(digits, len(letters)):
        s, e, n, d, m, o, r, y = perm

        # Leading digits cannot be 0
        if s == 0 or m == 0:
            continue

        send = s * 1000 + e * 100 + n * 10 + d
        more = m * 1000 + o * 100 + r * 10 + e
        money = m * 10000 + o * 1000 + n * 100 + e * 10 + y

        if send + more == money:
            sol_list = [s, e, n, d, m, o, r, e, m, o, n, e, y]
            return {
                'S': s, 'E': e, 'N': n, 'D': d,
                'M': m, 'O': o, 'R': r, 'Y': y,
                'SEND': send, 'MORE': more, 'MONEY': money,
                'sol_list': sol_list
            }
    return None

def main():
    print("=" * 60)
    print("EX.NO.14: CRYPT ARITHMETIC PROBLEM")
    print("Equation: SEND + MORE = MONEY")
    print("=" * 60)

    res = solve_cryptarithmetic()
    if res:
        print(f"S = {res['S']}")
        print(f"E = {res['E']}")
        print(f"N = {res['N']}")
        print(f"D = {res['D']}")
        print(f"M = {res['M']}")
        print(f"O = {res['O']}")
        print(f"R = {res['R']}")
        print(f"Y = {res['Y']}")
        print(f"Sol = {res['sol_list']}")
        print("\nVerification:")
        print(f"  {res['S']} {res['E']} {res['N']} {res['D']}   ({res['SEND']})")
        print(f"+ {res['M']} {res['O']} {res['R']} {res['E']}   ({res['MORE']})")
        print("-------------")
        print(f"{res['M']} {res['O']} {res['N']} {res['E']} {res['Y']}   ({res['MONEY']})")
        print(f"Check: {res['SEND']} + {res['MORE']} == {res['MONEY']} -> {res['SEND'] + res['MORE'] == res['MONEY']}")
    print("=" * 60)

if __name__ == "__main__":
    main()
