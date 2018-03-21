RSpec.describe do
  describe 'When visiting' do

    before(:each) do
      Merchant.create(name: 'Groot')
      Item.create(title: 'Burrito del Greg',
                  description: 'That burrito which belongs to Greg',
                  price: 6,
                  merchant_id: 1,
                  image_url: 'https://i.redd.it/x2rxq3qzujm01.jpg')
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: 7,
                         unit_price: 10)
      InvoiceItem.create(item_id: 1,
                         invoice_id: 1,
                         quantity: 32,
                         unit_price: 5)
      Invoice.create(merchant_id: '1',
                     customer_id: '1',
                     status: 'returned')
      Invoice.create(merchant_id: '1',
                     customer_id: '1',
                     status: 'shipped')
      Invoice.create(merchant_id: '1',
                     customer_id: '1',
                     status: 'pending')


    end

    describe 'invoice dashboard' do

      describe 'status percentages' do
        it 'has accurate data' do
          visit '/invoices-dashboard'

          expect(current_path).to eq('/invoices-dashboard')

          expect(page).to have_content('Status Percentages')
          expect(page).to have_content('33')
          expect(page).to have_content('Shipped')
          expect(page).to have_content('Pending')
          expect(page).to have_content('Returned')
        end
      end

      describe 'unit prices' do
        it 'has accurate data' do
          visit '/invoices-dashboard'

          expect(current_path).to eq('/invoices-dashboard')
          expect(page).to have_content('Status Percentages')
          expect(page).to have_content('15')
          expect(page).to have_content('Highest')
          expect(page).to have_content('Invoice')
          expect(page).to have_content('Lowest')

          first(:link, '15').click

          expect(current_path).to eq('/invoices/1/view')
        end
      end

      describe 'quantity' do
        it 'has accurate data' do
          visit '/invoices-dashboard'

          expect(current_path).to eq('/invoices-dashboard')
          expect(page).to have_content('Quantity')
          expect(page).to have_content('39')
        end
      end
    end
  end
end
