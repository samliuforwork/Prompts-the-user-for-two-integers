# Prompts the user for two integers.
# - The first one should be between 1 and 4, with
#   * 1 meaning initially looking North,
#   * 2 meaning initially looking East,
#   * 3 meaning initially looking South,
#   * 4 meaning initially looking West.
# - The second one should be positive. When written in base 3, its consecutive
#   digits read from left to right represent the directions to take, with
#   * 0 meaning going in the direction one is initially looking at,
#   * 1 meaning 45 degrees left of the direction one is initially looking at,
#   * 2 meaning 45 degrees right of the direction one is initially looking at.
#
# Prints out:
# - the direction one is originally looking at, as an arrow,
# - the representation of the second digit in base 3,
# - the corresponding sequence of directions to take, as arrows,
# - in case one is originally looking North or South, the path,
#   so the sequence of arrows again, but nicely displayed.
# - you may use the unicode array for output: ['↑', '↗', '→', '↘', '↓', '↙', '←', '↖']

begin
    print('Enter an integer between 1 and 4 and a positive integer: ')
    initial_direction, directions = gets.split()

    if initial_direction.size != 1 || directions.size > 1 && directions[0] == '0'
        raise ArgumentError
    end

    initial_direction = initial_direction.to_i
    directions = directions.to_i
    if ![1, 2, 3, 4].include?(initial_direction) || directions < 0
        raise ArgumentError
    end

    unicode_array = { 1=> "↑", 2=> "→", 3=> "↓", 4=> "←"}
    num_base3 = directions.to_s(base=3)
    print("Ok, you want to first look this way:#{unicode_array[initial_direction]}")
    print("In base 3, the second input reads as: #{num_base3}")

rescue ArgumentError => e
    print("Incorrect input, giving up.\n")
    exit
end
