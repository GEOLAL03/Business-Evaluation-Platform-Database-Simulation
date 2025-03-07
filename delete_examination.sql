SET SQL_SAFE_UPDATES = 0;

DROP PROCEDURE IF EXISTS delete_completed_examinations;
DELIMITER //
CREATE PROCEDURE delete_completed_examinations()
BEGIN
DELETE FROM examination WHERE ait_id IN (SELECT id FROM applies WHERE aitisi = 'olokliromeni');
DELETE FROM automatic_examination WHERE ait_id IN (SELECT id FROM applies WHERE aitisi = 'olokliromeni');
END //
CALL delete_completed_examinations();
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM examination INNER JOIN applies on examination.ait_id=applies.id where examination.ait_id=applies.id;