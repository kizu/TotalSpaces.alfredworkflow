require 'totalspaces2'

def go_to_space(query)
    target_space = query.downcase
    current_space = TotalSpaces2.current_space
    number_of_spaces = TotalSpaces2.number_of_spaces

    move_to = 0

    if target_space.to_i > 0 and target_space.to_i <= number_of_spaces
        move_to = target_space.to_i
    end

    best_guess = 0
    if move_to == 0 and target_space != ""
        for space in 1..TotalSpaces2.number_of_spaces
            name_for_space = TotalSpaces2.name_for_space(space).downcase
            if name_for_space.downcase == target_space
                move_to = space
                break
            elsif best_guess == 0 and name_for_space.start_with?(target_space)
                best_guess = space
            end
        end
    end

    if move_to == 0 and best_guess > 0
        move_to = best_guess
    end

    if move_to > 0
        TotalSpaces2.move_to_space(move_to)
    end
end
