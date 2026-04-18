CREATE OR REPLACE VIEW vw_submission_overview AS
SELECT
    s.id AS submission_id,
    u.id AS user_id,
    u.full_name AS student_name,
    sp.ra,
    c.id AS course_id,
    c.name AS course_name,
    cat.name AS category_name,
    s.title,
    s.requested_hours,
    s.approved_hours,
    s.status,
    s.activity_date,
    s.submitted_at
FROM submissions s
JOIN user_courses uc ON uc.id = s.user_course_id
JOIN users u ON u.id = uc.user_id
LEFT JOIN student_profiles sp ON sp.user_id = u.id
JOIN courses c ON c.id = uc.course_id
JOIN categories cat ON cat.id = s.category_id;

CREATE OR REPLACE VIEW vw_student_progress AS
SELECT
    u.id AS user_id,
    u.full_name,
    sp.ra,
    c.id AS course_id,
    c.name AS course_name,
    c.minimum_required_hours,
    uc.status_matricula,
    COALESCE(SUM(s.approved_hours), 0) AS total_approved_hours,
    ROUND(
        (COALESCE(SUM(s.approved_hours), 0) / NULLIF(c.minimum_required_hours, 0)) * 100,
        2
    ) AS progress_percentage
FROM user_courses uc
JOIN users u ON u.id = uc.user_id
LEFT JOIN student_profiles sp ON sp.user_id = u.id
JOIN courses c ON c.id = uc.course_id
LEFT JOIN submissions s ON s.user_course_id = uc.id
GROUP BY u.id, u.full_name, sp.ra, c.id, c.name, c.minimum_required_hours, uc.status_matricula;
