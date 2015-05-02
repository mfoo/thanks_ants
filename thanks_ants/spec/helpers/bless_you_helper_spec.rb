require 'rails_helper'

RSpec.describe BlessYouHelper, type: :helper do

  describe 'blessyou' do

    before do
      expect(helper).to receive(:validate_input).and_call_original
    end

    it { expect(helper.blessyou('Matt')).to eq('Blatt') }

    it { expect(helper.blessyou('Bob')).to eq('Blob') }

    it { expect(helper.blessyou('Bob Marley')).to eq('Blob Marley') }

  end

end
