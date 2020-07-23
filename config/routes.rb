# frozen_string_literal: true

Rails.application.routes.draw do

  # Company
  # https://app.com.br/empresa
  root to: 'home#index'
  get '/empresa' => 'company#index', as: :company

  # Methodology
  # https://app.com.br/metodologia
  get '/metodologia' => 'methodology#index', as: :methodology

  # Services
  # https://app.com.br/servicos
  get '/servicos' => 'services#index', as: :services
  get '/servicos/planejamento-e-estrategia' => 'services#strategy', as: :strategy_service
  get '/servicos/inbound-marketing' => 'services#inbound_marketing', as: :inbound_marketing_service
  get '/servicos/midia-paga' => 'services#paid_midia', as: :paid_midia_service
  get '/servicos/marketing-de-conteudo' => 'services#content_marketing', as: :content_marketing_service
  get '/servicos/seo' => 'services#seo', as: :seo_service
  get '/servicos/automacao-de-marketing' => 'services#marketing_automation', as: :marketing_automation_service
  get '/servicos/social-media' => 'services#social_media', as: :social_media_service
  get '/servicos/business-intelligence' => 'services#business_intelligence', as: :business_intelligence_service
  get '/servicos/desenvolvimento' => 'services#development', as: :development_service

  # Blog
  # https://blog.app.com.br/posts/
  namespace :blog, constraint: { subdomain: 'blog' }, path: '/' do
    resources :posts, only: [:index, :show]
  end

  # Contact
  # https://app.com.br/contato
  get  '/contato' => 'contact#index',  as: :contact
  post '/contato' => 'contact#create', as: :send_email
end
