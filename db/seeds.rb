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
statuses = [
  { name: 'In Progress', color: '#F3BF72' },
  { name: 'Done', color: '#6AD096' },
  { name: "Won't Be Done", color: '#7A7E91' },
  { name: 'Stuck', color: '#D8707F' },
]
status = Status.create(statuses)
tasks = Task.create({ name: 'Test', task_group_id: task_group.id })

other_projects = ['WeScribe', 'Personal', "The Island's Box", 'EV Smart Island']
Project.create(other_projects.map { |p| { name: p }})
