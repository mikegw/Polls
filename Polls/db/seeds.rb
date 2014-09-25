# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

users = [User.create!(user_name: 'Mike Williamson'),
User.create!(user_name: 'David Rozenberg'),
User.create!(user_name: 'Tommy Duek')]

polls = [Poll.create!(title: "Poodles", author_id: users[0].id),
Poll.create!(title: "Lunch", author_id: users[1].id),
Poll.create!(title: "SQL injections", author_id: users[0].id)]

questions = [Question.create!(text: 'What is your favorite poodle?', poll_id: polls[0].id),
Question.create!(text: 'How fluffy is your poodle?', poll_id: polls[0].id),
Question.create!(text: 'How fancy is your poodle?', poll_id: polls[0].id),
Question.create!(text: 'You just downloaded SQL Slammer, how fucked are you?', poll_id: polls[2].id),
Question.create!(text: "You just downloaded SQL Slammer. You're a white girl and you can't get on instagram. How done are you?", poll_id: polls[2].id),
Question.create!(text: "Starbucks messed up your order. You're a white girl from manhattan. How done are you?", poll_id: polls[1].id),
Question.create!(text: "You just found out your salad isn't organic. You're a white girl from LA. How done are you?", poll_id: polls[1].id)]

answers = [AnswerChoice.create!(text: 'Fancy-Fancy', question_id: questions[0].id),
AnswerChoice.create!(text: 'Frency', question_id: questions[0].id),
AnswerChoice.create!(text: 'Fluffy', question_id: questions[0].id),

AnswerChoice.create!(text: "1. 100% fluffy", question_id: questions[1].id),
AnswerChoice.create!(text: "2. 200% fluffy", question_id: questions[1].id),
AnswerChoice.create!(text: "3. SO fluffy", question_id: questions[1].id),
AnswerChoice.create!(text: "4. I can't even", question_id: questions[1].id),

AnswerChoice.create!(text: "1. 100% fancy", question_id: questions[2].id),
AnswerChoice.create!(text: "2. 200% fancy", question_id: questions[2].id),
AnswerChoice.create!(text: "3. SO fancy", question_id: questions[2].id),
AnswerChoice.create!(text: "4. I can't even", question_id: questions[2].id),

AnswerChoice.create!(text: "1. I can't get on facebook any more.", question_id: questions[3].id),
AnswerChoice.create!(text: "2. I can't watch porn any more.", question_id: questions[3].id),
AnswerChoice.create!(text: "3. I clogged up the internet pipes. Better call a plumber", question_id: questions[3].id),
AnswerChoice.create!(text: "4. Get Al Gore on the phone NOW!!", question_id: questions[3].id),

AnswerChoice.create!(text: "1. 100% done", question_id: questions[4].id),
AnswerChoice.create!(text: "2. 200% done", question_id: questions[4].id),
AnswerChoice.create!(text: "3. SO done", question_id: questions[4].id),
AnswerChoice.create!(text: "4. I can't even", question_id: questions[4].id),

AnswerChoice.create!(text: "1. 100% done", question_id: questions[5].id),
AnswerChoice.create!(text: "2. 200% done", question_id: questions[5].id),
AnswerChoice.create!(text: "3. SO done", question_id: questions[5].id),
AnswerChoice.create!(text: "4. I can't even", question_id: questions[5].id),

AnswerChoice.create!(text: "1. 100% done", question_id: questions[6].id),
AnswerChoice.create!(text: "2. 200% done", question_id: questions[6].id),
AnswerChoice.create!(text: "3. SO done", question_id: questions[6].id),
AnswerChoice.create!(text: "4. I can't even", question_id: questions[6].id)]

responses = [Response.create!(user_id: users[2].id, answer_choice_id: answers[2].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[6].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[10].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[14].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[18].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[22].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[26].id),

Response.create!(user_id: users[0].id, answer_choice_id: answers[1].id),
Response.create!(user_id: users[0].id, answer_choice_id: answers[5].id),
Response.create!(user_id: users[0].id, answer_choice_id: answers[9].id),
Response.create!(user_id: users[0].id, answer_choice_id: answers[13].id),
Response.create!(user_id: users[0].id, answer_choice_id: answers[17].id),
Response.create!(user_id: users[0].id, answer_choice_id: answers[21].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[25].id),

Response.create!(user_id: users[1].id, answer_choice_id: answers[0].id),
Response.create!(user_id: users[1].id, answer_choice_id: answers[4].id),
Response.create!(user_id: users[1].id, answer_choice_id: answers[8].id),
Response.create!(user_id: users[1].id, answer_choice_id: answers[12].id),
Response.create!(user_id: users[1].id, answer_choice_id: answers[16].id),
Response.create!(user_id: users[1].id, answer_choice_id: answers[20].id),
Response.create!(user_id: users[2].id, answer_choice_id: answers[24].id)]
