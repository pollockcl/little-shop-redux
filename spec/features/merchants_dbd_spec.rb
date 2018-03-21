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

    describe 'merchant dashboard' do
      it 'see some stats' do
        visit '/merchants-dashboard'

        expect(current_path).to eq('/merchants-dashboard')
        expect(page).to have_content('Groot')
        expect(page).to have_content('Groot', count: 3)
      end
    end

    describe 'can click on Groot' do
      it 'takes you to groot merchant page' do
        visit '/merchants-dashboard'
        first(:link, 'Groot').click

        expect(current_path).to eq('/merchants/1/view')
      end
    end
  end
end
