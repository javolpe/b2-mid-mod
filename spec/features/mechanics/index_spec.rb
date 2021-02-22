require 'rails_helper'

RSpec.describe 'Mechanics Index' do 
  before :each do 
    @james = Mechanic.create!(name: "James Holden", years_experience: 4)
    @naomi = Mechanic.create!(name: "Naomi Nagata", years_experience: 11)
    @amos = Mechanic.create!(name: "Amos Burton", years_experience: 8)
  end
  it 'shows all mechanics, their years of exp, and avg years of experience' do 
    visit '/mechanics'
    
    expect(page).to have_content(@james.name)
    expect(page).to have_content(@james.years_experience)
    expect(page).to have_content(@naomi.name)
    expect(page).to have_content(@naomi.years_experience)
    expect(page).to have_content(@amos.name)
    expect(page).to have_content(@amos.years_experience)

    expect(page).to have_content(7)
  end
end