-- Julia Chen
-- Rewards Redeemed over a Six Month Period
-- Client can view popular-redeemed rewards in a certain timespan and curate special reward offers to drive business during specific timeframes.
-- Displays all rewards redeemed by customers over a given six month timeframe
-- Row Number,Date,Reward Name,Point Value
SELECT ROW_NUMBER()
OVER(ORDER BY Reward.date_added) AS ROW_NUM,
CustomerReward.date_applied AS 'Date',
Reward.Reward_name AS 'Reward Name',
Reward.point_cost AS 'Point Value'

FROM Reward
INNER JOIN CustomerReward ON  Reward.id = CustomerReward.reward_id 
INNER JOIN RewardStatus ON RewardStatus.id = Reward.reward_status_id
INNER JOIN PointLog on Reward.point_cost = PointLog.points_amount

WHERE RewardStatus.is_active = 1
AND CustomerReward.date_applied > '2012-01-01' AND
CustomerReward.date_applied < '2012-06-30';