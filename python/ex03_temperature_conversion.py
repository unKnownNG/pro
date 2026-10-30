"""
EX.NO: 03 - TEMPERATURE CONVERSION (Python Equivalent)
AIM: To convert centigrade temperature to Fahrenheit and check if below freezing.
"""

def ctof(celsius: float) -> float:
    """Converts Centigrade (C) to Fahrenheit (F): F = C * 9 / 5 + 32"""
    return celsius * 9.0 / 5.0 + 32.0

def freezing(fahrenheit: float) -> bool:
    """Checks if temperature in Fahrenheit is below or at freezing point (<= 32 F)"""
    return fahrenheit <= 32.0

def main():
    print("=" * 60)
    print("EX.NO.03: TEMPERATURE CONVERSION")
    print("=" * 60)

    f1 = ctof(100)
    print(f"?- ctof(100, F).    => F = {f1}")

    chk1 = freezing(20)
    print(f"?- freezing(20).    => {chk1}")

    chk2 = freezing(40)
    print(f"?- freezing(40).    => {chk2}")
    print("=" * 60)

if __name__ == "__main__":
    main()
