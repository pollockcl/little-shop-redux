RSpec.describe do
  describe 'When visiting' do

    before(:each) do
      Merchant.create(name: 'Darth Plagueis the Wise')
    end

    describe 'I want to' do
      describe 'create a merchant' do
        it 'creates a merchant' do
          visit '/merchants'
          click_on 'Create New Merchant'

          fill_in 'name', with: 'Farquad'
          click_button 'Create'

          expect(current_path).to eq('/merchants')
          expect(page).to have_content('Farquad')
          expect(Merchant.count).to eq(2)
        end
      end

      describe 'cancel' do
        it 'does not make a merchant' do
          visit '/merchants'
          click_on 'Create New Merchant'

          fill_in 'name', with: 'Farquad'
          click_button 'Cancel'

          expect(current_path).to eq('/merchants')
          expect(page).to_not have_content('Farquad')
        end
      end
    end

    describe 'read' do
      it 'can view merchant' do
        visit '/merchants'

        click_link('Darth Plagueis the Wise')

        expect(current_path).to eq('/merchants/1/view')
        expect(page).to have_content(1)
        expect(page).to have_content('Darth Plagueis the Wise')
        expect(page).to have_content('created')
      end
    end

    describe 'want to' do
      describe 'update' do
        it 'should edit merchant' do
          visit '/merchants/1/edit'

          expect(page).to have_content('Name: ')

          fill_in 'new_name', with: 'Anakin Skywalker'
          click_on('Update Merchant')

          expect(current_path).to eq('/merchants')
          expect(page).to have_content('Anakin Skywalker')
        end
      end

      describe 'cancel' do
        it 'should not edit merchant' do
          visit '/merchants/1/edit'

          fill_in 'new_name', with: 'Anakin Skywalker'
          click_on('Cancel')

          expect(current_path).to eq('/merchants')
          expect(page).to_not have_content('Anakin Skywalker')
          expect(page).to have_content('Darth Plagueis the Wise')
        end
      end

    end

    describe 'delete' do
      it 'should delete a merchant' do
        visit '/merchants'

        expect(current_path).to eq('/merchants')

        click_button 'Delete'

        expect(page).to_not have_content('Darth Plagueis the Wise')
      end
    end
  end
end