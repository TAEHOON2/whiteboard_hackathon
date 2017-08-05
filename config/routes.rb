Rails.application.routes.draw do
  resources :sigandannies
  resources :dannies
  get 'dannies/new'

  get 'dannies/show'

  get 'scheduler/tt'
  get 'sigans/danny'
  resources :sigans do
    resources :siplies
  end
  resources :posts do
    resources :replies
  end
  
  devise_for :users
  get 'timetable/index'

  get 'timetable/create'

 
  get 'crawlers/viewfile'
  root 'posts#new'
  
  get 'crawlers/searchtest'
  get 'crawlers/result'
  
  get 'crawlers/searchtest2'
  get 'crawlers/intersection'
  post 'crawlers/create'
  #resources :crawls do
    #collection { post :search, to: 'crawlers/searchtest2' }
  #end
  get 'crawlers/individual'
   get 'crawlers/testing'  
   get 'crawlers/showsigan'
   
  get 'crawlers/tt'
  
   
  #위 url을 절대 실행하지 마시오 ! -DB에 또 2880개 정보 들어가버림
  match 'search' => 'crawlers#search', :as =>'search', :via =>:get
  match 'search_result' =>'crawlers#searchresult', :as => 'searchresult', :via => :post
  match 'search_result2' =>'crawlers#searchresult2', :as => 'searchresult2', :via => :post
end