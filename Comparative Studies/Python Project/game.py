import os
import time
import sys
import grid

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear') # Everytime after 2 sec sleep it will clear the screen

#Setup the title according to the requirement
def title():
    print("-------------")
    print("| PEEK-A-BOO |")
    print("-------------")

#Display menu and also added one more feature that is "show up current score".
def display_menu():
    print("\nMenu:")
    print("1. Let me select two elements")
    print("2. Uncover one element")
    print("3. Show the current score")
    print("4. I give up - reveal the grid")
    print("5. New game")
    print("6. Quit")

def user_input():
    choice = input("\nEnter your choice: ")
    return choice

def cell_coordinates_position(position):
    cell = input("Enter the position of cell {}: ".format(position))
    return cell

def reveal_All_Cells(cells):
    for cell in cells:
        cell.reveal()

def hide_cells(cells):
    for cell in cells:
        cell.hide()

def Grid_output(game_grid):
    size_of_grid = game_grid.Size_of_grid()
    column_names = " ".join(game_grid.get_column_names())
    print("\n  " + column_names)
    for i in range(size_of_grid):
        row = game_grid.get_row(i)
        row_values = " ".join(row)
        print(str(i) + " " + row_values)

def calculate_score(minimum_guesses, actual_guesses):
    return (minimum_guesses / actual_guesses) * 100

def play_game():
    clear_screen()
    title()
    size_of_grid = int(sys.argv[1])
    
    if int(size_of_grid) == 2 or int(size_of_grid) == 4 or int(size_of_grid) == 6:
        try:
            size_of_grid = int(size_of_grid)
        except ValueError:
            print("Grid size is Invalid!!.")
            return

        game_grid = grid.Grid(size_of_grid)
        minimum_guesses = (size_of_grid ** 2) // 2
        actual_guesses = 0
        manually_uncovered = False  # Flag to track if all cells were manually uncovered without making any guesses

        while True:
            clear_screen()
            title()
            Grid_output(game_grid)
            display_menu()
            choice = user_input()

            if choice == '1':
                cell_1 = cell_coordinates_position(1)
                cell_2 = cell_coordinates_position(2)
                cell_1_position = game_grid.get_cell(cell_1)
                cell_2_position = game_grid.get_cell(cell_2)
                try:
                    reveal_All_Cells([cell_1_position, cell_2_position])
                    Grid_output(game_grid)
                    actual_guesses = actual_guesses + 1
                    if cell_1_position.get_value() == cell_2_position.get_value():
                        print("You found a pair!")
                        game_grid.increase_score()
                        time.sleep(2)
                    else:
                        print("Not a match!")
                        hide_cells([cell_1_position, cell_2_position])
                        time.sleep(2)
                except:
                    print("")

            elif choice == '2':
                cell_position = cell_coordinates_position("to uncover")
                cell = game_grid.get_cell(cell_position)
                try:
                    reveal_All_Cells([cell])
                    Grid_output(game_grid)

                    actual_guesses += 1
                    time.sleep(2)
                except:
                    print("")

            elif choice == '3':
                score = game_grid.get_score()
                print("Current score: {}".format(score))
                time.sleep(2)

            elif choice == '4':
                reveal_All_Cells(game_grid.get_all_cells())
                Grid_output(game_grid)
                time.sleep(2)
                break

            elif choice == '5':
                game_grid.reset()
                actual_guesses = 0
                print("New game started.")
                time.sleep(2)

            elif choice == '6':
                print("Thank you for playing!")
                break

            else:
                print("Invalid choice. Please try again.")
                print("Choice must be 1 to 6")
                time.sleep(2)
        
        # Check if all cells were manually uncovered without making any guesses
        if actual_guesses == 0 and not manually_uncovered:
            manually_uncovered = True

        if not manually_uncovered:
            try:
                final_score = calculate_score(minimum_guesses, actual_guesses)
                print("Congratulations! You found all pairs.")
                print("Your score:", final_score)
            except:
                print("Your score is 0")
        else:
            print("\nYou Cheated - Loser! Your score is 0!")
    else:
        print("Grid size must be 2, 4, or 6")
        print("****Please run the code again!****")

if __name__ == "__main__":
    play_game()
