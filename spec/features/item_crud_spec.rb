RSpec.describe do
  describe 'When visiting' do

    before(:each) do
      Item.create(title: 'Burrito del Greg',
                  description: 'That burrito which belongs to Greg',
                  price: 6,
                  merchant_id: 12337890)
    end

    describe 'create' do
      it 'can create item' do
        visit '/items/create'

        fill_in 'title',       with: 'Shrek Action Figure'
        fill_in 'description', with: 'Shreks stuff'
        fill_in 'price',       with: '99.99'
        fill_in 'merchant_id', with: '123'

        click_on 'Create'

        expect(current_path).to eq('/items')
        expect(page).to have_content('Shrek Action Figure')
        expect(page).to have_content('99.99')
        expect(Item.count).to eq(2)
      end
    end

    describe 'read' do
      it 'can view item' do
        visit '/items'

        click_link ('Burrito del Greg')


        expect(current_path).to eq('/items/1/view')
        expect(page).to have_content(6)
        expect(page).to have_content('Burrito del Greg')
        page.should have_selector(:link_or_button, 'Edit')
        page.should have_selector(:link_or_button, 'Delete')
      end
    end

    describe 'update' do
      it 'should edit item' do
        visit '/items/1/view'

        click_button 'Edit'
        expect(page).to have_field('new_title', with: 'Burrito del Greg')

        fill_in 'new_title', with: 'Burrito del Gerg'
        click_button('Submit')

        expect(current_path).to eq('/items')
        expect(page).to have_content('Burrito del Gerg')
      end
    end

    describe 'delete' do
      it 'should delete a item' do
        visit '/items/1/view'

        click_on 'Delete'

        expect(page).to_not have_content('Burrito del Greg')
      end
    end
  end
end
