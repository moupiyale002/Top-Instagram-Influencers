create database instagraminfluencers;
use instagraminfluencer;

 # Total Followers by Country
SELECT country, SUM(followers) AS total_followers
FROM instagraminfluencer
GROUP BY country
ORDER BY total_followers DESC;

 # Top 10 Influencers by Influence Score
SELECT rank_no, channel_info, influence_score, followers, avg_likes
FROM instagraminfluencer
ORDER BY influence_score DESC
LIMIT 10;

 # Average Engagement Rate per Country
SELECT country, AVG(60_day_eng_rate) AS avg_eng_rate
FROM instagraminfluencer
GROUP BY country;

# Influencers with Growth in New Likes
SELECT channel_info, avg_likes, new_post_avg_like,
       ((new_post_avg_like - avg_likes) / avg_likes) * 100 AS growth_percent
FROM instagraminfluencer
WHERE new_post_avg_like > avg_likes;

# Micro-Influencers (High Engagement, Low Followers)
SELECT channel_info, followers, 60_day_eng_rate
FROM instagraminfluencer
WHERE followers < 500000 AND 60_day_eng_rate > 5
ORDER BY 60_day_eng_rate DESC;





