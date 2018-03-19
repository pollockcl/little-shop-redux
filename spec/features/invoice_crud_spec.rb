RSpec.describe Invoice do
  describe 'When visiting' do
    before(:each) do
      Invoice.create(merchant_id: '83770')
    end

    describe 'read' do
      it 'can view invoice' do
        visit '/invoices'

        click_link('1')

        expect(current_path).to eq('/invoices/1/view')
        expect(page).to have_content(1)
        expect(page).to have_content('83770')
      end
    end

    describe 'update' do
      it 'should edit invoice' do
        visit '/invoices'

        visit 'invoices/1/edit'

        fill_in 'new_customer_id', with: '1337'
        fill_in 'new_merchant_id', with: '8008'
        fill_in 'new_status', with: 'High Ground'
        click_button('Submit')

        expect(current_path).to eq('/invoices')

        visit '/invoices/1/view'
        expect(page).to have_content('1337')
        expect(page).to have_content('8008')
        expect(page).to have_content('High Ground')
      end
    end

    describe 'delete' do
      it 'should delete a invoice' do
        visit '/invoices'

        expect(current_path).to eq('/invoices')

        click_button 'Delete'

        expect(page).to_not have_content('83770')
      end
    end
  end
end
