Rails.application.routes.draw do
  match 'thanks/*thankee', to: 'thanks#thank', via: [:get], as: :thanks
  match 'blessyou/*blessee', to: 'bless_you#bless_you', via: [:get], as: :bless_you
  match 'thing/*thing/*thingee', to: 'thing#thing', via: [:get], as: :thing
  root 'thanks#index'
end
