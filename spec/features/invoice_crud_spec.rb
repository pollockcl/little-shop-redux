RSpec.describe Invoice do
  describe 'When visiting' do
    before(:each) do
      Invoice.create(merchant_id: '1',
                     customer_id: '1',
                     status: 'returned')
      Merchant.create(name: 'smashmouth')
      Item.create(title: 'some',
                  description: 'BODY',
                  price: 463,
                  merchant_id: 1)
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: 1,
                         unit_price: 2)
    end

    describe '/invoices' do
      describe 'I want to' do
        it 'view an invoice' do
          visit '/invoices'

          click_link('1')

          expect(current_path).to eq('/invoices/1/view')
          expect(page).to have_content(1)
          expect(page).to have_content('returned')
          expect(page).to have_content('some')
          expect(page).to have_content('smashmouth\'s')
        end
      end

      it 'delete an invoice' do
        visit '/invoices'

        click_button 'Delete'

        expect(page).to_not have_content('1')
        expect(page).to_not have_content('returned')
      end
    end

    describe '/invoices' do
      describe 'I want to' do
        it 'edit an invoice' do
          visit '/invoices'

          click_on('Edit')

          select('pending', from: 'new_status')

          click_on('Submit')

          expect(current_path).to eq('/invoices')

          visit '/invoices/1/view'
          expect(page).to have_content('pending')
        end

      end
    end
  end
end
