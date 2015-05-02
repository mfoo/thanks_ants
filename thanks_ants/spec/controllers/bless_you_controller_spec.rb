require 'rails_helper'

RSpec.describe BlessYouController, type: :controller do

  render_views

  subject { get :bless_you, blessee: 'bob', format: :json }

  it 'responds with the correct value' do
    expect(controller).to receive(:blessyou).with('bob').and_call_original
    expect(subject).to be_ok
    expect(subject.body).to eq({blessyou: 'Blob'}.to_json)
  end

end
