
class LittleShopApp < Sinatra::Base
  get '/merchants' do
    merchants = Merchant.all

    erb :'merchant/index', locals: { merchants: merchants }
  end

  get '/merchants/edit/:id' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/edit', locals: { merchant: merchant }
  end

  get '/merchants/view/:id' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/singular', locals: { merchant: merchant }
  end

  get '/merchants/create' do
    erb :'merchant/create'
  end

  post '/merchants/create' do
    Merchant.create(params)

    redirect :'/merchants'
  end

  patch '/merchants/edit/:id' do
    merchant      = Merchant.find(params['id'])
    merchant.name = params['new_name']
    merchant.save

    redirect :'/merchants'
  end

  delete '/merchants/delete/:id' do
    Merchant.delete(params['id'])

    redirect :'/merchants'
  end

  get '/invoices' do
    invoices = Invoice.all
    erb :'invoice/index', locals: { invoices: invoices }
  end

  get '/invoices/edit/:id' do
    invoice = Invoice.find(params['id'])

    erb :'invoice/edit', locals: { invoice: invoice }
  end

  get '/invoices/view/:id' do
    invoice = Invoice.find(params['id'])

    erb :'invoice/singular', locals: { invoice: invoice }
  end

  patch '/invoices/edit/:id' do
    invoice             = Invoice.find(params['id'])
    invoice.customer_id = params['new_customer_id']
    invoice.merchant_id = params['new_merchant_id']
    invoice.status      = params['new_status']
    invoice.save

    redirect :'/invoices'
  end

  delete '/invoices/delete/:id' do
    Invoice.delete(params['id'])

    redirect :'/invoices'
  end

  get '/items' do
    items = Item.all
    erb :'item/index', locals: { items: items }
  end

  get '/items/edit/:id' do
    item = Item.find(params['id'])

    erb :'item/edit', locals: { item: item }
  end

  get '/items/view/:id' do
    item = Item.find(params['id'])

    erb :'item/singular', locals: { item: item }
  end

  get '/items/create' do
    erb :'item/create'
  end

  post '/items/create' do
    Item.create(params)

    redirect :'/items'
  end

  patch '/items/edit/:id' do
    item       = Item.find(params[:id])
    item.title = params['new_title']
    item.save

    redirect :'/items'
  end

  delete '/items/delete/:id' do
    Item.delete(params['id'])

    redirect :'/items'
  end
end
