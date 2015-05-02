require 'rails_helper'

RSpec.describe ThanksController, type: :controller do

  render_views

  subject { get :thank, thankee: 'bob', format: :json }

  it 'responds with the correct value' do
    expect(controller).to receive(:thanks).with('bob').and_call_original
    expect(subject).to be_ok
    expect(subject.body).to eq({thanks: 'Thob'}.to_json)
  end

end
