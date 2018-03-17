RSpec.describe Merchant do

  describe 'Validates attributes' do
    describe '.name' do
      it 'should be present' do
        merchant = Merchant.create()

        expect(merchant).to_not be_valid
      end
    end
  end
end
