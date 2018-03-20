RSpec.describe do
  describe 'The nav bar' do
    describe 'buttons' do
      it 'has merchants button' do
        visit '/'

        click_on 'Merchants'

        expect(current_path).to eq('/merchants')
      end

      it 'has items button' do
        visit '/'

        click_on 'Items'

        expect(current_path).to eq('/items')
      end

      it 'has merchant button' do
        visit '/'

        click_on 'Invoices'

        expect(current_path).to eq('/invoices')
      end

      it 'has home button' do
        visit '/merchants'

        click_on 'LittleShop'

        expect(current_path).to eq('/')
        expect(page).to have_button('LittleShop')
      end
    end
  end
end