require 'rails_helper'

RSpec.describe ThanksAntsHelper, type: :helper do

  describe 'validate_input' do

    it 'rejects non alphabetical strings' do
      expect{helper.validate_input('4', 'foo')}.to raise_error(/unfoo/)
    end

    it 'rejects strings with no vowels' do
      expect{helper.validate_input('bbbb', 'foo')}.to raise_error(/bbbb.+no vowels/)
    end

    it 'rejects invalid URLs' do
      expect{helper.validate_input('foo/bar', 'foo')}.to raise_error(/unfoo/)
    end

    it 'rejects empty requests' do
      expect{ helper.validate_input('', 'foo') }.to raise_error(/unfoo/)
    end

    it 'strips out leading and trailing whitespace' do
      expect(helper.validate_input('  Helper ', 'foo')).to eq('helper')
    end

    it 'compresses multiple spaces into a single space' do
      input = 'test      input'
      expect(helper.validate_input(input, 'foo')).to eq('test input')
      expect(input).to eq('test      input')
    end

    it 'considers "y" a vowel' do
      expect(helper.validate_input('skyler', 'foo')).to eq('skyler')
    end

    it 'downcases the input' do
      expect(helper.validate_input('BOB', 'foo')).to eq('bob')
    end

  end

end
