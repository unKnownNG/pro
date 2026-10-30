"""
EX.NO: 01 - STUDY OF PROLOG (Python Equivalent)
AIM: To Study about Prolog (Facts, Rules, Kinship Relations, Structures)
"""

# --- Facts: Family Tree ---
PARENTS = [
    ("pam", "bob"),
    ("tom", "bob"),
    ("tom", "liz"),
    ("bob", "ann"),
    ("bob", "pat"),
    ("pat", "jim"),
]

# --- Facts: Gender ---
FEMALES = {"pam", "liz", "pat", "ann"}
MALES = {"tom", "bob", "jim"}

# --- Predicates / Rules ---
def is_parent(x, y):
    return (x, y) in PARENTS

def is_child(y, x):
    return is_parent(x, y)

def is_mother(x, y):
    return is_parent(x, y) and (x in FEMALES)

def is_grandparent(x, y):
    return any(is_parent(x, z) and is_parent(z, y) for z, _ in PARENTS)

def is_sister(x, y):
    return (x in FEMALES) and (x != y) and any(
        is_parent(z, x) and is_parent(z, y) for z, _ in PARENTS
    )

def is_happy(x):
    return any(p == x for p, _ in PARENTS)

def is_predecessor(x, z):
    if is_parent(x, z):
        return True
    return any(is_parent(x, y) and is_predecessor(y, z) for _, y in PARENTS)

# --- Geometry Structures: Segments ---
def is_vertical(p1, p2):
    return p1[0] == p2[0]

def is_horizontal(p1, p2):
    return p1[1] == p2[1]


def main():
    print("=" * 60)
    print("EX.NO.01: STUDY OF PROLOG - SAMPLE QUERIES & RESULTS")
    print("=" * 60)

    print("?- parent(liz, pat)     :", is_parent("liz", "pat"))
    print("?- parent(bob, pat)     :", is_parent("bob", "pat"))
    print("?- grandparent(pam, pat):", is_grandparent("pam", "pat"))
    print("?- mother(pam, bob)     :", is_mother("pam", "bob"))
    print("?- child(liz, tom)      :", is_child("liz", "tom"))
    print("?- happy(bob)           :", is_happy("bob"))
    print("?- predecessor(tom, jim):", is_predecessor("tom", "jim"))
    print("?- vertical(seg(point(1,4), point(1,5)))  :", is_vertical((1, 4), (1, 5)))
    print("?- horizontal(seg(point(2,10), point(10,10))):", is_horizontal((2, 10), (10, 10)))
    print("=" * 60)


if __name__ == "__main__":
    main()
