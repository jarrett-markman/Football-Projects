DROP TABLE IF EXISTS super_bowl_qb_stats
GO
create table super_bowl_qb_stats
(qb_year smallint,
qb_epa_play_A decimal (2,2),
qb_epa_play_B decimal (2,2),
qb_passer_rating_A float (1),
qb_passer_rating_B float (1)
)
GO
select * from super_bowl_qb_stats
GO
INSERT INTO super_bowl_qb_stats
(qb_year,
qb_epa_play_A,
qb_epa_play_B,
qb_passer_rating_A,
qb_passer_rating_B
)
VALUES
(2001, '-00.13', '-00.11', '86.2', '78.3'),
(2002, '00.26', '-00.50', '79.9', '48.9'),
(2003, '00.37', '00.15', '100.5', '113.6'),
(2004, '00.22', '00.10', '110.2', '75.4'),
(2005, '-00.38', '-00.15', '22.6', '67.8'),
(2006, '00.08', '-00.56', '81.8', '68.3'),
(2007, '00.13', '00.00', '87.3', '82.5'),
(2008, '00.21', '00.08', '93.2', '112.3'),
(2009, '00.44', '00.09', '114.5', '88.5'),
(2010, '00.20', '-00.04', '111.5', '77.4'),
(2011, '00.30', '00.19', '103.7','91.1'),
(2012, '00.30', '00.15', '124.2', '91.7'),
(2013, '00.55', '-00.20', '123.1', '73.5'),
(2014, '00.26', '00.22', '101.1', '110.6'),
(2015, '-00.44', '-00.22', '56.6', '55.4'),
(2016, '00.24', '00.10', '144.1', '95.2'),
(2017, '00.44', '00.35', '106.1', '115.4'),
(2018, '-00.02', '-00.26', '71.4', '57.9'),
(2019, '00.15', '00.01', '78.1', '69.2'),
(2020, '00.36', '-00.19', '125.8', '52.3'),
(2021, '00.18', '-00.23', '89.9', '100.9')
GO
-- there are 21 years of epa/play data, so I decided to use quarterback statistics from super bowls in the past 21 years
select *, SYSTEM_USER from super_bowl_qb_stats
GO
select *, SYSTEM_USER from super_bowl_qb_stats
where qb_epa_play_A > qb_epa_play_B
GO
-- 18/21 of the winning qbs have a better epa/play
select *, SYSTEM_USER from super_bowl_qb_stats
where qb_passer_rating_A > qb_passer_rating_B
GO
-- 15/21 of the winning qbs have a better epa/play
select *, system_user from super_bowl_qb_stats
where qb_epa_play_A > qb_epa_play_B OR qb_passer_rating_A > qb_passer_rating_B
GO
-- 21/21 or 100% of the time the winning qb has either a better epa/play or a better passer rating
select *, SYSTEM_USER from super_bowl_qb_stats
where qb_epa_play_A > qb_epa_play_B AND qb_passer_rating_A > qb_passer_rating_B
GO
-- 13/21 years the winning qb has a better epa/play and a better passer rating than the losing qb
select *, system_user from super_bowl_qb_stats
where qb_epa_play_A < 0
-- if a quarterback is contributing negative expected points it's probably fair to assume they are not playing well
GO
-- 4/21 super bowl winning qbs contribute negative expected points to their team per play
select *, system_user from super_bowl_qb_stats
where qb_passer_rating_A < 85.5
-- 85.5 is the average passer rating in the NFL from 2001-2021
GO
-- 6/21 super bowl winning qbs have a below average passer rating in the NFL
select *, system_user from super_bowl_qb_stats
where qb_epa_play_A < 0 or qb_passer_rating_A <85.8
GO
-- 7/21 super bowl winning qbs have either negative expected points added or a below average passer rating
select *, system_user from super_bowl_qb_stats
where qb_epa_play_A < 0 and qb_passer_rating_A < 85.5
-- in 3/21 years the super bowl winning qb has had negative expected points added and a below average passer rating
GO
select *, system_user from super_bowl_qb_stats
where qb_epa_play_B > qb_epa_play_A or qb_passer_rating_B > qb_passer_rating_A
GO
-- in 8/21 years 
select *, system_user from super_bowl_qb_stats
where qb_epa_play_B > qb_epa_play_A and qb_passer_rating_B > qb_passer_rating_A
GO
-- it has only occured once, but in the 2005-2006 super bowl, the winning qb had a worse epa/play and passer rating
-- end of code