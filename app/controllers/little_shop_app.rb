
class LittleShopApp < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/merchants' do
    merchants = Merchant.all

    erb :'merchant/index', locals: { merchants: merchants }
  end

  get '/merchants/:id/edit' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/edit', locals: { merchant: merchant }
  end

  get '/merchants/:id/view' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/singular', locals: { merchant: merchant }
  end

  get '/merchants/new' do
    erb :'merchant/new'
  end

  post '/merchants/new' do
    Merchant.create(params)

    redirect :'/merchants'
  end

  patch '/merchants/:id/edit' do
    merchant      = Merchant.find(params['id'])
    merchant.name = params['new_name']
    merchant.save

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

    erb :'invoice/singular', locals: { invoice: invoice, traits: traits }
  end

  patch '/invoices/:id/edit' do
    invoice             = Invoice.find(params['id'])
    invoice.customer_id = params['new_customer_id']
    invoice.merchant_id = params['new_merchant_id']
    invoice.status      = params['new_status']
    invoice.save

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
    item       = Item.find(params[:id])
    item.title = params['new_title']
    item.description = params['new_description']
    item.unit_price = params['new_price']
    item.merchant_id = params['new_merch_id']
    item.save

    redirect :'/items'
  end

  delete '/items/:id/delete' do
    Item.delete(params['id'])

    redirect :'/items'
  end
end
