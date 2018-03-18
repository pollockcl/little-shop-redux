
class LittleShopApp < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/merchants' do
    merchants = Merchant.all

    erb :'merchant/index', locals: { merchants: merchants }
  end

  get '/merchants-dashboard' do
    merchants = Merchant.all

    erb :'merchant/dashboard', locals: { merchants: merchants }
  end

  get '/merchants/:id/edit' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/edit', locals: { merchant: merchant }
  end

  get '/merchants/:id/view' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/show', locals: { merchant: merchant }
  end

  get '/merchants/new' do
    erb :'merchant/new'
  end

  post '/merchants/new' do
    unless params.include?('cancel')
      Merchant.create(params)
    end

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
    invoices = Invoice.all
    erb :'invoice/index', locals: { invoices: invoices }
  end

  get '/invoices/:id/edit' do
    invoice = Invoice.find(params['id'])

    erb :'invoice/edit', locals: { invoice: invoice }
  end

  get '/invoices/:id/view' do
    invoice = Invoice.find(params['id'])
    traits  = InvoiceItem.invoice_view(params['id'])

    erb :'invoice/show', locals: { invoice: invoice, traits: traits }
  end

  patch '/invoices/:id/edit' do
    Invoice.update(params['id'],
                   customer_id: params['new_customer_id'],
                   merchant_id: params['new_merchant_id'],
                   status: params['new_status'])

    redirect :'/invoices'
  end

  delete '/invoices/:id/delete' do
    Invoice.delete(params['id'])

    redirect :'/invoices'
  end

  get '/items' do
    items = Item.all
    erb :'item/index', locals: { items: items }
  end

  get '/items/:id/edit' do
    item = Item.find(params['id'])

    erb :'item/edit', locals: { item: item }
  end

  get '/items/:id/view' do
    item = Item.find(params['id'])

    erb :'item/show', locals: { item: item }
  end

  get '/items/create' do
    erb :'item/new'
  end

  post '/items/create' do
    Item.create(params)

    redirect :'/items'
  end

  patch '/items/:id/edit' do
    Item.update(params['id'],
                title: params['new_title'],
                description: params['new_description'],
                price: params['new_price'],
                merchant_id: params['new_merch_id'])

    redirect :'/items'
  end

  delete '/items/:id/delete' do
    Item.delete(params['id'])

    redirect :'/items'
  end
end
