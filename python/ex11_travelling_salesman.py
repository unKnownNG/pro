"""
EX.NO: 11 - TRAVELLING SALESMAN PROBLEM (TSP) (Python Equivalent)
AIM: To solve the Travelling Salesman Problem by finding the minimum-cost Hamiltonian cycle.
"""

EDGES = {
    ('a', 'b'): 3, ('a', 'c'): 5, ('a', 'd'): 7, ('a', 'e'): 8,
    ('b', 'c'): 9, ('b', 'd'): 10, ('b', 'e'): 3,
    ('c', 'd'): 5, ('c', 'e'): 8,
    ('d', 'e'): 6,
    ('b', 'a'): 3, ('c', 'a'): 4, ('d', 'a'): 2, ('e', 'a'): 7,
    ('c', 'b'): 4, ('d', 'b'): 6, ('e', 'b'): 3,
    ('d', 'c'): 5, ('e', 'c'): 8,
    ('e', 'd'): 6,
    ('a', 'h'): 2, ('h', 'd'): 1,
}

# Build adjacency map
ADJ = {}
for (u, v), cost in EDGES.items():
    ADJ.setdefault(u, []).append((v, cost))

def find_tsp_paths(start='a', required_cycle_len=7):
    all_paths = []

    def search(curr, path, cost):
        # Base case: try to close the cycle back to start
        if len(path) == required_cycle_len - 1:
            if (curr, start) in EDGES:
                total_cost = cost + EDGES[(curr, start)]
                full_path = path + [start]
                all_paths.append((total_cost, full_path))
            return

        for next_node, dist in ADJ.get(curr, []):
            if next_node not in path:
                search(next_node, path + [next_node], cost + dist)

    search(start, [start], 0)
    return all_paths

def shortest_path():
    paths = find_tsp_paths('a', 7)
    if not paths:
        return None
    paths.sort(key=lambda x: x[0])
    return paths[0]

def main():
    print("=" * 60)
    print("EX.NO.11: TRAVELLING SALESMAN PROBLEM (TSP)")
    print("=" * 60)

    best = shortest_path()
    if best:
        cost, path = best
        print(f"Path = {cost}-{path}")
    print("=" * 60)

if __name__ == "__main__":
    main()
