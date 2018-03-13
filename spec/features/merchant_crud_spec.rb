RSpec.describe do
  describe 'When visiting' do
    describe 'merchant/create' do
      it 'can create merchant' do
        visit 'merchants/create'

        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button 'Create'

        expect(current_path).to eq '/merchants'
        expect(page).to have_content('Darth Plagueis the Wise')
        expect(Merchant.count).to eq(1)
      end
    end
  end
end