require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'test@test.com', password: 'password', password_confirmation: 'password')
  it 'has a title' do
    post = Post.new(title: '', body: 'This is a valid body.', views: 10, user: current_user)
    expect(post).not_to be_valid
    post.title = 'A Title'
    expect(post).to be_valid
  end

  it 'has content' do
    post = Post.new(title: 'A valid Title', body: '', views: 10, user: current_user)
    expect(post).not_to be_valid
    post.body = 'This is a valid body.'
    expect(post).to be_valid
  end

  it 'has a title longer than 2 characters' do
    post = Post.new(title: 'A', body: 'A valid body', views: 10, user: current_user)
    expect(post).not_to be_valid
    post.title = 'AB'
    expect(post).to be_valid
  end

  it 'has content between 5 and 100 characters' do
    post = Post.new(title: 'A valid Title', body: '', views: 10, user: current_user)
    expect(post).not_to be_valid
    post.body = '12345'
    expect(post).to be_valid
    post.body = 'A' * 101
    expect(post).not_to be_valid
  end

  it 'has views as an integer' do
    post = Post.new(title: 'A valid Title', body: 'This is a valid body.', views: 'ten', user: current_user)
    expect(post).not_to be_valid
    post.views = 10
    expect(post).to be_valid
    expect(post.views).to be_a(Integer)
  end
end
