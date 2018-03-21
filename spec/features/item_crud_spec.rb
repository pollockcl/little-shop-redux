RSpec.describe do
  describe 'When visiting' do

    before(:each) do
      Merchant.create(name: 'Groot')
      Item.create(title: 'Burrito del Greg',
                  description: 'That burrito which belongs to Greg',
                  price: 6,
                  merchant_id: 1,
                  image_url: 'https://i.redd.it/x2rxq3qzujm01.jpg')
    end

    describe 'items' do
      describe 'I want to' do
        describe 'create an item' do
          it 'can create item' do
            visit '/items/new'

            select 'Groot', from: 'merchant_id'
            fill_in 'title',       with: 'Shrek Action Figure'
            fill_in 'description', with: 'Shreks stuff'
            fill_in 'price',       with: '99.99'

            click_on 'Create'

            expect(current_path).to eq('/items')
            expect(page).to have_content('Shrek Action Figure')
            expect(page).to have_content('$99.99')
            expect(Item.count).to eq(2)
          end
        end

        describe 'cancel a item creation' do
          it 'can cancel out of creating an item' do
            visit '/items/new'

            select 'Groot', from: 'merchant_id'
            fill_in 'title', with: 'Shrek Action Figure'

            click_on 'Cancel'

            expect(current_path).to eq('/items')
            expect(page).to_not have_content('Shrek Action Figure')
            expect(Item.count).to eq(1)
          end
        end

        describe 'view an item' do
          it 'can view item' do
            visit '/items'

            click_link ('Burrito del Greg')


            expect(current_path).to eq('/items/1/view')
            expect(page).to have_content(6)
            expect(page).to have_content('Burrito del Greg')
            expect(page).to have_selector(:link_or_button, 'Edit')
            expect(page).to have_selector(:link_or_button, 'Delete')
          end
        end

        describe 'update an item' do
          it 'should edit item' do
            visit '/items/1/view'

            click_button 'Edit'

            fill_in 'new_title', with: 'Burrito del Gerg'
            fill_in 'new_price', with: '28'
            click_button('Submit')

            expect(current_path).to eq('/items')
            expect(page).to have_content('Burrito del Gerg')
            expect(page).to have_content('$28.00')
          end
        end

        describe 'cancel out of an item update' do
          it 'should not edit an item' do
            visit '/items/1/edit'

            fill_in 'new_title', with: 'Breakfast burrito'
            fill_in 'new_price', with: '32'

            click_button 'Cancel'

            expect(current_path).to eq('/items')
            expect(page).to have_content('Burrito del Greg')
            expect(page).to have_content('6.00')
            expect(page).to_not have_content('Breakfast burrito')
            expect(page).to_not have_content('32')
          end
        end

        describe 'delete an item' do
          it 'can delete an item' do
            visit '/items/1/view'

            click_on 'Delete'

            expect(current_path).to eq('/items')
            expect(page).to_not have_content('Burrito del Greg')
          end
        end
      end
    end
  end
end
