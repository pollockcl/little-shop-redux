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

    describe '.shipped' do
      it 'returns the % of invoices that are shipped' do
        4.times do
          Invoice.create(merchant_id: 10,
                         status: 'shipped')
        end
        Invoice.create(merchant_id: 10,
                       status: 'pending')

        expect(Invoice.shipped).to eq(80)
      end
    end

    describe '.returned' do
      it 'returns the % of invoices that are returned' do
        4.times do
          Invoice.create(merchant_id: 10,
                         status: 'shipped')
        end

        2.times do
          Invoice.create(merchant_id: 10,
                         status: 'returned')
        end

        expect(Invoice.returned).to eq(33)

      end
    end
  end
end
