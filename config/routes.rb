Rails.application.routes.draw do
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
  root 'timetable#index'
  
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
  #위 url을 절대 실행하지 마시오 ! -DB에 또 2880개 정보 들어가버림
  
end