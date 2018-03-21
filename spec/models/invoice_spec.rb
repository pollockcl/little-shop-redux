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

  describe 'self methods' do
    describe '.highest_price' do
      it 'has a highest price' do
        InvoiceItem.create(item_id: 1,
                          invoice_id: 1,
                          unit_price: 4,
                          quantity: 2)
        InvoiceItem.create(item_id: 2,
                          invoice_id: 2,
                          unit_price: 2,
                          quantity: 10)
        expect(Invoice.highest_price.invoice_id).to eq(1)
      end
    end
    describe '.lowest_price' do
      it 'has a lowest price' do
        InvoiceItem.create(item_id: 1,
                          invoice_id: 1,
                          unit_price: 4,
                          quantity: 2)
        InvoiceItem.create(item_id: 2,
                          invoice_id: 2,
                          unit_price: 2,
                          quantity: 10)
        expect(Invoice.lowest_price.invoice_id).to eq(2)
      end
    end
    describe '.highest_quantity' do
      it 'has a highest quantity' do
        InvoiceItem.create(item_id: 1,
                          invoice_id: 1,
                          unit_price: 4,
                          quantity: 2)
        InvoiceItem.create(item_id: 2,
                          invoice_id: 2,
                          unit_price: 2,
                          quantity: 10)
        expect(Invoice.highest_quantity.invoice_id).to eq(2)
      end
    end
    describe '.lowest_quantity' do
      it 'has a lowest quantity' do
        InvoiceItem.create(item_id: 1,
                          invoice_id: 1,
                          unit_price: 4,
                          quantity: 2)
        InvoiceItem.create(item_id: 2,
                          invoice_id: 2,
                          unit_price: 2,
                          quantity: 10)
        expect(Invoice.lowest_quantity.invoice_id).to eq(1)
      end
    end
  end
end
