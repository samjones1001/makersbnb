feature "Listing space" do

  scenario "user can list a new space" do

    sign_up
    expect { new_listing }.to change(Space, :count).by(1)
  

  end

  scenario "user can list a new space and save dates" do

    sign_up
    expect { new_listing }.to change(Availabledate, :count).by(5)

  end


end
