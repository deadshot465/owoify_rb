# frozen_string_literal: true

require 'structures/word'
require 'utility/interleave_arrays'
require 'utility/presets'

# Owoify module is the main module where owoify function lies in.
# Since owoify is literally just a function, users are expected to invoke owoify by calling Owoify.owoify().
module Owoify
  # The main entry point of the owoify function.
  # Pass in the source string and the desired owoify level.
  def self.owoify(source, level = 'owo')
    word_matches = source.scan(/[^\s]+/).flatten
    space_matches = source.scan(/\s+/).flatten
    words = word_matches.map { |x| Word.new(x) }
    spaces = space_matches.map { |x| Word.new(x) }
    actual_level = level.downcase
    words.map! do |w|
      SPECIFIC_WORD_MAPPING_LIST.each do |f|
        w = f.call(w)
      end
      case actual_level
      when 'owo'
        OWO_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
      when 'uwu'
        UWU_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
        OWO_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
      when 'uvu'
        UVU_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
        UWU_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
        OWO_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
      else
        raise ArgumentError, 'The specified owoify level is not supported.'
      end
      w
    end

    result = interleave_arrays(words, spaces)
    result_strings = result.map(&:to_s)
    result_strings.join
  end
end
