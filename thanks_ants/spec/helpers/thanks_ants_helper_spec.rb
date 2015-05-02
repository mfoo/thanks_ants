require 'rails_helper'

RSpec.describe ThanksAntsHelper, type: :helper do

  class TestError < StandardError
  end

  describe 'validate_input' do

    it 'rejects non alphabetical strings' do
      expect{helper.validate_input('4', TestError, 'foo')}.to raise_error(TestError, /unfoo/)
    end

    it 'rejects strings with no vowels' do
      expect{helper.validate_input('sky', TestError, 'foo')}.to raise_error(TestError, /sky.+no vowels/)
    end

    it 'rejects invalid URLs' do
      expect{helper.validate_input('foo/bar', TestError, 'foo')}.to raise_error(TestError, /unfoo/)
    end

    it 'rejects empty requests' do
      expect{ helper.validate_input('', TestError, 'foo') }.to raise_error(TestError, /unfoo/)
    end

    it 'strips out leading and trailing whitespace and returns the index of the first vowel' do
      expect(helper.validate_input('  Helper ', TestError, 'foo')).to eq(1)
    end

    it 'mutates the input to compress multiple spaces into a single space' do
      # TODO: This API is weird. Should this be validate_input! or a second method?
      input = 'Test      input'
      expect(helper.validate_input(input, TestError, /foo/)).to eq(1)
      expect(input).to eq('Test input')
    end

  end

end
