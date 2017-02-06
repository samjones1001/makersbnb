feature "Listing space" do

  scenario "user can list a new space" do

    expect { new_listing }.to change(Space, :count).by(1)

  end

end
