
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

  get '/invoices/create' do
    erb :'invoice/create'
  end

  post '/invoices/create' do
    Invoice.create(params)

    redirect :'/invoices'
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

end
