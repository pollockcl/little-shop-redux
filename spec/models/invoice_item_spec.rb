RSpec.describe InvoiceItem do
  describe 'attributes' do
    it 'should have item_id' do
      invalid = InvoiceItem.create(invoice_id: 2,
                                   quantity: 4,
                                   unit_price: 32)

      expect(invalid).to_not be_valid
    end

    it 'should have invoice_id' do
      invalid = InvoiceItem.create(item_id: 1,
                                   quantity: 4,
                                   unit_price: 32)

      expect(invalid).to_not be_valid
    end

    it 'should have quantity' do
      invalid = InvoiceItem.create(item_id: 1,
                                   invoice_id: 2,
                                   unit_price: 32)

      expect(invalid).to_not be_valid
    end

    it 'should have unit_price' do
      invalid = InvoiceItem.create(item_id: 1,
                                   invoice_id: 2,
                                   unit_price: 4)

      expect(invalid).to_not be_valid
    end
  end
end
