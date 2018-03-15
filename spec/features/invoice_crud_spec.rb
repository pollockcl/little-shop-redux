RSpec.describe Invoice do
  describe 'When visiting' do
    describe 'create' do
      it 'can create invoice' do
        visit '/invoices'
        click_button 'Create New Invoice'

        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button 'Create'

        expect(current_path).to eq('/invoices')
        expect(page).to have_content('Darth Plagueis the Wise')
        expect(Invoice.count).to eq(1)
      end
    end

    describe 'read' do
      it 'can view invoice' do
        visit 'invoices/create'
        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button('Create')

        click_link('Darth Plagueis the Wise')

        expect(current_path).to eq('/invoices/view/1')
        expect(page).to have_content(1)
        expect(page).to have_content('Darth Plagueis the Wise')
        expect(page).to have_content('created')
      end
    end

    describe 'update' do
      it 'should edit invoice' do
        Invoice.create(name: 'Darth Plagueis the Wise')
        visit '/invoices'

        visit 'invoices/edit/1'

        expect(page).to have_content(1)

        fill_in 'new_name', with: 'Anakin Skywalker'
        click_button('Submit')

        expect(current_path).to eq('/invoices')
        expect(page).to have_content('Anakin Skywalker')
      end
    end

    describe 'delete' do
      it 'should delete a invoice' do
        Invoice.create(name: 'Darth Plagueis the Wise')
        visit '/invoices'

        expect(current_path).to eq('/invoices')

        click_button 'Delete'

        expect(page).to_not have_content('Darth Plagueis the Wise')
      end
    end
  end
end
