RSpec.describe Item do

  describe 'Validates attributes' do
    describe '.name' do
      it 'should be present' do
        item = Item.create(description: 'Glorious adventure', price: 131, merchant_id: 66)

        expect(item).to_not be_valid
      end
    end

    describe '.description' do
      it 'should be present' do
        item = Item.create(title: 'Bilbo', price: 131, merchant_id: 66)

        expect(item).to_not be_valid
      end
    end

    describe '.unit_price' do
      it 'should be present' do
        item = Item.create(title: 'Bilbo', description: 'Glorious adventure', merchant_id: 66)

        expect(item).to_not be_valid
      end
    end

    describe '.merchant_id' do
      it 'should be present' do
        item = Item.create(title: 'Bilbo', description: 'Glorious adventure', price: 131)

        expect(item).to_not be_valid
      end
    end
  end
end
