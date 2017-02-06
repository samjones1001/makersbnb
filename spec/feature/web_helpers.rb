def new_listing(name="Name", description="Description", price_per_night=4.50, available_from="01/01/2017", available_to="01/02/2017")

  visit('/spaces/new')
  fill_in('name', with: name)
  fill_in('description', with: description)
  fill_in('price_per_night', with: price_per_night)
  fill_in('available_from', with: available_from)
  fill_in('available_to', with: available_to)
  click_button('List my Space')

end
