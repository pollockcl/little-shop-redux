RSpec.describe Merchant do

  describe 'Validates attributes' do
    describe '.name' do
      it 'should not be present' do
        merchant = Merchant.create()

        expect(merchant).to_not be_valid
      end
      it 'should be present' do
        merchant = Merchant.create(name: 'Bilbo')

        expect(merchant).to be_valid
        expect(merchant.id).to eq(1)
      end
    end
  end

  describe 'merchant self methods' do
    describe '.highest_price' do
      it 'has the highest price' do
        merchant = Merchant.create(name: 'Bilbo')
        Item.create(title: 'Ring', description: 'shiny', price: 110, merchant_id: 1)
        Merchant.create(name: 'Gandalf')
        Item.create(title: 'Bread', description: '2nd breakfast', price: 20, merchant_id: 2)
        Item.create(title: 'Staff', description: 'hard', price: 99, merchant_id: 2)

        expect(Merchant.highest_price.first).to eq(merchant)
      end
    end

    describe '.most_items' do
      it 'has the most items' do
        Merchant.create(name: 'Bilbo')
        Item.create(title: 'Ring', description: 'shiny', price: 110, merchant_id: 1)
        merchant = Merchant.create(name: 'Gandalf')
        Item.create(title: 'Bread', description: '2nd breakfast', price: 20, merchant_id: 2)
        Item.create(title: 'Staff', description: 'hard', price: 99, merchant_id: 2)

        expect(Merchant.most_items).to eq(merchant)
      end
    end
  end

  describe 'merchant methods' do
    describe '.item_count' do
      it 'has items counted' do
        merchant = Merchant.create(name: 'Bilbo')
        Item.create(title: 'Ring', description: 'shiny', price: 110, merchant_id: 1)
        merchant1 = Merchant.create(name: 'Gandalf')
        Item.create(title: 'Bread', description: '2nd breakfast', price: 20, merchant_id: 2)
        Item.create(title: 'Staff', description: 'hard', price: 99, merchant_id: 2)

        expect(merchant.item_count).to eq(1)
        expect(merchant1.item_count).to eq(2)
      end
    end

    describe '.avg_price' do
      it 'has averages items' do
        merchant = Merchant.create(name: 'Bilbo')
        Item.create(title: 'Ring', description: 'shiny', price: 110, merchant_id: 1)
        merchant1 = Merchant.create(name: 'Gandalf')
        Item.create(title: 'Bread', description: '2nd breakfast', price: 20, merchant_id: 2)
        Item.create(title: 'Staff', description: 'hard', price: 100, merchant_id: 2)

        expect(merchant.avg_price).to eq(110)
        expect(merchant1.avg_price).to eq(60)
      end
    end

    describe '.total_cost' do
      it 'has total cost' do
        merchant = Merchant.create(name: 'Bilbo')
        Item.create(title: 'Ring', description: 'shiny', price: 110, merchant_id: 1)
        merchant1 = Merchant.create(name: 'Gandalf')
        Item.create(title: 'Bread', description: '2nd breakfast', price: 20, merchant_id: 2)
        Item.create(title: 'Staff', description: 'hard', price: 100, merchant_id: 2)

        expect(merchant.total_cost).to eq(110)
        expect(merchant1.total_cost).to eq(120)
      end
    end
  end
end
