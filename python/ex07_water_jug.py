"""
EX.NO: 07 - WATER JUG PROBLEM (Python Equivalent)
AIM: To solve the Water Jug problem (4-Gallon Jug and 3-Gallon Jug)
     to reach the goal state (2, 0).
"""

def fill(x: int, y: int, visited=None):
    if visited is None:
        visited = set()

    # Base case: Goal State (2, 0)
    if x == 2 and y == 0:
        print("\nGoal State is Reached....")
        return True

    # Rule 1: Fill 4-Gallon Jug if empty and Y <= 1
    if x == 0 and y <= 1:
        print(f"\nFill the 4-Gallon Jug:(4,{y})", end="")
        return fill(4, y, visited)

    # Rule 2: Fill 3-Gallon Jug if Y == 0 and X >= 3
    if y == 0 and x >= 3:
        print(f"\nFill the 3-Gallon Jug:({x},3)", end="")
        return fill(x, 3, visited)

    # Rule 3: Pour water from 3-Gallon into 4-Gallon until full
    if (x + y >= 4) and (y == 3) and (x == 3):
        y1 = y - (4 - x)
        print(f"\nPour water from 3-Gallon Jug to 4-Gallon until is full:(4,{y1})", end="")
        return fill(4, y1, visited)

    # Rule 4: Pour water from 4-Gallon into 3-Gallon until full
    if (x + y >= 3) and (x == 4) and (y <= 1):
        x1 = x - (3 - y)
        print(f"\nPour water from 4-Gallon Jug to 3-Gallon until is full:({x1},3)", end="")
        return fill(x1, 3, visited)

    # Rule 5: Pour all water from 3-Gallon into 4-Gallon
    if (x + y <= 4) and (x == 0) and (y > 1):
        x1 = x + y
        print(f"\npour all the water from 3-Gallon Jug to 4-Gallon:({x1},0)", end="")
        return fill(x1, 0, visited)

    # Rule 6: Pour all water from 4-Gallon into 3-Gallon
    if (x + y < 3) and (y == 0):
        y1 = x + y
        print(f"\nPour all the water from 4-Gallon Jug too 3-Gallon:(0,{y1})", end="")
        return fill(0, y1, visited)

    # Rule 7: Empty 4-Gallon Jug on ground
    if y >= 2 and x == 4:
        print(f"\nEmpty the 4-Gallon Jug on Ground:(0,{y})", end="")
        return fill(0, y, visited)

    # Rule 8: Empty 3-Gallon Jug on ground
    if y == 3 and x >= 1:
        print(f"\nEmpty the 3-Gallon Jug on Ground:({x},0)", end="")
        return fill(x, 0, visited)

    return False

def main():
    print("=" * 60)
    print("EX.NO.07: WATER JUG PROBLEM")
    print("Starting Query: ?- fill(4, 0).")
    print("=" * 60)
    fill(4, 0)
    print("\n" + "=" * 60)

if __name__ == "__main__":
    main()
