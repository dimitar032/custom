# Procedure
CREATE DEFINER =`root`@`localhost` PROCEDURE p_CONTEXT_NAME(
	IN  i_id BIGINT UNSIGNED,
	OUT o_id BIGINT UNSIGNED
)
BEGIN
DECLARE v_id BIGINT UNSIGNED;

DECLARE v_done INT DEFAULT FALSE;

DECLARE cursor1 CURSOR FOR
    #SELECT id FROM users
    ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;


    OPEN cursor1;
    loop1: LOOP
    FETCH cursor1
    INTO v_id;
    IF v_done
    THEN
    LEAVE loop1;
    END IF;
      #your code below..


      END LOOP loop1;
      CLOSE cursor1;
      END;


# Trigger
CREATE DEFINER =`root`@`localhost` TRIGGER t_AFTER_ACTION_TABLE
  # AFTER UPDATE
  # BEFORE INSERT
  ON TABLE__NAME
  FOR EACH ROW
  BEGIN
  DECLARE v_id BIGINT UNSIGNED;
  DECLARE v_done INT DEFAULT FALSE;

  DECLARE cursor1 CURSOR FOR
    #SELECT id FROM users
    ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;

    OPEN cursor1;
    loop1: LOOP
    FETCH cursor1
    INTO v_id;
    IF v_done = 1
    THEN
    LEAVE loop1;
    END IF;
      #your code below..


      END LOOP loop1;
      CLOSE cursor1;
      END;


# Function
CREATE DEFINER =`root`@`localhost` FUNCTION f_WHAT_FUNCTION_DOES(
	IN  i_id BIGINT UNSIGNED,
	OUT o_id BIGINT UNSIGNED
)
RETURNS BIGINT(10) UNSIGNED
BEGIN
DECLARE v_id BIGINT UNSIGNED;

RETURN v_id;

END;
