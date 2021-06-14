--
CREATE TABLE User
(
user_id int,
user_name varchar(255),
address varchar(255),
User_level varchar(255),
User_phone int,
user_email varchar(255)
);
--
SELECT user_name,
       user_id,
       user_level
FROM   User; 
--
DELETE FROM user
WHERE  user_id = ?;
--
DELETE FROM user
WHERE  user_id = ?
ORDER BY user_id
LIMIT 2; 
--
SELECT   *
FROM     venue
ORDER BY venue_id DESC;
--
SELECT   *
FROM     venue
ORDER BY venue_id ASC ;
--
INSERT INTO venue
            (update_time,
             create_time,
             update_by,
             create_by,
             venue_id,
             check_in_code,
             email_address,
             venue_name,
             shop_address,
             is_hotspot)
VALUES      (?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?);
--
DELETE FROM user
WHERE  user_id = ?
       AND username = ?;
--
DELETE FROM User
WHERE  user_id = ?;
--
SELECT Count(DISTINCT User.user_id) AS "how many user"
FROM   User
       LEFT JOIN user__role_role UserUserRole
              ON UserUserRole.userUserId = User.user_id
       LEFT JOIN role UserRole
              ON UserRole.role_id=UserUserRole.roleRoleId

WHERE  User.user_name LIKE ?;
--
UPDATE user
SET    is_in_hotspot = ?
WHERE  user_id = ?; 
--
SELECT Count(DISTINCT venue.venue_id) AS "howmanyvenue"
FROM   venue
       LEFT JOIN user__venue_venue VenueUsersVenue
              ON VenueUsersVenue.venueVenueId = venue.venue_id
       LEFT JOIN user VenueUsers
              ON VenueUsers.user_id = VenueUsersVenue.userUserId
WHERE  venue.venue_name LIKE ? ;
--
INSERT INTO user_check_in
            (update_time,
             create_by,
             update_by,
             create_by,
             check_in_id,
             venue_id,
             checkinaddress,
             checkintimestamp,
             venuevenueid)
VALUES      (?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?) ;
--
SELECT user_check_in.update_time       AS update_time,
       user_check_in.create_time      AS create_time,
       user_check_in.check_in_id      AS check_in_id,
       user_check_in.CheckInTimeStamp AS time_stamp
FROM   user_check_in
WHERE  user_check_in.check_in_id = ?