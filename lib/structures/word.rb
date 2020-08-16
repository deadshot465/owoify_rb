# frozen_string_literal: true

require 'set'

class Word
  def initialize(word)
    @replaced_words = Set.new
    @word = word
  end

  def to_s
    @word
  end

  private

  def search_value_contains_replaced_words(search_value, replace_value)
    @replaced_words.any? do |word|
      if search_value.match? word
        match_result = search_value.match(word)[0]
        return word.gsub(match_result, replace_value) == replace_value
      end
      false
    end
  end

  public

  def replace(search_value, replace_value, replace_replaced_words = false)
    return self if !replace_replaced_words && search_value_contains_replaced_words(search_value, replace_value)

    replacing_word = @word
    replacing_word = @word.gsub(search_value, replace_value) if search_value.match? @word
    collection = @word.scan(search_value).flatten
    replaced_words = collection.length > 1 ? collection.map { |x| x.gsub(x, replace_value) } : []

    if replacing_word != @word
      replaced_words.each do |word|
        @replaced_words.add(word)
      end
      @word = replacing_word
    end
    self
  end

  def replace_with_func_single(search_value, func, replace_replaced_words = false)
    replace_value = func.call

    return self if !replace_replaced_words && search_value_contains_replaced_words(search_value, replace_value)

    replacing_word = @word
    if search_value.match? @word
      match = @word.match(search_value)[0]
      replacing_word = @word.gsub(match, replace_value)
    end
    collection = @word.scan(search_value).flatten
    replaced_words = collection.length > 1 ? collection.map { |x| x.gsub(x, replace_value) } : []
    if replacing_word != @word
      replaced_words.each do |word|
        @replaced_words.add(word)
      end
      @word = replacing_word
    end
    self
  end

  def replace_with_func_multiple(search_value, func, replace_replaced_words = false)
    return self unless search_value.match? @word

    word = @word
    captures = search_value.match(word)
    replace_value = func.call(captures[1], captures[2])

    return self if !replace_replaced_words && search_value_contains_replaced_words(search_value, replace_value)

    replacing_word = @word.gsub(captures[0], replace_value)
    collection = @word.scan(search_value).flatten
    replaced_words = collection.length > 1 ? collection.map { |x| x.gsub(x, replace_value) } : []
    if replacing_word != @word
      replaced_words.each do |w|
        @replaced_words.add(w)
      end
      @word = replacing_word
    end
    self
  end
end
