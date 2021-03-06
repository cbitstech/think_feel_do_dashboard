# frozen_string_literal: true
require "rails_helper"

feature "Researcher - Users", type: :feature do
  fixtures :all

  before do
    sign_in(users(:researcher1))
    visit "/think_feel_do_dashboard/users"
  end

  it "displays the users that currently exist" do
    expect(page).to have_text "clinician1@example.com"
  end

  it "should display errors if required fields aren't filled in when created" do
    click_on "New"
    click_on "Create"

    expect(page).to have_text "prohibited this user from being saved"
  end

  it "should enable the creation of a user" do
    expect(page).to_not have_text "mike@example.com"

    click_on "New"
    fill_in "Email", with: "mike@example.com"
    check "Researcher"
    click_on "Create"

    expect(page).to have_text "User was successfully created"
    expect(page).to have_text "Email: mike@example.com"
    expect(page).to have_text "Roles: Researcher"

    user = User.find_by_email("mike@example.com")
    expect(user.encrypted_password).to_not be_nil

    visit "/think_feel_do_dashboard/users"

    expect(page).to have_text "mike@example.com"
  end

  it "should not enable the creation of a Super User" do
    click_on "New"

    expect(page).to_not have_text "Super User"
  end

  it "should enable the updating of a user" do
    click_on "clinician1@example.com"

    expect(page).to have_text "Email: clinician1@example.com"
    expect(page).to_not have_text "Email: what@ex.co"
    expect(page).to_not have_text "Roles: Clinician and Researcher"

    click_on "Edit"
    check "Researcher"
    fill_in "Email", with: "what@ex.co"
    click_on "Update"

    expect(page).to have_text "User was successfully updated"
    expect(page).to_not have_text "Email: clinician1@example.com"
    expect(page).to have_text "Email: what@ex.co"
    expect(page).to have_text "Roles: Clinician and Researcher"

    visit "/think_feel_do_dashboard/users"
    expect(page).to have_text "what@ex.co"

    click_on "what@ex.co"
    click_on "Edit"
    uncheck "Researcher"
    check "Clinician"
    check "Content Author"
    click_on "Update"

    expect(page).to_not have_text "Roles: Clinician and Researcher"
    expect(page).to have_text "Roles: Clinician and Content Author"

    # default check if attribute
    click_on "Edit"
    click_on "Update"

    expect(page).to have_text "Roles: Clinician and Content Author"
  end

  it "should not enable the updating of a User to be a Super User" do
    click_on "clinician1@example.com"
    click_on "Edit"

    expect(page).to_not have_text "Super User"
  end

  it "should display errors if required fields aren't filled in" do
    click_on "clinician1@example.com"
    click_on "Edit"
    fill_in "Email", with: ""
    click_on "Update"

    expect(page).to have_text "prohibited this user from being saved"
  end

  it "should be able to delete a user" do
    click_on "clinician1@example.com"
    click_on "Destroy"

    expect(page).to have_text "User was successfully destroyed"
    expect(page).to_not have_text "clinician1@example.com"
  end
end
