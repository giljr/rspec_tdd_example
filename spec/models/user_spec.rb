require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a valid email and password" do
    user = User.new(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(
      email: nil,
      password: "password",
      password_confirmation: "password"
    )
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = User.new(email: "test@example.com", password: nil)
    expect(user).not_to be_valid
  end
end

# ✅ Explanation:

# First test: Checks that a user with valid attributes is valid.

# Second test: Ensures a user without an email is invalid.

# Third test: Ensures a user without a password is invalid.