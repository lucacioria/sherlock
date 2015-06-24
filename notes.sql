SELECT count(1) FROM profiles;
SELECT count(DISTINCT user_id) FROM profiles;
SELECT count(DISTINCT user_id) FROM transfers;

SELECT user_id, count(1) FROM profiles GROUP BY user_id ORDER BY count(1) ASC; -- 00e902f9083c711620d48fd155945380 has 2014-12, 2015-02
SELECT * FROM profiles WHERE user_id = '00e902f9083c711620d48fd155945380'; -- distance is 1.41421
SELECT *, histogram REGEXP '[1-9]' AS FULL FROM profiles ORDER BY user_id, MONTH, profile_kind_id;

-- analyze amounts on user d70f57b9e07f2aa34e2b2c91860c5e03
SELECT user_id, count(1) FROM transfers GROUP BY user_id ORDER BY count(1) DESC; -- d70f57b9e07f2aa34e2b2c91860c5e03
SELECT * FROM transfers WHERE user_id = 'd70f57b9e07f2aa34e2b2c91860c5e03' ORDER BY TIMESTAMP;

-- search for a full, fat user in 2012/13
SELECT count(1)
FROM profiles
WHERE histogram REGEXP '[1-9]' = 1;

-- analyze anomalies
CREATE OR REPLACE VIEW anomalies AS SELECT *, abs(round((distance-average)/standard_deviation, 1)) AS anomaly, abs(round((normalized_distance-normalized_average)/normalized_standard_deviation, 1)) AS normalized_anomaly, histogram REGEXP '[1-9]' AS `full` FROM profiles ORDER BY user_id, MONTH;
-- amount on user d70f57b9e07f2aa34e2b2c91860c5e03
SELECT `month`, normalized_distance, normalized_average, normalized_standard_deviation, normalized_anomaly, distance, average, standard_deviation, anomaly FROM anomalies WHERE user_id = 'd70f57b9e07f2aa34e2b2c91860c5e03' AND profile_kind_id = 1;