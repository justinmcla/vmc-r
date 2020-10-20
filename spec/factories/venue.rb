FactoryBot.define do

  factory :venue do
    name             { 'Test Theater' }
    seats            { 300 }
    configuration    { 'Proscenium' }
    greenrooms       { 2 }
    dressing_rooms   { 4 }
  end

end