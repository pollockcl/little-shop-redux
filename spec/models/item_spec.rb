RSpec.describe Item do

  describe 'Validates attributes' do
    describe '.name' do
      it 'should be present' do
        item = Item.create(description: 'Glorious adventure',
                           price: 131,
                           merchant_id: 66)

        expect(item).to_not be_valid
      end
    end

    describe '.description' do
      it 'should be present' do
        item = Item.create(title: 'Bilbo',
                           price: 131,
                           merchant_id: 66)

        expect(item).to_not be_valid
      end
    end

    describe '.unit_price' do
      it 'should be present' do
        item = Item.create(title: 'Bilbo',
                           description: 'Glorious adventure',
                           merchant_id: 66)

        expect(item).to_not be_valid
      end
    end

    describe '.merchant_id' do
      it 'should be present' do
        item = Item.create(title: 'Bilbo',
                           description: 'Glorious adventure',
                           price: 131)

        expect(item).to_not be_valid
      end
    end
  end

  describe 'class methods' do
    describe '.newest' do
      it 'returns the most recently created item.' do
        Item.create(title: 'first',
                    description: 'first',
                    price: 1,
                    merchant_id: 1)

        5.times do
          Item.create(title: 'title',
                      description: 'des',
                      price: 99,
                      merchant_id: 1)
        end

        expect(Item.newest.title).to eq('first')
      end
    end

    describe '.oldest' do
      it 'returns the least recently created item.' do
        5.times do
          Item.create(title: 'title',
                      description: 'des',
                      price: 99,
                      merchant_id: 1)
        end

        Item.create(title: 'last',
                    description: 'last',
                    price: 10,
                    merchant_id: 10)

        expect(Item.oldest.title).to eq('last')
      end
    end

    describe '.average_price' do
      it 'returns the average price of items' do
        5.times do
          Item.create(title: 'title',
                      description: 'des',
                      price: 50,
                      merchant_id: 1)
        end

        Item.create(title: 'last',
                    description: 'last',
                    price: 350,
                    merchant_id: 10)

        expect(Item.average_price).to eq(100.00)
      end
    end

  end
end
