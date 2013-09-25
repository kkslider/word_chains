require 'set'

def adjacent_words(word)
  adj_word_dict = construct_adj_word_dict(word, "dictionary.txt")
  p "DICTIONARY LENGTH: #{adj_word_dict.length}"
  adj_word_dict
end

def construct_adj_word_dict(word, dictionary)
  contents = File.readlines(dictionary).map(&:chomp)
  contents.delete_if { |dict_word| dict_word.length != word.length }
  contents = delete_words_not_valid(word, contents)
  contents.delete(word)
  contents  
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

def find_chain(start_word, end_word, dictionary)
  beginning_time = Time.now
  current_words = Set.new
  new_words = Set.new
  visited_words = {}
  visited_words[start_word] = nil
  current_words.add(start_word)
  found = false
  
  
  until found
    current_words.each do |word|
      adj_list = adjacent_words(word).select { |word| !visited_words.has_key?(word) }
      
      adj_list.each do |adj_word|
        new_words.add(adj_word) 
        visited_words[adj_word] = word
        if visited_words.keys.include?(end_word)
          found = true
          break
        end
      end 
    end
    
    current_words = new_words
    new_words = Set.new
  end
  end_time = Time.now
  puts "Time elapsed: #{(end_time - beginning_time)*1000} milliseconds"
  p visited_words
  build_chain(visited_words, end_word)
end

def build_chain(visited_words, word)
  return [] if word.nil?
  chain = build_chain(visited_words, visited_words[word]) + [word]
end

