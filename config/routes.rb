Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'category' do
        get 'index', to: 'category#index'
        get 'show/:id', to: 'category#show'
        post 'create', to: 'category#create'
        patch 'update/:id', to: 'category#update'
        delete 'delete/:id', to: 'category#delete'
      end
      scope 'brand' do
        get 'index', to: 'brand#index'
        get 'show/:id', to: 'brand#show'
        post 'create', to: 'brand#create'
        patch 'update/:id', to: 'brand#update'
        delete 'delete/:id', to: 'brand#delete'
      end
      scope 'product' do
        get 'index', to: 'product#index'
        get 'show/:id', to: 'product#show'
        post 'create', to: 'product#create'
        patch 'update/:id', to: 'product#update'
        delete 'delete/:id', to: 'product#delete'
      end
    end
  end
end
