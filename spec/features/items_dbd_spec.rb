RSpec.describe do
  describe 'When visiting' do

    before(:each) do
      Merchant.create(name: 'Groot')
      Item.create(title: 'Burrito del Greg',
                  description: 'That burrito which belongs to Greg',
                  price: 6,
                  merchant_id: 1,
                  image_url: 'https://i.redd.it/x2rxq3qzujm01.jpg')
    end

    describe 'dashboard' do
      it 'can visit dashboard' do
        visit '/invoices-dashboard'

        expect(current_path).to eq('/invoices-dashboard')
      end
    end
  end
end
