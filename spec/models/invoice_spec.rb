RSpec.describe Invoice do

  describe 'Validates attributes' do
    describe '.merchant_id' do
      it 'should be present' do
        invoice = Invoice.create()

        expect(invoice).to_not be_valid
      end
    end
  end

  describe 'class methods' do
    describe '.pending' do
      it 'returns the % of invoices that are pending' do
        4.times do
          Invoice.create(merchant_id: 10,
                         status: 'shipped')
        end
        Invoice.create(merchant_id: 10,
                       status: 'pending')

        expect(Invoice.pending).to eq(20)
      end
    end
  end
end
