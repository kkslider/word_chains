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

              # hello      # world
def find_chain(start_word, end_word, dictionary)
  current_words = Set.new
  new_words = Set.new
  visited_words = {}
  current_words.add(start_word)
  add_adj_words_to_set(start_word, new_words)
  
  
  
end


def add_adj_words_to_set(word, new_words)
  adj_list = adjacent_words(word)
  adj_list.each do |adj_word|
    new_words.add(adj_word)
  end
end



def build_chain(visited_words, word)
end

# adjacent_words("dictionary.txt")