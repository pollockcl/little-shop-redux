RSpec.describe Invoice do
  describe 'When visiting' do

    describe 'read' do
      it 'can view invoice' do
        Invoice.create(merchant_id: '83770')
        visit '/invoices'

        click_link('1')

        expect(current_path).to eq('/invoices/1/view')
        expect(page).to have_content(1)
        expect(page).to have_content('83770')
      end
    end

    describe 'update' do
      it 'should edit invoice' do
        Invoice.create(merchant_id: '83770')
        visit '/invoices'

        visit 'invoices/1/edit'

        expect(page).to have_content(1)

        fill_in 'new_customer_id', with: '1337'
        fill_in 'new_merchant_id', with: '8008'
        fill_in 'new_status', with: 'High Ground'
        click_button('Submit')

        expect(current_path).to eq('/invoices')
        expect(page).to have_content('1337')
        expect(page).to have_content('8008')
        expect(page).to have_content('High Ground')
      end
    end

    describe 'delete' do
      it 'should delete a invoice' do
        Invoice.create(merchant_id: '1337')
        visit '/invoices'

        expect(current_path).to eq('/invoices')

        click_button 'Delete'

        expect(page).to_not have_content('1337')
      end
    end
  end
end
