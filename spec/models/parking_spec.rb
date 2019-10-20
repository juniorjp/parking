# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parking, type: :model do
 
  context 'validations' do
    it { should validate_presence_of(:plate) }
    it { should allow_value('FAA-1234').for(:plate) }
    it { should_not allow_value('AA-12345').for(:plate) }
  end
end
