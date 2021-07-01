require 'rails_helper'

RSpec.describe BlessYouController, type: :request do
  it 'responds with the correct value' do
    get bless_you_path(blessee: 'bob')
    expect(response).to have_http_status(200)
    expect(response.body).to eq('{"blessyou":"Blob"}')
  end
end
