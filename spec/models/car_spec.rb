require 'spec_helper'

describe Car do

  describe 'Database Tests' do
    it { should have_db_column(:color).of_type(:string) }
    it { should have_db_column(:year).of_type(:integer) }
    it { should have_db_column(:mileage).of_type(:integer) }
    it { should have_db_column(:description).of_type(:text) }
  end

  describe 'Validation Tests' do
    it { should have_valid(:color).when('blue', 'red', 'yellow') }
    it { should_not have_valid(:color).when('', nil) }

    it { should validate_numericality_of(:year).only_integer }
    it { should validate_numericality_of(:mileage).only_integer }
  end

end
