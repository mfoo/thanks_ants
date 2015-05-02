require 'rails_helper'

RSpec.describe ThanksHelper, type: :helper do

  describe 'thanks' do

    before do
      expect(helper).to receive(:validate_input).and_call_original
    end

    it { expect(helper.thanks('Matt')).to eq('Thatt') }

    it { expect(helper.thanks('Bob')).to eq('Thob') }

    it { expect(helper.thanks('Bob Marley')).to eq('Thob marley') }

  end

end
