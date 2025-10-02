matrices = [
    [
        [1, 2, 3, 4, 5, 6, 0, 1],
        [2, 3, 4, 5, 6, 0, 1, 2],
        [3, 4, 5, 6, 0, 1, 2, 3],
        [4, 5, 6, 0, 1, 2, 3, 4],
        [5, 6, 0, 1, 2, 3, 4, 5],
        [6, 0, 1, 2, 3, 4, 5, 6],
        [0, 1, 2, 3, 4, 5, 6, 0],
        [1, 2, 3, 4, 5, 6, 0, 1]
    ],
    [
        [6, 5, 4, 3, 2, 1, 0, 6],
        [5, 4, 3, 2, 1, 0, 6, 5],
        [4, 3, 2, 1, 0, 6, 5, 4],
        [3, 2, 1, 0, 6, 5, 4, 3],
        [2, 1, 0, 6, 5, 4, 3, 2],
        [1, 0, 6, 5, 4, 3, 2, 1],
        [0, 6, 5, 4, 3, 2, 1, 0],
        [6, 5, 4, 3, 2, 1, 0, 6]
    ]
]
import numpy as np
print(np.matmul(matrices[0], matrices[1]))
def init_matrices(data_file):
    with open(data_file, "w") as f:
        for matrix in matrices:
            for row in matrix:
                for val in row:
                    f.write(f"{val:08b}\n")