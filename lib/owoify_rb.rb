# frozen_string_literal: true

require 'structures/word'
require 'utility/interleave_arrays'
require 'utility/presets'

# Owoify module is the main module where owoify function lies in.
# Since owoify is literally just a function, users are expected to invoke owoify by calling Owoify.owoify().
module Owoify
  # The main entry point of the owoify function.
  # Pass in the source string and the desired owoify level.
  # @param [String] source The source string to owoify.
  # @param [Symbol] level The desired owoness level of the result string.
  # @return [String] The owoified string according to the specified owoness level.
  def self.owoify(source, level = :owo)
    word_matches = source.scan(/[^\s]+/).flatten
    space_matches = source.scan(/\s+/).flatten
    words = word_matches.map { |x| Word.new(x) }
    spaces = space_matches.map { |x| Word.new(x) }
    words.map! do |w|
      SPECIFIC_WORD_MAPPING_LIST.each do |f|
        w = f.call(w)
      end
      case level
      when :owo
        OWO_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
      when :uwu
        UWU_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
        OWO_MAPPING_LIST.each do |f|
          w = f.call(w)
        end
      when :uvu
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

  # Owoify the source string using :uwu owoness.
  # @param [String] source The source string to owoify
  # @return [String] The owoified string using :uwu owoness level.
  def self.uwuify(source)
    self.owoify(source, :uwu)
  end

  # Owoify the source string using :uvu owoness.
  # @param [String] source The source string to owoify
  # @return [String] The owoified string using :uvu owoness level.
  def self.uvuify(source)
    self.owoify(source, :uvu)
  end
end
