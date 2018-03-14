RSpec.describe do
  describe 'When visiting' do

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
        visit 'invoices/create'
        fill_in 'name', with: 'Darth Plagueis the Wise'
        click_button('Create')

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
        invoice.create(name: 'Darth Plagueis the Wise')
        visit '/invoices'

        expect(current_path).to eq('/invoices')

        click_button 'Delete'

        expect(page).to_not have_content('Darth Plagueis the Wise')
      end
    end
  end
end
