FactoryBot.define do 

  factory :address do
    address_1         { '100 Main Street' }
    address_2         { 'Suite 203' }
    city              { 'New York' }
    state             { 'NY' }
    zip               { '10000' }
    addressable_id    { }
    addressable_type  { }
  end

end