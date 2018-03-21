
class LittleShopApp < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/merchants' do
    erb :'merchant/index', locals: { merchants: Merchant.all }
  end

  get '/merchants-dashboard' do
    erb :'merchant/dashboard', locals: { merchants: Merchant.all }
  end

  get '/merchants/:id/edit' do
    erb :'merchant/edit', locals: { merchant: Merchant.find(params['id']) }
  end

  get '/merchants/:id/view' do
    erb :'merchant/show', locals: { merchant: Merchant.find(params['id']) }
  end

  get '/merchants/new' do
    erb :'merchant/new'
  end

  post '/merchants/new' do
    Merchant.create(params) unless params.include?('cancel')

    redirect :'/merchants'
  end

  patch '/merchants/:id/edit' do
    unless params.include?('cancel')
      Merchant.update(params['id'], name: params['new_name'])
    end

    redirect :'/merchants'
  end

  delete '/merchants/:id/delete' do
    Merchant.delete(params['id'])

    redirect :'/merchants'
  end

  get '/invoices' do
    erb :'invoice/index', locals: { invoices: Invoice.all }
  end

  get '/invoices-dashboard' do
    erb :'invoice/dashboard', locals: { invoices: Invoice.all }
  end

  get '/invoices/:id/edit' do
    erb :'invoice/edit', locals: { invoice: Invoice.find(params['id']) }
  end

  get '/invoices/:id/view' do
    erb :'invoice/show', locals: { invoice: Invoice.find(params['id']) }
  end

  patch '/invoices/:id/edit' do
    Invoice.update(params['id'],
                   status: params['new_status'])

    redirect :'/invoices'
  end

  delete '/invoices/:id/delete' do
    Invoice.delete(params['id'])

    redirect :'/invoices'
  end

  get '/items' do
    erb :'item/index', locals: { items: Item.all }
  end

  get '/items-dashboard' do
    erb :'item/dashboard', locals: { items: Item.all }
  end

  get '/items/:id/edit' do
    erb :'item/edit', locals: { item: Item.find(params['id']),
                                merchants: Merchant.order(:name) }
  end

  get '/items/:id/view' do
    erb :'item/show', locals: { item: Item.find(params['id']) }
  end

  get '/items/new' do
    erb :'item/new', locals: { merchants: Merchant.order(:name) }
  end

  post '/items/new' do
    Item.create(params) unless params.include?('cancel')

    redirect :'/items'
  end

  patch '/items/:id/edit' do
    unless params.include?('cancel')
      Item.update(params['id'],
                  title: params['new_title'],
                  description: params['new_description'],
                  price: params['new_price'],
                  merchant_id: params['new_merch_id'],
                  image_url: params['new_image_url'])
    end

    redirect :'/items'
  end

  delete '/items/:id/delete' do
    Item.delete(params['id'])

    redirect :'/items'
  end
end
