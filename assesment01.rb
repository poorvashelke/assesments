  # Write a function anagrams(str1, str2) that takes in two words and returns a boolean
  # indicating whether or not the words are anagrams. Anagrams are words that
  # contain the same characters but not necessarily in the same order. Solve this
  # without using Array#sort
  def anagrams(str1, str2)
    letters = Hash.new(0)

    str1.split('').each do |char|
      letters[char] += 1
    end

    str2.split('').each do |char|
      letters[char] -= 1
    end

    letters.all? { |_, v| v.zero? }
  end

  #_____________________________________________________________
  def longest_palindrome(string)
    longest_palindrome = false
    i = 0

    while i < string.length - 1
      j = i + 1

      while j < string.length
        curr_string = string[i..j]
        len = curr_string.length

        if is_palindrome?(curr_string)
          longest_palindrome = len if !longest_palindrome || len > longest_palindrome
        end

        j += 1
      end

      i += 1
    end

    longest_palindrome
  end

  def is_palindrome?(str)
    str == str.reverse
  end


  #_____________________________________________________________
  # Write a method that returns an array of all the subwords 
  # of the string that appear in the dictionary argument. 
  # The method does NOT return any duplicates.
  class String
    def real_words_in_string(dictionary)
      real_words = []

      (0...self.length).each do |idx|
        (idx...self.length).each do |jdx|
          curr_word = self[idx..jdx]
          next if real_words.include?(curr_word)
          
          real_words << curr_word if dictionary.include?(curr_word)
        end
      end
      
      real_words
    end
  end
  #_____________________________________________________________
  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
      symm_subs = []

      self.length.times do |start_pos|
        (2..(self.length - start_pos)).to_a.each do |end_pos|
          substr = self[start_pos...(start_pos + end_pos)]
          symm_subs << substr if substr == substr.reverse
        end
      end

      symm_subs
    end
  #_____________________________________________________________
  LITTLE_WORDS = [
    "a",
    "and",
    "of",
    "over",
    "the"
  ].freeze

  def titleize(title)
    words = title.split(" ")
    result_words = []
    idx = 0
    words.each do |word|
      if idx > 0 && LITTLE_WORDS.include?(word)
        result_words << word.downcase
      else
        result_words << word.capitalize
      end
      idx += 1
    end

    result_words.join(" ")
  end
  #_____________________________________________________________
  class Array
    def my_bsearch(target)
      return nil if size == 0
      mid = size/2

      case self[mid] <=> target
      when 0
        return mid
      when 1
        return self.take(mid).my_bsearch(target)
      else
        search_res = self.drop(mid+1).my_bsearch(target)
        search_res.nil? ? nil : mid + 1 + search_res
      end
    end
  end
  #_____________________________________________________________
  def bubble_sort!(&prc)
      # With a proc
      prc ||= Proc.new { |x, y| x <=> y }

      sorted = false
      until sorted
        sorted = true

        self.each_with_index do |el, i|
          next if i + 1 == self.length
          j = i + 1
          if prc.call(self[i], self[j]) == 1
            sorted = false
            self[i], self[j] = self[j], self[i]
          end
        end
      end

      self
    end
  #_____________________________________________________________
  # Write a method that takes a string and an alphabet. It returns a copy of the string
  # with the letters re-ordered according to their positions in the alphabet. If
  # no alphabet is passed in, it defaults to normal alphabetical order (a-z).

  # Example:
  # jumble_sort("hello") => "ehllo"
  # jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
  def jumble_sort(str, alphabet = nil)
    alphabet ||= ('a'..'z').to_a

    sorted = false
    until sorted
      sorted = true
      (0...str.length - 1).to_a.each do |i|
        if alphabet.index(str[i]) > alphabet.index(str[i + 1])
          str[i], str[i + 1] = str[i + 1], str[i]
          sorted = false
        end
      end
    end
    str
  end
  #_____________________________________________________________
    def merge_sort(&prc)
      # See how I create a Proc if no block was given; this eliminates
      # having to later have two branches of logic, one for a block and
      # one for no block.
      prc ||= Proc.new { |x, y| x <=> y }

      return self if self.count <= 1

      midpoint = self.count / 2
      sorted_left = self.take(midpoint).merge_sort(&prc)
      sorted_right = self.drop(midpoint).merge_sort(&prc)

      Array.merge(sorted_left, sorted_right, &prc)

    end

    private
    def self.merge(left, right, &prc)
      merged = []

      until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
          merged << left.shift
        when 0
          merged << left.shift
        when 1
          merged << right.shift
        end
      end

      merged.concat(left)
      merged.concat(right)

      merged # or merged + left + right
    end

  #_____________________________________________________________
  def my_quick_sort(&prc)
      prc ||= proc {|a, b| a<=>b}
      return self if size < 2

      pivot = first
      left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
      right = self[1..-1].select{|el| prc.call(el, pivot) != -1}
      left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
    end
  #_____________________________________________________________
  def deep_dup(arr)
    arr.map{ |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

  #_____________________________________________________________
  
# Write an Array#dups method that will return a hash containing the indices of all
# duplicate elements. The keys are the duplicate elements; the values are
# arrays of their indices in ascending order, e.g.
# [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

    def dups
      positions = Hash.new { |h, k| h[k] = [] }

      self.each_with_index do |item, index|
        positions[item] << index
      end

      positions.select { |key, val| val.count > 1 }
    end
  #_____________________________________________________________
   Write a method that returns b^n recursively. 
  # Your solution should accept negative values for n.
  def exponent(b, n)
    return 1 if n == 0
    if n > 0
      b * exponent(b, n - 1)
    else
      1.0/b * exponent(b, n + 1)
    end
  end

  #_____________________________________________________________
  # Write a method that finds the factors of a 
  # number in ascending order recursively.
  def factorials_rec(num)
    return [1] if num == 1
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
  #_____________________________________________________________
  # Write a method that returns the factors of a number in ascending order.
  def factors(num)
    return nil if num <= 0
    return [1] if num == 0
    (1..num).select { |i| (num % i) == 0 }
  end
  #_____________________________________________________________
  # Write a method that finds the sum of the first n fibonacci numbers recursively. 
  # Assume n > 0.
  def fibs_sum(n)
    return 0 if n == 0
    return 1 if n == 1

    fibs_sum(n-1) + fibs_sum(n-2) + 1
  end
  #_____________________________________________________________
  # Write a recursive method that returns the sum of the first n even numbers
  # recursively. Assume n > 0.
  def first_even_numbers_sum(n)
    return 2 if n == 1
    2 * n + first_even_numbers_sum(n-1)
  end

  #_____________________________________________________________
  def digital_root(num)
    num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))
  end
  # Alternate Solution
  def digital_root(num)
    digits = []

    while num > 0
      digits << num % 10
      num /= 10
    end

    digit_sum = digits.inject(&:+)

    digit_sum >= 10 ? digital_root(digit_sum) : digit_sum
  end

  #_____________________________________________________________
  # Write a recursive method that takes in a base 10 number n and
  # converts it to a base b number. Return the new number as a string
  #
  # E.g. base_converter(5, 2) == "101"
  # base_converter(31, 16) == "1f"

  def base_converter(num, b)
    return num.to_s if [0,1].include?(num)

    digits = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
    base_converter(num/b, b) + digits[num % b]
  end
  #_____________________________________________________________
  def median
      return nil if empty?
      sorted = self.sort
      if length.odd?
        sorted[length / 2]
      else
        (sorted[length / 2] + sorted[length / 2 - 1]).fdiv(2)
      end
    end

  #_____________________________________________________________
  def is_prime?(num)
    return false if num < 2
    (2...num).none? { |factor| num % factor == 0 }
  end

  def primes(count)
    primes = []

    i = 2
    until primes.count >= count
      primes << i if is_prime?(i)

      i += 1
    end

    primes
  end
  #_____________________________________________________________

  # Write a recursive function that returns the prime factorization of
  # a given number. Assume num > 1
  #
  # prime_factorization(12) => [2,2,3]

  def prime_factorization(num)
    # Base case - 1 is not a prime so we return an empty array here
    return [] if num == 1
    
    # initialize i to 2, since it is the first prime #
    i = 2
    
    # increment i until we find a prime factor
    i += 1 until is_prime?(i) && num % i == 0 
    
    # Add i to prime factors and make recursive call to find rest
    [i] + prime_factorization(num / i)
  end

  def is_prime?(num)
    return false if num < 2
    (2...num).none? { |n| num % n == 0 }
  end
  #_____________________________________________________________
  def subsets(array)
    return [[]] if array.length == 0
    last = array.pop
    prev_subs = subsets(array)
    prev_subs + prev_subs.map {|el| el + [last]}
  end

  #_____________________________________________________________
  # Write a method that returns the sum of all elements in an array recursively
  def rec_sum(nums)
    return 0 if nums.empty?
    nums[0] + rec_sum(nums.drop(1))
  end

  #_____________________________________________________________
  def string_include_key?(string, key)
    return true if key.length == 0

    next_key_char = key.chars.first
    key_index = string.index(next_key_char)

    return false if key_index.nil?
    string_include_key?(string[key_index+1..-1], key[1..-1])
  end
  #_____________________________________________________________
  def two_sum
      pairs = []
      
      self.each_index do |i|
        ((i + 1)...self.length).to_a.each do |j|
          pairs << [i, j] if self[i] + self[j] == 0
        end
      end

      pairs
    end
  #_____________________________________________________________

  def pig_latinify(sentence)
    translated_words = sentence.split(" ").map do |word|
      translate_word(word)
    end
    translated_words.join(" ")
  end

  def translate_word(word)
    vowels = %w(a e i o u)
    if vowels.include?(word[0])
      "#{word}ay"
    else
      phoneme_end = 0
      until vowels.include?(word[phoneme_end])
        phoneme_end += 1
      end
      phoneme_end += 1 if word[phoneme_end - 1] == "q" && word[phoneme_end] == "u"
      "#{word[phoneme_end..-1]}#{word[0...phoneme_end]}ay"
    end
  end
  #_____________________________________________________________
  def permutations(array)
    return [array] if array.length <= 1


    # Similar to the subsets problem, we observe that to get the permutations
    # of [1, 2, 3] we can look at the permutations of [1, 2] which are
    # [1, 2] and [2, 1] and add the last element to every possible index getting
    # [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1], [2, 1, 3]

    # pop off the last element
    first = array.shift
    # make the recursive call
    perms = permutations(array)
    # we will need an array to store all our different permutations
    total_permutations = []


    # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
    # and for each permutation add first into every index. This new subarray
    # gets added to total_permutations.
    perms.each do |perm|
      (0..perm.length).to_a.each do |i|
        total_permutations << perm[0...i] + [first] + perm[i..-1]
      end
    end
    total_permutations
  end
  #_____________________________________________________________
  # Write a recursive method that generates the number of possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the row, column, or diagonal. A skeleton for a possible solution is 
  # provided. Feel free to create your own solution from scratch.
  class EightQueens
    attr_accessor :rows, :diags1, :diags2

    def initialize
      @rows = Array.new(8, false)
      @diags1 = Array.new(14, false)
      @diags2 = Array.new(14, false)
    end

    def backtrack(row = 0, count = 0)
      (0...8).each do |col|
        if is_not_under_attack(row, col)
          place_queen(row, col)
          if row + 1 == 8
            count += 1
          else 
            count = backtrack(row + 1, count)
          end
          remove_queen(row, col)
        end
      end 
      count
    end

    def is_not_under_attack(row, col)
      return !(rows[col] || diags1[row - col] || diags2[row + col])
    end

    def place_queen(row, col)
      rows[col] = true
      diags1[row - col] = true
      diags2[row + col] = true
    end

    def remove_queen(row, col)
      rows[col] = false
      diags1[row - col] = false
      diags2[row + col] = false 
    end
  end

  # eight_queens = EightQueens.new()
  # eight_queens.backtrack

  #_____________________________________________________________

  # See question here: http://web.archive.org/web/20130215052843/http://rubyquiz.com/quiz154.html
  # Write a recursive method to solve `make better change`.

  # HINT: To make_better_change, we only take one coin at a time and
  # never rule out denominations that we've already used.
  # This allows each coin to be available each time we get a new remainder.
  # By iterating over the denominations and continuing to search
  # for the best change, we assure that we test for 'non-greedy' uses
  # of each denomination.

  # make_better_change(24, [10,7,1]) should return [10,7,7]
  def make_better_change(value, coins)
    return nil if coins.empty?
    return [] if value == 0

    change = []
    coins = coins.sort.reverse.select{|coin| coin <= value}
    coins.each do |coin|
      remainder = value - coin
      if remainder > 0
        best_remainder = make_better_change(remainder, coins)
        change << [coin] + best_remainder unless best_remainder.nil?
      else
        change << [coin]
      end
    end
    change.sort_by!{|arr| arr.size}.first
  end


