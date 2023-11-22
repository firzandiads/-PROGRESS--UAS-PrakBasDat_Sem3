CREATE DEFINER=`root`@`localhost` FUNCTION `konversi`(nilai2 char) RETURNS double
BEGIN
	declare kon double;
	if nilai2="A" then set kon = 4.00;
    elseif nilai2="A-" then set kon = 3.67;
    elseif nilai2="B+" then set kon = 3.33;
    elseif nilai2="B" then set kon = 3.00;
    elseif nilai2="B-" then set kon = 2.67;
    elseif nilai2="C+" then set kon = 2.33;
    elseif nilai2="C" then set kon = 2.00;
    elseif nilai2="D" then set kon = 1.00;
    elseif nilai2="E" then set kon = 0.00;
    end if;
RETURN kon;
END