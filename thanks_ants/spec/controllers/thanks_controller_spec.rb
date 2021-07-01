require 'rails_helper'

RSpec.describe ThanksController, type: :request do
  it 'responds with the correct value' do
    get thanks_path(thankee: 'bob')
    expect(response).to have_http_status(200)
    expect(response.body).to eq('{"thanks":"Thob"}')
  end
end
