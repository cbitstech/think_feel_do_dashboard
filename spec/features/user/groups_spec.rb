require "spec_helper"

feature "Groups" do
  fixtures :all

  # before do
  #   visit "/think_feel_do_dashboard/groups"
  # end

  # it "displays the projects that currently exist" do
  #   expect(page).to have_text "Project 1"
  # end

  # it "should display errors if required fields aren't filled in when created" do
  #   click_on "New"
  #   click_on "Create"

  #   expect(page).to have_text "prohibited this project from being saved"
  # end

  # it "should enable the creation of a participant" do
  #   expect(page).to_not have_text "HUGe PrOjEct 3"

  #   click_on "New"
  #   fill_in "Name", with: "HUGe PrOjEct 3"
  #   click_on "Create"

  #   expect(page).to have_text "Project was successfully created"
  #   expect(page).to have_text "Name: HUGe PrOjEct 3"

  #   click_on "Arms"

  #   expect(page).to have_text "HUGe PrOjEct 3"
  # end

  # it "should display errors if required fields aren't filled in" do
  #   click_on "Project 1"
  #   click_on "Edit"
  #   fill_in "Name", with: ""
  #   click_on "Update"

  #   expect(page).to have_text "prohibited this project from being saved"
  # end

  # it "should enable the updating of a participant" do
  #   click_on "Project 1"

  #   expect(page).to have_text "Name: Project 1"
  #   expect(page).to_not have_text "Name: What!"

  #   click_on "Edit"
  #   fill_in "Name", with: "What!"
  #   click_on "Update"

  #   expect(page).to_not have_text "Name: Project 1"
  #   expect(page).to have_text "Name: What!"
  # end

  # it "should be able to delete a project" do
  #   click_on "Project 1"
  #   click_on "Destroy"

  #   expect(page).to have_text "Project was successfully destroyed"
  #   expect(page).to_not have_text "Project 1"
  # end
end