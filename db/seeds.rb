# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroying existing records..."
PostEditor.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating Users (Creators and Editors)..."
creator = User.create!(name: "Alice Creator", email: "alice@example.com")
editor1 = User.create!(name: "Bob Editor", email: "bob@example.com")
editor2 = User.create!(name: "Charlie Editor", email: "charlie@example.com")

puts "Creating Posts..."
post1 = Post.create!(title: "Ruby on Rails Associations", content: "Learning about 1:M and M:M.", creator: creator)
post2 = Post.create!(title: "Advanced Active Record", content: "Diving deeper into Active Record.", creator: creator)

puts "Assigning Editors to Posts..."
PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)
PostEditor.create!(post: post2, editor: editor1)

puts "Seeding complete!"
puts "Created #{User.count} users, #{Post.count} posts, and #{PostEditor.count} post-editor assignments."
