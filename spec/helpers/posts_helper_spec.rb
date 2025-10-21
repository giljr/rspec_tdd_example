require 'rails_helper'
include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  describe "#assign_post_creator" do
    it "assigns the given user as the creator of the post" do
      # === Arrange ===
      creator = User.first_or_create!(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      post = Post.new(
        title: 'Sample Post',
        body: 'This is a sample post body.',
        views: 42
      )

      # === Act ===
      returned_post = helper.assign_post_creator(post, creator)

      # === Assert ===
      expect(returned_post.user).to eq(creator)
      expect(returned_post.title).to eq('Sample Post')
      expect(returned_post.body).to eq('This is a sample post body.')
      expect(returned_post.views).to eq(42)
    end
  end
end

# Arrange → Act → Assert 
# (“AAA” in testing)

# It’s a pattern for structuring tests so they’re clear and easy to read. Let me break it down:

# 1. Arrange

# Prepare everything your test needs. This includes:
# Creating objects
# Setting up dependencies
# Preparing input data

# 2. Act

# Perform the action you want to test. Usually this is calling a method or triggering a behavior.

# 3. Assert

# Check that the result is what you expected using expectations.

# ✅ Why it matters

# The AAA pattern makes tests:

# Easy to read: anyone can see setup → action → check.

# Consistent: a uniform structure across your codebase.

# Simple to debug: each section has a clear purpose.