class LittleShopApp < Sinatra::Base
  get '/merchants' do
    merchants = Merchant.all
    erb :'merchant/index', locals: { merchants: merchants }
  end

  get '/merchants/edit/:id' do
    merchant = Merchant.find(params['id'])

    erb :'merchant/edit', locals: { merchant: merchant }
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
end
