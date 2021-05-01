# frozen_string_literal: true

require 'owoify_rb'
require 'rspec'

RSpec.describe 'owoify_rb' do
  it 'should not be equal to the source string' do
    expect(Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?',
                         'owo')).not_to eql('Hello World! This is the string to owo! Kinda cute, isn\'t it?')
  end

  context 'when the level is owo' do
    let(:result) { Owoify.owoify('Hello World', 'owo') }
    it 'should owoify correctly' do
      expect(result).not_to eql('')
    end
  end

  context 'when the level is uwu' do
    let(:result) { Owoify.owoify('Hello World', 'uwu') }
    it 'should owoify correctly' do
      expect(result).not_to eql('')
    end
  end

  context 'when the level is uvu' do
    let(:result) { Owoify.owoify('Hello World', 'uvu') }
    it 'should owoify correctly' do
      expect(result).not_to eql('')
    end
  end

  context 'when the level is undefined' do
    it 'should not owoify correctly' do
      expect { Owoify.owoify('Hello World', '123') }.to raise_error(ArgumentError)
    end
  end

  context 'when the levels are different' do
    let(:owo) { Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?', 'owo') }
    let(:uwu) { Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?', 'uwu') }
    let(:uvu) { Owoify.owoify('Hello World! This is the string to owo! Kinda cute, isn\'t it?', 'uvu') }

    it 'should not be equal' do
      expect(owo).not_to eql(uwu)
    end

    it 'should not be equal' do
      expect(uwu).not_to eql(uvu)
    end

    it 'should not be equal' do
      expect(owo).not_to eql(uvu)
    end
  end
end
