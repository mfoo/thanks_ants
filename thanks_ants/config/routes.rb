Rails.application.routes.draw do
  match 'thanks/*thankee', to: 'thanks#thank', via: [:get]
  match 'blessyou/*blessee', to: 'bless_you#bless_you', via: [:get]
  match 'thing/*thing/*thingee', to: 'thing#thing', via: [:get]
  root 'thanks#index'
end
