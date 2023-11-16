import heapq

class PuzzleNode:
    def __init__(self, state, parent, action, depth, cost):
        self.state = state
        self.parent = parent
        self.action = action
        self.depth = depth
        self.cost = cost

    def __lt__(self, other):
        return (self.cost + self.depth) < (other.cost + other.depth)

def is_solvable(puzzle):
    inversion_count = 0
    flat_puzzle = [puzzle[i][j] for i in range(3) for j in range(3)]
    
    for i in range(8):
        for j in range(i+1, 9):
            if flat_puzzle[i] > 0 and flat_puzzle[j] > 0 and flat_puzzle[i] > flat_puzzle[j]:
                inversion_count += 1
    
    return inversion_count % 2 == 0

def get_blank_position(state):
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                return (i, j)

def get_successors(state):
    successors = []
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    blank_row, blank_col = get_blank_position(state)

    for dr, dc in directions:
        new_row, new_col = blank_row + dr, blank_col + dc
        if 0 <= new_row < 3 and 0 <= new_col < 3:
            new_state = [row[:] for row in state]
            new_state[blank_row][blank_col], new_state[new_row][new_col] = new_state[new_row][new_col], new_state[blank_row][blank_col]
            successors.append(new_state)

    return successors

def manhattan_distance(state, goal_state):
    distance = 0
    state_dict = {state[i][j]: (i, j) for i in range(3) for j in range(3)}
    
    for i in range(3):
        for j in range(3):
            value = goal_state[i][j]
            if value != 0:
                goal_row, goal_col = i, j
                current_row, current_col = state_dict[value]
                distance += abs(current_row - goal_row) + abs(current_col - goal_col)
    return distance


def solve_8_puzzle(initial_state, goal_state):
    if not is_solvable(initial_state) or not is_solvable(goal_state):
        return "Unsolvable"

    open_list = []
    closed_set = set()
    initial_node = PuzzleNode(initial_state, None, None, 0, 0)
    heapq.heappush(open_list, initial_node)

    while open_list:
        current_node = heapq.heappop(open_list)
        if current_node.state == goal_state:
            path = []
            while current_node:
                path.insert(0, current_node.state)
                current_node = current_node.parent
            return path

        closed_set.add(tuple(map(tuple, current_node.state)))
        successors = get_successors(current_node.state)

        for successor_state in successors:
            if tuple(map(tuple, successor_state)) not in closed_set:
                g = current_node.depth + 1
                h = manhattan_distance(successor_state, goal_state)
                successor_node = PuzzleNode(successor_state, current_node, None, g, h)
                heapq.heappush(open_list, successor_node)

    return "No solution found"

# Example usage:
initial_state = [
    [1, 2, 3],
    [0, 4, 6],
    [7, 5, 8]
]

goal_state = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 0]
]

solution = solve_8_puzzle(initial_state, goal_state)

if solution == "Unsolvable":
    print("The puzzle is unsolvable.")
else:
    print("Solution steps:")
    for i, state in enumerate(solution):
        print(f"Step {i}:")
        for row in state:
            print(row)
