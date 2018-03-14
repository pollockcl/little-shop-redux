RSpec.describe Invoice do

  describe 'Validates attributes' do
    describe '.merchant_id' do
      it 'should be present' do
        invoice = Invoice.create()

        expect(merchant).to_not be_valid
      end
    end
  end
end
