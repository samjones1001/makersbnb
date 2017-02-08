feature 'Confirm bookings'do
  scenario 'view bookings request' do
    sign_up
    Space.create(name: "Space 1",
                 description: "Room with a view",
                 price_per_night: 105.00,
                 image: "text for an image")
    Booking.create(hired: false,
                   from_date: '2017-02-09',
                   to_date:    '2017-02-15',
                   created_on: '2017-02-05T23:58:32+00:00',
                   space_id: '1',
                   user_id: '1')
    visit '/booking/bookings'
    expect(page).to have_content "booking request"
    expect(page).to have_content "Space 1"
  end
end
