require 'rails_helper'

RSpec.describe ThanksAntsHelper, type: :helper do

  class TestError < StandardError
  end

  describe 'validate_input' do

    it 'rejects non alphabetical strings' do
      expect{helper.validate_input('4', TestError, 'foo')}.to raise_error(TestError, /unfoo/)
    end

    it 'rejects strings with no vowels' do
      expect{helper.validate_input('bbbb', TestError, 'foo')}.to raise_error(TestError, /bbbb.+no vowels/)
    end

    it 'rejects invalid URLs' do
      expect{helper.validate_input('foo/bar', TestError, 'foo')}.to raise_error(TestError, /unfoo/)
    end

    it 'rejects empty requests' do
      expect{ helper.validate_input('', TestError, 'foo') }.to raise_error(TestError, /unfoo/)
    end

    it 'strips out leading and trailing whitespace' do
      expect(helper.validate_input('  Helper ', TestError, 'foo')).to eq('helper')
    end

    it 'compresses multiple spaces into a single space' do
      input = 'test      input'
      expect(helper.validate_input(input, TestError, 'foo')).to eq('test input')
      expect(input).to eq('test      input')
    end

    it 'considers "y" a vowel' do
      expect(helper.validate_input('skyler', TestError, 'foo')).to eq('skyler')
    end

    it 'downcases the input' do
      expect(helper.validate_input('BOB', TestError, 'foo')).to eq('bob')
    end

  end

end
