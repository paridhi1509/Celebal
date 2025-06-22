use Level_C;
create table Contests (contest_id int, hacker_id int, name varchar(50));
create table Colleges (college_id int, contest_id int);
create table Challenges (challenge_id int, college_id int);
create table View_Stats (challenge_id int, total_views int, total_unique_views int);
create table Submission_Stats (challenge_id int, total_submissions int, total_accepted_submissions int);
insert into Contests (contest_id, hacker_id, name) values
	(66406, 17973, 'Rose'),
	(66556, 79153, 'Angela'),
	(94828, 80275, 'Frank');
insert into Colleges (college_id, contest_id) values
	(11219, 66406),
	(32473, 66556),
	(56685, 94828);
insert into Challenges (challenge_id, college_id) values
	(18765, 11219),
	(47127, 11219),
	(60292, 32473),
	(72974, 56685);
insert into View_Stats (challenge_id, total_views, total_unique_views) values
	(47127, 26, 19),
	(47127, 15, 14),
	(18765, 43, 10),
	(18765, 72, 13),
	(75516, 35, 17),
	(60292, 11, 10),
	(72974, 41, 15),
	(75516, 75, 11);
insert into Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) values
	(75516, 34, 12),
	(47127, 27, 10),
	(47127, 56, 18),
	(75516, 74, 12),
	(75516, 83, 8),
	(72974, 68, 24),
	(72974, 82, 14),
	(47127, 28, 11);

--Query
select c.contest_id, c.hacker_id, c.name,
    coalesce(SUM(ss.total_submissions), 0) as total_submissions,
    coalesce(SUM(ss.total_accepted_submissions), 0) as total_accepted_submissions,
    coalesce(SUM(vs.total_views), 0) as total_views,
    coalesce(SUM(vs.total_unique_views), 0) as total_unique_views
from Contests c
join Colleges col on c.contest_id = col.contest_id
join Challenges ch on col.college_id = ch.college_id
left join (
    select challenge_id,
           SUM(total_submissions) as total_submissions,
           SUM(total_accepted_submissions) as total_accepted_submissions
    from Submission_Stats
    group by challenge_id
) ss on ch.challenge_id = ss.challenge_id
left join (
    select challenge_id,
           SUM(total_views) as total_views,
           SUM(total_unique_views) as total_unique_views
    from View_Stats
    group by challenge_id
) vs on ch.challenge_id = vs.challenge_id
group by c.contest_id, c.hacker_id, c.name
having coalesce(SUM(ss.total_submissions), 0) > 0 
    OR coalesce(SUM(ss.total_accepted_submissions), 0) > 0 
    OR coalesce(SUM(vs.total_views), 0) > 0 
    OR coalesce(SUM(vs.total_unique_views), 0) > 0
order by c.contest_id;

