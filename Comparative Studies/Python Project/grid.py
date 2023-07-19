import random

class Grid:
    def __init__(self, size):
        self.size = size
        self.cells = []
        self.score = 0
        self.column_names = []
        for i in range(size):
            self.column_names.append(chr(65 + i))

        self.generate_cells()

    def generate_cells(self):
        size_ = [i // 2 for i in range(self.size ** 2)]
        pairs = size_
        random.shuffle(pairs)
        self.cells = self.get_cell_pairs(pairs)

    def get_cell_pairs(self, pairs):
        return [Cell(pair) for pair in pairs] # Return cell pairs

    def Size_of_grid(self):
        return self.size # Return size of grid

    def get_column_names(self):
        return self.column_names # Return Column names

    def get_cell(self, position):
            upper_ = ord(position[0].upper()) - 65
            column = upper_
            row = int(position[1])
            return self.cells[row * self.size + column]
       
    def get_row(self, index):
        start = index * self.size
        end = start + self.size
        row_values = self.get_cell_row_values(end, start)
        return row_values

    def get_cell_row_values(self, end, start):
        row = self.cells[start:end]
        row_values = [str(cell.get_value()) if cell.is_visible() else "X" for cell in row]
        return row_values

    def get_all_cells(self):
        return self.cells

    def get_score(self):
        return self.score

    def increase_score(self):
        self.score += 1

    def reset(self):
        self.score = 0
        for cell in self.cells:
            cell.hide()


class Cell:
    def __init__(self, value):
        self.value = value
        self.visible = False

    def get_value(self):
        return self.value

    def is_visible(self):
        return self.visible

    def reveal(self):
        self.visible = True

    def hide(self):
        self.visible = False
