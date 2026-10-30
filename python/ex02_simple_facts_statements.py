"""
EX.NO: 02 - SIMPLE FACT FOR THE STATEMENTS (Python Equivalent)
AIM: To represent simple facts and rules for given statements.
"""

# Facts
DELICIOUS = {"cakes", "pickles"}
SPICY = {"pickles"}
RELISHES = {("priya", "coffee")}

# Rules
def likes(person, food):
    if person == "priya":
        # Priya likes food if they are delicious
        return food in DELICIOUS
    elif person == "prakash":
        # Prakash likes food if they are spicy and delicious
        return (food in SPICY) and (food in DELICIOUS)
    return False

def query_delicious():
    return list(DELICIOUS)

def query_likes(person):
    foods = DELICIOUS | SPICY
    return [food for food in foods if likes(person, food)]

def main():
    print("=" * 60)
    print("EX.NO.02: SIMPLE FACT FOR THE STATEMENTS")
    print("=" * 60)

    print("?- delicious(pickles)  :", "pickles" in DELICIOUS)
    print("?- spicy(pickles)      :", "pickles" in SPICY)
    print("?- relishes(priya, coffee):", ("priya", "coffee") in RELISHES)
    print("?- delicious(Food)     :", query_delicious())
    print("?- likes(priya, Food)  :", query_likes("priya"))
    print("?- likes(prakash, Food):", query_likes("prakash"))
    print("=" * 60)

if __name__ == "__main__":
    main()
