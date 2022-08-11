survey1 = Survey.create!(name: "Pisano Survey")
question1 = Question.create!(title: "How was your experience with us today?", question_type: 1,
                            survey_id: survey1.id)
Question.create!(title: "Please explain the reason for your choice", question_type: 0,
                            survey_id: survey1.id)
Option.create!(title: "Very Good", question_id: question1.id)
Option.create!(title: "Good", question_id: question1.id)
Option.create!(title: "Neutral", question_id: question1.id)
Option.create!(title: "Bad", question_id: question1.id)
Option.create!(title: "Very Bad", question_id: question1.id)