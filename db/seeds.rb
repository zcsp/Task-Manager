# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

test_user = User.create(name: 'Sean')
test_project = Project.create({ name: 'Brimmy'})
task_group = TaskGroup.create({ name: 'Web', project_id: test_project.id })
statuses = ['In Progress', 'Done', "Won't Be Done", 'Blocked']
status = Status.create(statuses.map { |s| { name: s }})
tasks = Task.create({ name: 'Test', task_group_id: task_group.id })

other_projects = ['WeScribe', 'Personal', "The Island's Box", 'EV Smart Island']
Project.create(other_projects.map { |p| { name: p }})
