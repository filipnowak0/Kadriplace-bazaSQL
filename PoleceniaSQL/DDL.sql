-- 1 --
CREATE TABLE firma (
    id number primary key,
    nazwa_firmy varchar2(150) not null,
    skrot_nazwy_firmy varchar2(5) unique not null,
    miejscowosc varchar2(120) not null,
    ulica varchar(120),
    nr_budynku varchar2(20) not null,
    wojewodztwo varchar2(40) not null,
    powiat varchar2(60) not null,
    gmina varchar2(80) not null,
    kod_pocztowy varchar2(6) not null,
    kod_teryt number(7) not null,
    poczta varchar2(80) not null,
    nip number(10) unique not null,
    regon number(9) unique not null,
    urzad_skarbowy varchar2(120) not null,
    konto_us varchar2(40) not null,
    konto_zus varchar2(30) not null,
    status_prawny varchar2(80) not null
    );

-- 2 --
CREATE TABLE pracownicy (
    id number primary key,
    id_firmy number not null references firma(id),
    nr_akt varchar2(10) unique not null,
    imie varchar2(80) not null,
    imie2 varchar2(80),
    nazwisko varchar2(80) not null,
    plec varchar2(1) CHECK (plec = 'M' or plec = 'K'),
    telefon varchar2(15),
    email varchar2(80),
    data_urodzenia date not null,
    miejsce_urodzenia varchar2(80) not null,
    pesel varchar2(11) unique not null,
    nip varcahr2(10),
    imie_ojca varchar2(80) not null,
    imie_matki varchar2(80) not null,
    nazwisko_rodowe varchar2(80) not null,
    nazwisko_rodowe_m varchar2(80) not null,
    stan_cywilny varchar2(30) not null,
    kod_oddzialu_nfz number not null references oddzialy_nfz(id),
    obywatelstwo varchar2(80) default 'polskie'
    );

-- 3 --
CREATE TABLE oddzialy_nfz (
    id number primary key,
    kod_oddzialu_nfz varchar2(2) unique not null,
    nazwa_oddzialu_nfz varchar2(120) not null
    );

-- 4 --
CREATE TABLE czas_pracy (
    id number primary key,
    id_pracownika number not null references pracownicy(id),
    data_od date not null,
    data_do date
    );

-- 5 --
CREATE TABLE pracownicy_zus (
    id number primary key,
    id_pracownika number not null references pracownicy(id),
    kod_ubezpieczenia varchar2(4) not null,
    prawo_do_emerytury varchar2(1) not null,
    stopien_niepelnosprawnosci varchar2(1) not null,
    data_powstania_obowiazku_ubezpieczenia_spolecznego date,
    data_zakonczenia_obowiazku_ubezpieczenia_spolecznego date,
    data_powstania_obowiazku_ubezpieczenia_zdrowotnego date,
    data_zakonczenia_obowiazku_ubezpieczenia_zdrowotnego date,
    emerytalne varchar2(1) CHECK (emerytalne = 'T' or emerytalne = 'N'),
    rentowe varchar2(1) CHECK (rentowe = 'T' or rentowe = 'N'),
    chorobowe varchar2(1) CHECK (chorobowe = 'T' or chorobowe = 'N'),
    wypadkowe varchar2(1) CHECK (wypadkowe = 'T' or wypadkowe = 'N')
    );
    
-- 6 --
CREATE TABLE umowy_pracownicze (
    id number primary key,
    id_pracownika number not null references pracownicy(id),
    rodzaj_umowy varchar2(50) not null,
    data_umowy date not null,
    okres_umowy_od date not null,
    okres_umowy_do date,
    stawka number(9,2),
    rodzaj_stawki varchar2(40),
    stanowisko varchar2(80),
    wielkosc_etatu varchar2(4)
    );

-- 7 --
CREATE TABLE wynagrodzenia (
    id number primary key,
    id_pracownika number not null references pracownicy(id),
    data_od date,
    data_do date,
    placa_zasadnicza number(12,2),
    wynagrodzenie_chorobowe number(12,2),
    zasilek_chorobowy number(12,2),
    wynagrodzenie_urlopowe number(12,2)
    );

-- 8 --
CREATE TABLE transakcje (
    id number primary key,
    id_wynagrodzenia number not null references wynagrodzenia(id),
    data_transakcji date not null,
    kwota number(12,2) not null,
    data_rozliczenia date not null,
    sposob_platnosci varchar2(40) not null
    );

-- 9 --
CREATE TABLE dane_adresowe (
    ID number primary key,
    ID_pracownika number not null references pracownicy(id),
    Rodzaj_adresu varchar2(40) not null,
    Wojewodztwo varchar2(120),
    Powiat varchar2(120),
    Gmina varchar2(120),
    Kod_pocztowy varchar2(6) not null,
    Miejscowosc varchar2(120) not null,
    Ulica varchar2(120),
    Nr_budynku varchar2(20) not null,
    Poczta varchar2(120) not null
    );