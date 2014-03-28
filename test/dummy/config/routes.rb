Rails.application.routes.draw do
  mount Resthook::Engine => '/resthook'
end
