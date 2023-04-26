# Write a program that calculates the score for a word in Scrabble.
# It should:
# * Ask the user for a word e.g. `apple`.
# * `puts` the score for the word in Scrabble by totalling the points
#   for each letter in the word.
#   * Points for each letter:
#     * 0 points: blank tile
#     * 1 point: E, A, I, O, N, R, T, L, S, U
#     * 2 points: D, G
#     * 3 points: B, C, M, P
#     * 4 points: F, H, V, W, Y
#     * 5 points: K
#     * 8 points: J, X
#     * 10 points: Q, Z

# * Note: You can assume that the user will enter a word that only
#   contains letters and blanks.  You can assume the word will be in
#   uppercase.

print "Enter a word: "
word = gets.chomp.upcase
score = 0

word.chars.each do |letter|
  case letter
  when "E", "A", "I", "O", "N", "R", "T", "L", "S", "U"
    score += 1
  when "D", "G"
    score += 2
  when "B", "C", "M", "P"
    score += 3
  when "F", "H", "V", "W", "Y"
    score += 4
  when "K"
    score += 5
  when "J", "X"
    score += 8
  when "Q", "Z"
    score += 10
  end
end

puts "Score: #{score}"