
-- 2a. top 25 schools
select email_domain, COUNT(email_domain) from users
where email_domain like "%.edu"
group by email_domain
order by Count(email_domain) desc
limit 25;

-- 2b. NYU.edu learners
select count(*) from users
where email_domain = "%NYU.edu";

-- 2c. Number of codecademy learners on the mobile app.
select * from users
where mobile_app = "mobile-user";

-- 3. sign up counts for each hour
SELECT 
   date_format(sign_up_at, '%H'), count(date_format(sign_up_at, '%H'))
FROM users
GROUP BY 1
ORDER BY date_format(sign_up_at, '%H') desc;

-- joining both tables
select * from users
join progress 
on users.user_id = progress.user_id


-- 4a. different schools and their different courses
select users.email_domain, 
		SUM(CASE 
          WHEN progress.learn_cpp in ("completed", "started") 
			THEN 1 
			ELSE 0 
        END) AS num_learn_cpp, 
        SUM(CASE 
          WHEN progress.learn_sql in ("completed", "started") 
			THEN 1 
			ELSE 0 
        END) as num_learn_sql,
        SUM(CASE 
          WHEN progress.learn_html in ("completed", "started") 
			THEN 1 
			ELSE 0 
        END) as num_learn_html,
        SUM(CASE 
          WHEN progress.learn_javascript in ("completed", "started") 
			THEN 1 
			ELSE 0 
        END) as num_learn_javascript,
        SUM(CASE 
          WHEN progress.learn_java in ("completed", "started") 
			THEN 1 
			ELSE 0 
        END) num_learn_java
        from users
join progress 
on users.user_id = progress.user_id
 group by email_domain;
 
 -- 4b. Courses the New York students are taking
 select * from users
join progress 
on users.user_id = progress.user_id
where city = "New York";
 
 
 -- 4c. Courses the Chicago students are taking
select * from users
join progress 
on users.user_id = progress.user_id
where city = "Chicago";
 

