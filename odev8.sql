-- 1. ADIM: TABLO OLUŞTURMA
-- ============================================================
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    id       INTEGER PRIMARY KEY,
    name     VARCHAR(50),
    birthday DATE,
    email    VARCHAR(100)
);


-- 2. ADIM: MOCKAROO İLE 50 ADET VERİ EKLEME
-- ============================================================
INSERT INTO employee (id, name, birthday, email) VALUES
(1,  'Aarika',     '1985-03-12', 'aarika0@harvard.edu'),
(2,  'Bartholomew','1990-07-23', 'bgill1@google.com'),
(3,  'Caterina',   '1978-11-05', 'cmartinez2@bbc.co.uk'),
(4,  'Donalt',     '1995-02-18', 'dwilson3@github.io'),
(5,  'Elinore',    '1982-09-30', 'ebrown4@yahoo.com'),
(6,  'Faulkner',   '1988-04-14', 'fjones5@nasa.gov'),
(7,  'Gracia',     '1992-12-01', 'gtaylor6@apple.com'),
(8,  'Hewet',      '1975-06-22', 'hdavis7@microsoft.com'),
(9,  'Ileana',     '1998-01-09', 'imoore8@adobe.com'),
(10, 'Jakie',      '1980-08-17', 'jclark9@oracle.com'),
(11, 'Kalina',     '1986-05-26', 'klewis10@ibm.com'),
(12, 'Loralyn',    '1993-10-03', 'lwalker11@amazon.com'),
(13, 'Maddie',     '1979-03-15', 'mhall12@spotify.com'),
(14, 'Nicolea',    '1991-07-08', 'nallen13@netflix.com'),
(15, 'Onfre',      '1984-11-29', 'oyoung14@tesla.com'),
(16, 'Padraig',    '1996-02-04', 'pking15@uber.com'),
(17, 'Quintina',   '1981-09-19', 'qwright16@airbnb.com'),
(18, 'Rorke',      '1987-04-27', 'rscott17@stripe.com'),
(19, 'Selina',     '1994-12-13', 'sgreen18@slack.com'),
(20, 'Tomasine',   '1976-06-06', 'tadams19@dropbox.com'),
(21, 'Ursola',     '1989-01-24', 'ubaker20@twitter.com'),
(22, 'Vivien',     '1997-08-11', 'vnelson21@reddit.com'),
(23, 'Waldon',     '1983-05-20', 'wcarter22@linkedin.com'),
(24, 'Xerxes',     '1990-10-07', 'xmitchell23@pinterest.com'),
(25, 'Yelena',     '1977-03-31', 'yperez24@tiktok.com'),
(26, 'Zarah',      '1985-12-25', 'zroberts25@snapchat.com'),
(27, 'Adelina',    '1992-07-14', 'aphillips26@discord.com'),
(28, 'Bram',       '1980-02-28', 'bcampbell27@github.com'),
(29, 'Cyrus',      '1995-09-09', 'cparker28@gitlab.com'),
(30, 'Demetria',   '1978-04-16', 'devans29@bitbucket.org'),
(31, 'Eddy',       '1988-11-02', 'eedwards30@atlassian.com'),
(32, 'Fanchon',    '1991-06-19', 'fcollins31@notion.so'),
(33, 'Gerome',     '1974-01-08', 'gstewart32@figma.com'),
(34, 'Hyacinth',   '1986-08-23', 'hsanchez33@canva.com'),
(35, 'Ingaberg',   '1993-03-05', 'imorris34@trello.com'),
(36, 'Joellyn',    '1982-10-30', 'jrogers35@asana.com'),
(37, 'Karon',      '1999-05-12', 'kreed36@monday.com'),
(38, 'Lloyd',      '1987-12-21', 'lcook37@zoom.us'),
(39, 'Margaretta', '1976-07-04', 'mbailey38@webex.com'),
(40, 'Nevsa',      '1994-02-17', 'nrivera39@meet.com'),
(41, 'Orion',      '1981-09-26', 'ocooper40@teams.com'),
(42, 'Pernell',    '1989-04-10', 'prichardson41@skype.com'),
(43, 'Querida',    '1996-11-18', 'qcox42@viber.com'),
(44, 'Ramsey',     '1979-06-25', 'rward43@whatsapp.com'),
(45, 'Sianna',     '1985-01-13', 'storres44@telegram.org'),
(46, 'Tabbie',     '1992-08-06', 'tpeterson45@signal.org'),
(47, 'Ulrick',     '1977-03-22', 'ugray46@kakao.com'),
(48, 'Vinita',     '1990-10-29', 'vramirez47@line.me'),
(49, 'Wilburt',    '1983-05-15', 'wjames48@wechat.com'),
(50, 'Xena',       '1998-12-08', 'xwatson49@protonmail.com');

-- Kontrol: 50 kayıt eklendi mi?
SELECT COUNT(*) AS toplam_kayit FROM employee;


-- 3. ADIM: 5 ADET UPDATE İŞLEMİ (her sütuna göre)
UPDATE employee
SET name = 'Ahmet Yılmaz'
WHERE id = 1
RETURNING *;

UPDATE employee
SET email = 'bartholomew.new@anthropic.com'
WHERE name = 'Bartholomew'
RETURNING *;

UPDATE employee
SET name = name || ' (Senior)'
WHERE birthday < DATE '1980-01-01'
RETURNING *;

UPDATE employee
SET birthday = DATE '2000-01-01'
WHERE email LIKE '%@harvard.edu'
RETURNING *;

UPDATE employee
SET email = REPLACE(email, '@', '_senior@')
WHERE EXTRACT(YEAR FROM AGE(birthday)) > 40
RETURNING *;


-- 4. ADIM: 5 ADET DELETE İŞLEMİ (her sütuna göre)

DELETE FROM employee
WHERE id = 50
RETURNING *;

DELETE FROM employee
WHERE name = 'Hewet (Senior)'
RETURNING *;

DELETE FROM employee
WHERE birthday > DATE '1995-12-31'
RETURNING *;

DELETE FROM employee
WHERE email LIKE '%.gov%'
RETURNING *;

DELETE FROM employee
WHERE id BETWEEN 40 AND 45
RETURNING *;

--Son durumu görüntüle
SELECT * FROM employee ORDER BY id;
SELECT COUNT(*) AS kalan_kayit_sayisi FROM employee;