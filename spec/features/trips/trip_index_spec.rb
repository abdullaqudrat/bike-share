=beging
As a visitor,
When I visit the trips index,
I see the first 30 trips
(duration, start date, start station, end date,
end station, bike id, subscription type, zip code),
I also see a button to see more pages of trips,
When I visit a second page,
there should be buttons to move both forward and backward in time.
** All Attributes must be present **
=end

require 'rails_helper'

feature 'Trip index page' do
  scenario 'When a visitor visits page, they see all trips' do
    it 'show visitor all info for the first 30 trips' do
      trip_1 = Trip.create(duration: 12, start_date: , end_date: , bike_id: 23, subscription_type: 'premium')


    visit trips_path

    expect(page).to have_content(trip.duration)
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.end_date)
    expect(page).to have_content(trip.bike_id)
    expect(page).to have_content(trip.subscription_type)
    expect(page).to have_content(trip.zipcode)

    click_on #button/link provided by pagenation gem to move to next page
    expect(current_path).to eq()
    expect(page).to have_xpath("//a")
  end
  it 'shows links for navigating between pages' do
    expect(page).to have_link
  end
end
