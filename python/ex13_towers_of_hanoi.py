"""
EX.NO: 13 - TOWERS OF HANOI (Python Equivalent)
AIM: To solve the Towers of Hanoi puzzle recursively.
"""

def move(n: int, source: str, destination: str, auxiliary: str):
    """Recursive Towers of Hanoi matching Prolog:
       move(1, X, Y, _) :- write('Move disk from '), write(X), write(' to '), write(Y), nl.
       move(N, X, Y, Z) :- N > 1, M is N - 1, move(M, X, Z, Y), move(1, X, Y, _), move(M, Z, Y, X).
    """
    if n == 1:
        print(f"Move disk from {source} to {destination}")
    else:
        move(n - 1, source, auxiliary, destination)
        move(1, source, destination, auxiliary)
        move(n - 1, auxiliary, destination, source)

def stoh(n: int):
    """Solves Towers of Hanoi puzzle for n disks from 'left' to 'right' using 'center'."""
    move(n, "left", "right", "center")

def main():
    print("=" * 60)
    print("EX.NO.13: TOWERS OF HANOI (N = 3)")
    print("Query: ?- stoh(3).")
    print("=" * 60)

    stoh(3)
    print("=" * 60)

if __name__ == "__main__":
    main()
