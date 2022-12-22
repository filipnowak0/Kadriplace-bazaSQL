-- 1 --
ALTER TABLE EWIDENCJACZASUPRACY 
ADD CONSTRAINT FK_EWCASPRAC_PRACOWNICY FOREIGN KEY (IDPRACOWNIKA)
REFERENCES PRACOWNICY(IDPRACOWNIKA);

-- 2 --
ALTER TABLE PRACOWNICY
ADD CONSTRAINT FK_PRAC_FIRMY FOREIGN KEY (IDFIRMY)
REFERENCES FIRMA(ID);

-- 3 --
ALTER TABLE PRACOWNICY
ADD CONSTRAINT FK_PRAC_PLEC FOREIGN KEY (PLEC)
REFERENCES PLEC(IDPLEC);

-- 4 --
ALTER TABLE PRACOWNICY
ADD CONSTRAINT FK_PRAC_NFZ FOREIGN KEY (KODODDZIALYNFZ)
REFERENCES ODDZIALYNFZ (IDNFZ);

-- 5 --
ALTER TABLE PRACOWNICYZUS
ADD CONSTRAINT FK_PRACZUS_PRACOWNICY FOREIGN KEY (IDPRACOWNIKA)
REFERENCES PRACOWNICY(IDPRACOWNIKA);

-- 6 --
ALTER TABLE TRANSAKCJE
ADD CONSTRAINT FK_TRAN_WYNAGRODZENIA FOREIGN KEY (IDWYNAGRODZENIA)
REFERENCES WYNAGRODZENIA(IDWYNAGRODZENIA);

-- 7 --
ALTER TABLE UMOWYPRACOWNICZE
ADD CONSTRAINT FK_UMPRAC_PRACOWNICY FOREIGN KEY (IDPRACOWNIKA)
REFERENCES PRACOWNICY(IDPRACOWNIKA);

-- 8 --
ALTER TABLE WYNAGRODZENIA
ADD CONSTRAINT FK_WYNAG_PRACOWNICY FOREIGN KEY (IDPRACOWNIKA)
REFERENCES PRACOWNICY(IDPRACOWNIKA);