"""
EX.NO: 08 - DEPTH FIRST SEARCH (DFS) (Python Equivalent)
AIM: To implement Depth First Search on a graph.
"""

GRAPH = {
    'a': ['b', 'c'],
    'b': ['d', 'e'],
    'c': ['f', 'g'],
    'd': ['h'],
    'e': ['i', 'j'],
    'f': ['k'],
    'g': [],
    'h': [],
    'i': [],
    'j': [],
    'k': []
}

GOALS = {'f', 'j'}

def dfs(node, path, all_solutions):
    """Recursive DFS matching Prolog:
       dfs(Path, Node, [Node|Path]) :- goal(Node).
       dfs(Path, Node, Sol) :- s(Node, Node1), not(mem(Node1, Path)), dfs([Node|Path], Node1, Sol).
    """
    if node in GOALS:
        # Solution is returned with current node at head, matching Prolog: [Node | Path]
        solution = [node] + path
        all_solutions.append(solution)
        # Note: In Prolog, continuing backtracking will find further solutions

    for neighbor in GRAPH.get(node, []):
        if neighbor not in path:
            dfs(neighbor, [node] + path, all_solutions)

def solve(start_node='a'):
    solutions = []
    dfs(start_node, [], solutions)
    return solutions

def main():
    print("=" * 60)
    print("EX.NO.08: DEPTH FIRST SEARCH (DFS)")
    print("Graph: a -> [b, c], b -> [d, e], c -> [f, g], ...")
    print("Goals: f, j")
    print("=" * 60)

    solutions = solve('a')
    for sol in solutions:
        print(f"S = {sol}")
    print("=" * 60)

if __name__ == "__main__":
    main()
