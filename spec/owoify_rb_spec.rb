# frozen_string_literal: true

require 'owoify_rb'
require 'rspec'

SOURCE = 'Hello World! This is the string to owo! Kinda cute, isn\'t it?'
POKEMON_NAME_LIST_PATH = File.expand_path('./assets/pokemons.txt')
WAR_AND_PEACE_PATH = File.expand_path('./assets/war_and_peace_chapter01-20.txt')
POKEMON_NAME_LIST = File.readlines(POKEMON_NAME_LIST_PATH)
WAR_AND_PEACE_TEXT = File.read(WAR_AND_PEACE_PATH)

RSpec.describe 'owoify_rb' do
  it 'should not be equal to the source string' do
    expect(Owoify.owoify(SOURCE, :owo)).not_to eql(SOURCE)
  end

  context 'when the level is owo' do
    let(:result) { Owoify.owoify(SOURCE, :owo) }
    it 'should owoify correctly' do
      expect(result).not_to eql('')
      expect(result).not_to eql(nil)
    end
  end

  context 'when the level is uwu' do
    let(:result) { Owoify.owoify(SOURCE, :uwu) }
    it 'should owoify correctly' do
      expect(result).not_to eql('')
      expect(result).not_to eql(nil)
    end
  end

  context 'when the level is uvu' do
    let(:result) { Owoify.owoify(SOURCE, :uvu) }
    it 'should owoify correctly' do
      expect(result).not_to eql('')
      expect(result).not_to eql(nil)
    end
  end

  context 'when the level is undefined' do
    it 'should not owoify correctly' do
      expect { Owoify.owoify(SOURCE, :abc) }.to raise_error(ArgumentError)
    end
  end

  context 'when the levels are different' do
    let(:owo_text) { Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?', :owo) }
    let(:uwu_text) { Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?', :uwu) }
    let(:uvu_text) { Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?', :uvu) }

    it 'should not be equal' do
      expect(:owo_text).not_to eql(:uwu_text)
    end

    it 'should not be equal' do
      expect(:uwu_text).not_to eql(:uvu_text)
    end

    it 'should not be equal' do
      expect(:owo_text).not_to eql(:uvu_text)
    end
  end

  it 'should owoify pokemon names' do
    POKEMON_NAME_LIST.each do |name|
      name_with_owo = Owoify.owoify(name)
      name_with_uwu = Owoify.owoify(name, :uwu)
      name_with_uvu = Owoify.owoify(name, :uvu)
      expect(name_with_owo).not_to eql('')
      expect(name_with_uwu).not_to eql('')
      expect(name_with_uvu).not_to eql('')
      expect(name_with_owo).not_to eql(nil)
      expect(name_with_uwu).not_to eql(nil)
      expect(name_with_uvu).not_to eql(nil)
    end
  end

  it 'should owoify long text' do
    text_with_owo = Owoify.owoify(WAR_AND_PEACE_TEXT)
    text_with_uwu = Owoify.owoify(WAR_AND_PEACE_TEXT, :uwu)
    text_with_uvu = Owoify.owoify(WAR_AND_PEACE_TEXT, :uvu)
    expect(text_with_owo).not_to eql('')
    expect(text_with_uwu).not_to eql('')
    expect(text_with_uvu).not_to eql('')
    expect(text_with_owo).not_to eql(nil)
    expect(text_with_uwu).not_to eql(nil)
    expect(text_with_uvu).not_to eql(nil)
  end
end
