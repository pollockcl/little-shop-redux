RSpec.describe do
  describe 'When visiting' do
    describe 'merchant/create' do
      it 'can create merchant' do
        visit '/merchants'
        click_button 'Create New Merchant'

        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button 'Create'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Darth Plagueis the Wise')
        expect(Merchant.count).to eq(1)
      end
    end

    describe 'merchant/view' do
      it 'can view merchant' do
        visit 'merchants/create'
        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button('Create')

        click_link('Darth Plagueis the Wise')

        expect(current_path).to eq('/merchants/view/1')
        expect(page).to have_content(1)
        expect(page).to have_content('Darth Plagueis the Wise')
        expect(page).to have_content('created')
      end
    end

    describe 'merchant/edit' do
      it 'can edit merchant' do
        visit 'merchants/create'
        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button('Create')

        visit 'merchants/edit/1'

        expect(page).to have_content(1)

        fill_in 'new_name', with: 'Anakin Skywalker'
        click_button('Submit')

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Anakin Skywalker')
      end
    end
  end
end