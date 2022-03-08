select a.name,a.follower,a.date,b.name,b.follower,b.date,(a.follower-b.follower)/b.follower follow_rate from

-- 第一張表
(SELECT *,row_number() over (partition by name order by date) cur,(row_number() over (partition by name order by date))-1 pre FROM api.ig) a 

-- 第二張表
right join (SELECT *,row_number() over (partition by name order by date) cur,(row_number() over (partition by name order by date))-1 pre FROM api.ig) b

on a.name = b.name and a.pre=b.cur order by a.name,a.date desc

-- 自己join自己，找出diff