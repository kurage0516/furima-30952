FactoryBot.define do
  factory :form_object do
    token            { 'tok_abcdefghijk00000000000000000' }
    postal_code      { '542-0764' }
    area_id          { 2 }
    municipality     { '大阪市中央区' }
    address          { '難波5丁目1-60' }
    building_name    { 'なんばスカイオ15階' }
    phone_number     { '05031873522' }
  end
end
