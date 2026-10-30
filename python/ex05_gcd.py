"""
EX.NO: 05 - GCD OF TWO NUMBERS (Python Equivalent)
AIM: To find the GCD of two numbers using the subtraction-based Euclidean algorithm.
"""

def gcd(x: int, y: int) -> int:
    """Computes GCD matching the Prolog subtraction logic:
       gcd(X, X, X).
       gcd(X, Y, D) :- X < Y, Y1 is Y - X, gcd(X, Y1, D).
       gcd(X, Y, D) :- Y < X, X1 is X - Y, gcd(X1, Y, D).
    """
    if x == y:
        return x
    elif x < y:
        return gcd(x, y - x)
    else:
        return gcd(x - y, y)

def main():
    print("=" * 60)
    print("EX.NO.05: GCD OF TWO NUMBERS")
    print("=" * 60)

    print(f"?- gcd(75, 30, B). => B = {gcd(75, 30)}")
    print(f"?- gcd(15, 60, A). => A = {gcd(15, 60)}")
    print("=" * 60)

if __name__ == "__main__":
    main()
