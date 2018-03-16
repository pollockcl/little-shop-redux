RSpec.describe do
  describe 'When visiting' do
    describe 'create' do
      it 'can create item' do
        item = Item.create(title: 'Burrito del Greg',
                           description: 'That burrito which belongs to Greg',
                           price: 6,
                           merchant_id: 12337890)

        visit '/items'

        expect(current_path).to eq('/items')
        expect(page).to have_content(item.title)
        expect(Item.count).to eq(1)
      end
    end

    describe 'read' do
      it 'can view item' do
        Item.create(title: 'Burrito del Greg',
                    description: 'That burrito which belongs to Greg',
                    price: 6,
                    merchant_id: 12337890)

        visit '/items'

        click_link ('Burrito del Greg')


        expect(current_path).to eq('/items/view/1')
        expect(page).to have_content(6)
        expect(page).to have_content('Burrito del Greg')
        expect(page).to have_content('created')
      end
    end

    describe 'update' do
      it 'should edit item' do
        Item.create(title: 'Burrito del Greg', description: 'That burrito which belongs to Greg', price: 6, merchant_id: 12337890)

        visit '/items/edit/1'

        expect(page).to have_field('new_title', with: 'Burrito del Greg')

        fill_in 'new_title', with: 'Burrito del Gerg'
        click_button('Submit')

        expect(current_path).to eq('/items/edit/1')
        expect(page).to have_content('Burrito del Gerg')
      end
    end

    describe 'delete' do
      it 'should delete a item' do
        Item.create(title: 'Burrito del Greg',
                    description: 'That burrito which belongs to Greg',
                    price: 6,
                    merchant_id: 12337890)

        visit '/items'

        click_on 'Delete'

        expect(page).to_not have_content('Burrito del Greg')
      end
    end
  end
end
