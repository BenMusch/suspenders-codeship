require 'rails_helper'

RSpec.describe Thing, type: :model do
  it 'can be created' do
    create(:thing)
    expect(Thing.count).to be 1
  end
end
