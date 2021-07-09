# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding products

PRODUCTS = [
  {
    title: 'Seven Mobile Apps in Seven Week',
    description: %{<p> <em>Native Apps, Multiple Platforms</em> Answer the question "Can we build this for ALL the devices?" with a resounding YES. This book will help you get there with a real-world introduction to seven platforms, whether you're new to mobile or an experienced developer needing to expand your options. Plus, you'll find out which cross-platform solution makes the most sense for your needs.</p>},
    image_url: '7apps.jpg',
    price: 29.00
  },
  {
    title: 'Build Chatbot Interactions',
    description: %{<p>
      <em>Responsive, Intuitive Interfaces with Ruby</em>
      The next step in the evolution of user interfaces is here.
      Chatbots let your users interact with your service in their
      own natural language. Use free and open source tools along
      with Ruby to build creative, useful, and unexpected interactions
      for users. Take advantage of the Lita framework’s step-by-step
      implementation strategy to simplify bot development and testing.
      From novices to experts, chatbots are an area in which everyone
      can participate. Exercise your creativity by creating chatbot
      skills for communicating, information, and fun.
      </p>},
    image_url: 'dpchat.jpg',
    price: 20.00
  },
]

PRODUCTS.each { |product| Product.find_or_create_by!(product)}