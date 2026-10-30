"""
EX.NO: 04 - FACTORIAL OF A NUMBER (Python Equivalent)
AIM: To find the factorial of a given number recursively.
"""

def fact(n: int) -> int:
    """Recursive definition of factorial: fact(0) = 1, fact(n) = n * fact(n-1)"""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0:
        return 1
    return n * fact(n - 1)

def main():
    print("=" * 60)
    print("EX.NO.04: FACTORIAL OF A NUMBER")
    print("=" * 60)

    print(f"?- fact(5, A).   => A = {fact(5)}")
    print(f"?- fact(10, B).  => B = {fact(10)}")
    print(f"?- fact(5, 720). => {fact(5) == 720}")
    print("=" * 60)

if __name__ == "__main__":
    main()
