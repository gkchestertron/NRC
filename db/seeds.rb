# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Page.create(title: 'Home')
Page.create(title: 'About')
Page.create(title: 'Contact')

Layout.create(name: 'home', page_id: 1, html: '<div class="row">
  <div class="col-xs-12">
    <h1 id="title" class="editable">Title</h1>
    <hr>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <p id="description" class="editable">description</p>
    <p id="description2" class="editable">description2</p>

  </div>
</div>

')
Layout.create(name: 'home', page_id: 2, html: '<div class="row">
  <div class="col-xs-12">
    <h1 id="title" class="editable">Title</h1>
    <hr>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <p id="description" class="editable">description</p>
    <p id="description2" class="editable">description2</p>

  </div>
</div>

')
Layout.create(name: 'home', page_id: 3, html: '<div class="row">
  <div class="col-xs-12">
    <h1 id="title" class="editable">Title</h1>
    <hr>
  </div>
</div>
<div class="row">
  <div class="col-xs-12">
    <p id="description" class="editable">description</p>
    <p id="description2" class="editable">description2</p>

  </div>
</div>

')

u = User.create(email: 'guest@nrccms.com', password: 'foobies')
u.admin = true
u.save!