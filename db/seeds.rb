# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create({
    name: "Administrator",
    email: "admin@admin.com",
    password: 'administrator' 
})

admin.add_role :admin

expert_role = Role.create({
    name: "expert"
})

#### Datos para tests (comentar en produccion)

owner = User.create({
    name: "Usuario Owner",
    email: "owner@owner.com",
    password: "password"
})

viewer = User.create({
    name: "Usuario Viewer",
    email: "viewer@viewer.com",
    password: "password"
})

expert = User.create({
    name: "Usuario Expert",
    email: "expert@expert.com",
    password: "password"
})

expert.add_role :expert

farm_one = Farm.create({
    name: "Farm one",
    description: "Farm's owner",
    address: "Address One"
})

farm_two = Farm.create({
    name: "Farm two",
    description: "Farm's owner"
})

owner.add_role :owner, farm_one
owner.add_role :owner, farm_two

viewer.add_role :viewer, farm_one

expert.add_role :viewer, farm_two

plot_one = Plot.create({
    farm_id: farm_one.id,
    identifier: "Identifier plot one",
    surface: 1000,
    greenhouse: false,
    description: "Plot of farm one"
})

plot_two = Plot.create({
    farm_id: farm_one.id,
    identifier: "Identifier plot two",
    surface: 100,
    greenhouse: true,
    description: "Plot of farm one"
})

species_one = Species.create({
    name: "Species One"
})

species_two = Species.create({
    name: "Species Two"
})

type_problem_one =TypeProblem.create({
    name: "Type Problem one",
    scientific_name: "SCientific name problem one"
})

type_problem_two =TypeProblem.create({
    name: "Type Problem two",
    scientific_name: "Scientific name problem two"
})

product_one = Product.create({
    name: "Product one name",
    composition: "Composition product one",
    description: "Description of product one"
})

product_two = Product.create({
    name: "Product two name",
    composition: "Composition product two"
})


variety_one = Variety.create({
    name: "Variety one name",
    scientific_name: "Scientific name variety One"
})


variety_two = Variety.create({
    name: "Variety two name",
    scientific_name: "Scientific name variety Two"
})

plantation_one = Plantation.create({
    plot_id: plot_one.id,
    species_id: species_one.id,
    user_id: owner.id,
    amount: 100,
    comment: "Comment plantation one"
})

plantation_two = Plantation.create({
    plot_id: plot_one.id,
    species_id: species_one.id,
    user_id: owner.id,
    amount: 1000,
    comment: "Comment plantation two"
})

plantation_three = Plantation.create({
    plot_id: plot_one.id,
    species_id: species_two.id,
    user_id: owner.id,
    amount: 10,
    comment: "Comment plantation three"
})

plantation_four = Plantation.create({
    plot_id: plot_two.id,
    species_id: species_one.id,
    user_id: owner.id,
    amount: 100,
    comment: "Comment plantation one for plot two"
})

