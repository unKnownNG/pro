"""
EX.NO: 09 - BREADTH FIRST SEARCH (BFS) (Python Equivalent)
AIM: To implement Breadth First Search on a graph.
"""
from collections import deque

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

def bfs_trace(start_node='a'):
    """Performs BFS simulation with queue and extension tracking matching Prolog."""
    queue = deque([[[start_node]]])  # list of paths: each path is [node, parent, ...]
    
    # Trace list matching Prolog output
    print(f"Starting BFS from node '{start_node}'...")
    paths = [[[start_node]]]
    
    # Prolog bfs implementation simulation
    paths = [[start_node]]
    while paths:
        current_path = paths.pop(0)
        curr_node = current_path[0]
        
        if curr_node in GOALS:
            return current_path
        
        # Extend
        new_paths = []
        for nbr in GRAPH.get(curr_node, []):
            if nbr not in current_path:
                new_paths.append([nbr] + current_path)
        
        if new_paths:
            print(f"Generated new paths: {new_paths}")
            
        paths.extend(new_paths)

    return None

def main():
    print("=" * 60)
    print("EX.NO.09: BREADTH FIRST SEARCH (BFS)")
    print("Graph: a -> [b, c], b -> [d, e], c -> [f, g], ...")
    print("Goals: f, j")
    print("=" * 60)

    solution = bfs_trace('a')
    print(f"\nSolution Found: S = {solution}")
    print("=" * 60)

if __name__ == "__main__":
    main()
