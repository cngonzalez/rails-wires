# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


page = Page.create(user_id: 1, body_color: 'blue')
element_1 = Element.new(position: 1, div: 2, color: 'green', size: 1, page_id: 2)
element_2 = Element.new(position: 5, div: 3, color: 'green', size: 2, page_id: 2)

element_1.save
element_2.save
