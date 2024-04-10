SELECT player_id, device_id FROM (
SELECT *,
        -- tạo rank cho lần đầu đăng nhập của player_id theo event_date
        RANK() OVER (PARTITION by player_id order by event_date) as rank
FROM Activity
) as sub
where rank = 1 -- lấy rank = 1 để chọn được device lần đầu đăng nhập
