# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{username: 'John'}])
User.create([{username: 'Tim'}])
User.create([{username: 'Samantha'}])
User.create([{username: 'Julie'}])

Poll.create([{author_id: 1, title: 'Do you like rails?'}])
Poll.create([{author_id: 2, title: 'Do you like ruby?'}])
Poll.create([{author_id: 3, title: 'Do you like sql?'}])
Poll.create([{author_id: 1, title: 'Is it pronounced s.q.l?'}])

Question.create([{text: "How do you print stuff? Why are we learning it?", poll_id: 1}])
Question.create([{text: "Ruby is cool don't you agree?", poll_id: 2}])
Question.create([{text: "SQL is hard???? I don't like it, do you?", poll_id: 3}])
Question.create([{text: "How do you actually pronounce it? Does it matter?", poll_id: 4}])

AnswerChoice.create([{text: "You can't print. You have to learn it", question_id: 1}])
AnswerChoice.create([{text: "You can print. It is useful to know", question_id: 1}])
AnswerChoice.create([{text: "Ruby sucks you're wrong", question_id: 2}])
AnswerChoice.create([{text: "SQL isn't that bad. I like it", question_id: 3}])
AnswerChoice.create([{text: "It is prounced seKEWL. Get it right, dude", question_id: 4}])

Response.create([{user_id: 4, question_id: 1, answer_choice_id: 1}])
Response.create([{user_id: 4, question_id: 1, answer_choice_id: 2}])
Response.create([{user_id: 2, question_id: 2, answer_choice_id: 3}])
Response.create([{user_id: 3, question_id: 3, answer_choice_id: 4}])
Response.create([{user_id: 1, question_id: 4, answer_choice_id: 5}])
