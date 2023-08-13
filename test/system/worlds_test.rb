require "application_system_test_case"

class WorldsTest < ApplicationSystemTestCase
  setup do
    @world = worlds(:one)
  end

  test "visiting the index" do
    visit worlds_url
    assert_selector "h1", text: "Worlds"
  end

  test "should create world" do
    visit worlds_url
    click_on "New world"

    fill_in "Description", with: @world.description
    fill_in "Name", with: @world.name
    click_on "Create World"

    assert_text "World was successfully created"
    click_on "Back"
  end

  test "should update World" do
    visit world_url(@world)
    click_on "Edit this world", match: :first

    fill_in "Description", with: @world.description
    fill_in "Name", with: @world.name
    click_on "Update World"

    assert_text "World was successfully updated"
    click_on "Back"
  end

  test "should destroy World" do
    visit world_url(@world)
    click_on "Destroy this world", match: :first

    assert_text "World was successfully destroyed"
  end
end
