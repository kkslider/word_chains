require 'set'

def adjacent_words(word)
  adj_word_dict = construct_adj_word_dict(word, "dictionary.txt")
  
  # p word_hash
end

def construct_adj_word_dict(word, dictionary)
  contents = File.readlines(dictionary).map(&:chomp)
  contents.delete_if { |dict_word| dict_word.length != word.length }
  contents = delete_words_not_valid(word, contents)
  contents.delete(word)
  # word_hash = Hash.new { |hash, key| hash[key] = [] }
  contents
  
  
  
  # contents.each_index do |index|
  #   if index == 0
  #     word_hash[contents[index]] << contents[index + 1]
  #   elsif index == contents.length - 1
  #     word_hash[contents[index]] << contents[index - 1]
  #   else
  #     word_hash[contents[index]] << contents[index - 1] << contents[index + 1]
  #   end
  # end
  
  # word_list
end

def delete_words_not_valid(word, word_list)
  return_array = []
  word_list.each do |list_word|
    uncommon_letter_count = 0
    list_word.split("").each_with_index do |letter, index|
      word_copy = word.dup.split("")
      if letter != word_copy[index]
        uncommon_letter_count += 1
      end
    end
    
    return_array << list_word if uncommon_letter_count < 2
  end
  
  return_array
end

              # hi          # to
def find_chain(start_word, end_word, dictionary)
  
  current_words = Set.new
  new_words = Set.new
  visited_words = {}
  visited_words[start_word] = nil
  current_words.add(start_word)
  found = false
  
  until found
    current_words.each do |word|

      add_adj_words_to_new_set(word, new_words)
      
      new_words.each do |new_word|
        visited_words[new_word] = word
        if new_word == end_word
          found = true
          break
        end
      end
      # break if found
        
      # current_words.clear
      # new_words.each do |word|
   #      current_words.add(word)
   #    end
      
      # new_words.clear
      # first_word = current_words.shift
      # add_adj_words_to_set(first_word, new_words)
      # new_words.
      
    end
    current_words = new_words
    new_words = Set.new
  end
  
  visited_words
end


def add_adj_words_to_new_set(word, new_words)
  adj_list = adjacent_words(word)
  adj_list.each do |adj_word|
    new_words.add(adj_word)
    # visited_words[adj_word] = word
  end
end



def build_chain(visited_words, word)
end

# p adjacent_words("hi")
