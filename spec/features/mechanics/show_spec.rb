require 'rails_helper' 

RSpec.describe 'Mechanic Show page' do 
  before :each do 
    @merry_go_round = Ride.create!(name: "Merry Go Round", thrill_rating: 3, open: true)
    @batcoaster = Ride.create!(name: "Bat Coaster", thrill_rating: 8, open: true)
    @splash_mountain = Ride.create!(name: "Splash Mountain", thrill_rating: 5, open: false)
    @dueling_dragons = Ride.create!(name: "Dueling Dragons", thrill_rating: 9, open: true)

    @james = Mechanic.create!(name: "James Holden", years_experience: 4)
    @naomi = Mechanic.create!(name: "Naomi Nagata", years_experience: 11)
    @amos = Mechanic.create!(name: "Amos Burton", years_experience: 8)

    @rm1 = RideMechanic.create!(ride_id: @merry_go_round.id, mechanic_id: @james.id)
    @rm2 = RideMechanic.create!(ride_id: @merry_go_round.id, mechanic_id: @naomi.id)
    @rm3 = RideMechanic.create!(ride_id: @batcoaster.id, mechanic_id: @naomi.id)
    @rm4 = RideMechanic.create!(ride_id: @batcoaster.id, mechanic_id: @amos.id)
    @rm5 = RideMechanic.create!(ride_id: @splash_mountain.id, mechanic_id: @amos.id)
    @rm6 = RideMechanic.create!(ride_id: @dueling_dragons.id, mechanic_id: @james.id)
    @rm7 = RideMechanic.create!(ride_id: @dueling_dragons.id, mechanic_id: @naomi.id)
    @rm8 = RideMechanic.create!(ride_id: @dueling_dragons.id, mechanic_id: @amos.id)
  end
  it 'shows the mechanic name, YOE, names of rides they work on if ride is open' do 
    visit "/mechanics/#{@amos.id}"

    expect(page).to have_content(@amos.name)
    expect(page).to have_content(@amos.years_experience)

    expect(page).to have_content(@batcoaster.name)
    expect(page).to have_content(@dueling_dragons.name)
    expect(page).not_to have_content(@splash_mountain.name)
  end

  it 'can add a ride to the mechanics workload' do 
    visit "/mechanics/#{@amos.id}"

    expect(page).to have_content(@amos.name)
    expect(page).to have_content(@amos.years_experience)

    expect(page).to have_content(@batcoaster.name)
    expect(page).to have_content(@dueling_dragons.name)
    expect(page).not_to have_content(@splash_mountain.name)

    fill_in "Ride", with: "#{@merry_go_round.id}"
    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{@amos.id}")
    expect(page).to have_content(@batcoaster.name)
    expect(page).to have_content(@dueling_dragons.name)
    expect(page).to have_content(@merry_go_round.name)

    expect(page).not_to have_content(@splash_mountain.name)
  end

end