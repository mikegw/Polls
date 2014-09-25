-- SQL for bonus (NEEDS WORK)


SELECT
COUNT(questions.id) AS num_questions_per_poll
FROM
questions
JOIN
polls
ON
polls.id = questions.poll_id
GROUP BY
polls_id


SELECT
  -- polls.*,
 --  poll_question_counts.num_questions_per_poll,
 --  COUNT(questions.id) AS num_questions_answered_by_user
 SELECT
 polls.id, COUNT(user_responses.id) AS user_responses_count, COUNT(num_questions_per_poll)
FROM
  questions
JOIN
  polls ON polls.id = questions.poll_id
JOIN (
  SELECT
  answer_choices.*
  FROM
    answer_choices
  LEFT OUTER JOIN
    responses
    ON responses.answer_choice_id = answer_choices.id
  WHERE
  responses.user_id = 2
) AS user_responses
ON
  questions.id = user_responses.question_id
JOIN (
  SELECT
    polls.id, questions.id AS num_questions_per_poll
  FROM
    questions
  JOIN
    polls
  ON
    polls.id = questions.poll_id
) AS poll_question_counts
ON poll_question_counts.id = user_responses.id
GROUP BY
  polls.id;


