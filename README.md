a tool by Matthew Hinea



1. What is the relationship between a survey and its questions?
A survey has many questions. A questions belongs to one survey.

2. How might you create a survey and also create questions for it?
A user has a "Create Survey" button available to them from the navigation. 
Upon clicking that button, they're directed to a page with two forms for new questions - one sliding scale, one multiple-choice.
  Number range questions have: text field (for question)
                               text field (for scale explanation)
                               dropdown select (for user to input answer between admin's choice for min and max) 
  Multiple choice  questions have: text field(for question)

Upon clicking that form submit button, the page reloads, now with two forms, one for a new question as before, and one filled in with pre-existing question data - an edit questions page. 

3. What is the relationship between a multiple choice question and its options?


4. How do you create a multiple choice questions and also create options for it?


Database mockup:
Models for: Surveys, Questions, MCAnswers 
A survey has\_many questions; a question belongs\_to a survey. 
A question has\_one or has\_many answers, an answer has\_one question. 

Survey:
      name:string
      description:text

Question: 
      text:text
      survey_id:integer

Answer: 
      text:text
      question_id:integer



# project_surveyor
Build it, take it, view it.

[A Ruby on Rails project from the Viking Code School which uses Active Record Associations, nested forms, collection forms, range fields, and PostgreSQL](https://www.vikingcodeschool.com)
