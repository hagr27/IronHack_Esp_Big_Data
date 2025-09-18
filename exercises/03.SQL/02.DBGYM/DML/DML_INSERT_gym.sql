-- ==============================
-- INSERT Comercio: Modelo en PostgreSQL
-- ==============================

/*
1. Se crean 2 membresia, 2 clientes, 2 tiendas.
2. Se cargan 2 tipos de empleado, y 2 empleados.
3. Se registran 3 productos con precios y stocks iniciales.
4. Se hacen movimientos de inventario, una compra y una venta con detalle.
*/

-- ==============================
-- gym.membresia
-- ==============================
INSERT INTO gym.membresia (id, nombre, precio, fecha_registro)
VALUES 
(1, 'BASIC', 19.99, NOW()),
(2, 'PREMIUM', 29.99, NOW()),
(3, 'PLUS', 39.99, NOW());


-- ==============================
-- gym.Clientes
-- ==============================
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Worthy', 'Shorrock', 'wshorrock0@163.com', '2752286666', '2025-04-11 04:34:21');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Barr', 'Francesconi', 'bfrancesconi1@google.de', '9845749244', '2024-10-31 17:18:41');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Missie', 'Schneidar', 'mschneidar2@weather.com', '7305028753', '2024-12-04 19:43:49');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Lida', 'Beedham', 'lbeedham3@zimbio.com', '8637088352', '2025-02-16 14:15:42');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Brita', 'Antonellini', 'bantonellini4@topsy.com', '3586464958', '2024-12-01 07:09:13');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Reeva', 'Dowderswell', 'rdowderswell5@163.com', '8872552549', '2025-02-16 05:45:00');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Jedediah', 'Fraczek', 'jfraczek6@mtv.com', '4988691093', '2024-10-21 19:59:06');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Antin', 'Pettifer', 'apettifer7@bigcartel.com', '3301042216', '2025-07-01 06:04:16');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Benjy', 'Lamb-shine', 'blambshine8@reference.com', '7195401302', '2024-12-05 15:40:16');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Aube', 'Atkyns', 'aatkyns9@howstuffworks.com', '6759947654', '2024-12-08 10:05:56');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Chicky', 'Blount', 'cblounta@census.gov', '2754089813', '2025-03-09 02:29:17');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Somerset', 'McCloch', 'smcclochb@mail.ru', '8174764572', '2024-12-23 15:43:02');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Janot', 'Saiens', 'jsaiensc@e-recht24.de', '6497645477', '2024-11-13 18:29:40');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Read', 'Fardell', 'rfardelld@technorati.com', '1132887133', '2024-12-18 17:59:25');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Jolee', 'Stell', 'jstelle@alibaba.com', '6979732909', '2024-10-10 19:11:14');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Delora', 'Cockayme', 'dcockaymef@dell.com', '5314062425', '2025-04-21 02:49:26');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Alphard', 'Melmoth', 'amelmothg@hostgator.com', '3893673337', '2024-11-26 00:50:42');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Normand', 'Bayfield', 'nbayfieldh@nih.gov', '5078982315', '2025-01-31 06:52:24');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Benn', 'Sutherby', 'bsutherbyi@diigo.com', '5572891509', '2024-10-06 12:57:47');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Peg', 'Littlewood', 'plittlewoodj@mac.com', '9751175079', '2025-08-20 20:11:23');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Lydia', 'Padfield', 'lpadfieldk@issuu.com', '3719939406', '2025-06-03 18:05:54');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Rasla', 'Crocetto', 'rcrocettol@nasa.gov', '1925170168', '2024-11-16 19:45:42');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Terza', 'Howatt', 'thowattm@stanford.edu', '6419299970', '2025-05-28 04:58:41');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Ebenezer', 'Bain', 'ebainn@go.com', '2271749133', '2025-01-19 09:43:27');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Farrand', 'Ingles', 'fingleso@hubpages.com', '9502235386', '2025-07-20 05:06:29');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Yuri', 'Frankiss', 'yfrankissp@blogger.com', '2397952637', '2024-10-22 18:53:41');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Audy', 'Masedon', 'amasedonq@eepurl.com', '5561245700', '2025-05-16 22:10:48');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Igor', 'Vedeneev', 'ivedeneevr@abc.net.au', '4162289253', '2024-11-25 01:14:01');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Conni', 'Birwhistle', 'cbirwhistles@pcworld.com', '9671768790', '2025-02-12 22:36:20');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Marta', 'Rawlence', 'mrawlencet@geocities.com', '6148037067', '2025-05-23 14:54:01');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Phil', 'Grahlmans', 'pgrahlmansu@virginia.edu', '6183969244', '2025-04-04 02:26:02');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Belinda', 'Southernwood', 'bsouthernwoodv@163.com', '5621588238', '2025-05-02 17:26:46');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Hazlett', 'Caen', 'hcaenw@goo.gl', '1408561828', '2024-10-17 09:14:23');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Domenic', 'Balducci', 'dbalduccix@sbwire.com', '2572779041', '2025-05-08 14:40:32');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Etienne', 'Spier', 'espiery@sun.com', '3654229122', '2025-07-13 12:44:53');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Shara', 'Suero', 'ssueroz@list-manage.com', '7826420082', '2025-05-29 20:25:02');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Danila', 'Millership', 'dmillership10@wiley.com', '9437395805', '2025-04-20 20:24:14');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Trip', 'Templar', 'ttemplar11@skype.com', '8106912163', '2024-12-17 03:49:19');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Spencer', 'Yole', 'syole12@independent.co.uk', '4331786637', '2025-01-21 20:22:18');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Darice', 'Rymell', 'drymell13@dell.com', '1481136110', '2024-11-30 10:49:46');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Denyse', 'Magnar', 'dmagnar14@toplist.cz', '3905021232', '2025-09-14 01:27:51');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Gabrila', 'Guillford', 'gguillford15@pen.io', '7469039096', '2025-01-04 14:37:30');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Davida', 'Lethbridge', 'dlethbridge16@china.com.cn', '8718860566', '2024-10-23 01:08:35');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Dyan', 'Shemmin', 'dshemmin17@google.es', '5448064121', '2024-11-20 07:15:19');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Belle', 'Olivari', 'bolivari18@oaic.gov.au', '2395702036', '2024-10-21 18:36:53');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Hussein', 'Brailey', 'hbrailey19@unesco.org', '4025296689', '2025-07-18 03:18:23');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Bartel', 'Isselee', 'bisselee1a@bloomberg.com', '1493085155', '2025-03-18 19:04:55');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Gideon', 'Hatchette', 'ghatchette1b@nbcnews.com', '7522236653', '2025-08-15 04:55:41');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Drew', 'Kinnier', 'dkinnier1c@creativecommons.org', '8943745550', '2025-08-21 09:03:16');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Dorian', 'Puig', 'dpuig1d@de.vu', '5119243659', '2025-08-07 17:51:55');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Adelle', 'Lorenzetti', 'alorenzetti1e@admin.ch', '2702445453', '2025-01-26 18:02:50');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Wit', 'Durand', 'wdurand1f@parallels.com', '8613670282', '2024-11-12 20:14:25');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Emory', 'Jervis', 'ejervis1g@arstechnica.com', '2079609535', '2025-03-25 15:52:07');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Trever', 'Collidge', 'tcollidge1h@boston.com', '8782480556', '2025-06-03 18:02:45');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Rebe', 'Breache', 'rbreache1i@house.gov', '4156821879', '2024-11-19 10:21:58');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Lucinda', 'Dealey', 'ldealey1j@quantcast.com', '3203657457', '2025-07-16 19:36:11');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Shannan', 'Ingerfield', 'singerfield1k@1und1.de', '7564274088', '2025-03-10 23:25:49');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Rozella', 'Lowing', 'rlowing1l@opera.com', '7921741225', '2024-11-25 05:00:02');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Alexine', 'Kidds', 'akidds1m@fc2.com', '6896002153', '2025-04-23 09:50:53');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Nickie', 'Borland', 'nborland1n@rediff.com', '9111314172', '2025-05-20 04:22:07');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Brnaby', 'Cranstone', 'bcranstone1o@globo.com', '7036579789', '2025-06-09 14:01:41');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Sarita', 'McSorley', 'smcsorley1p@indiegogo.com', '8029692723', '2025-03-19 20:31:18');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Pasquale', 'Maher', 'pmaher1q@hud.gov', '5395689221', '2025-07-10 02:47:37');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Alix', 'Hammor', 'ahammor1r@youtube.com', '9678697992', '2025-06-26 13:32:13');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Zilvia', 'Ainslee', 'zainslee1s@ning.com', '1719300390', '2024-10-23 04:06:57');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Rance', 'Crowne', 'rcrowne1t@wordpress.org', '1231047003', '2025-01-21 01:44:58');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Lotta', 'Georgi', 'lgeorgi1u@ed.gov', '1609856288', '2025-02-02 02:39:01');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Fredra', 'Dacre', 'fdacre1v@wordpress.com', '5017481906', '2024-12-11 22:08:02');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Leelah', 'Highway', 'lhighway1w@godaddy.com', '3754683634', '2025-04-25 11:11:11');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Gothart', 'Haglinton', 'ghaglinton1x@oracle.com', '6387680484', '2025-07-07 08:43:44');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Shanan', 'Ockwell', 'sockwell1y@tinypic.com', '1032572245', '2025-04-21 02:56:30');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Carlin', 'Rosnau', 'crosnau1z@hc360.com', '3789981625', '2024-11-30 07:16:21');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Danny', 'Pfeiffer', 'dpfeiffer20@vimeo.com', '7075367687', '2025-03-25 17:58:19');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Stepha', 'Pirdy', 'spirdy21@booking.com', '4868798734', '2025-05-06 15:03:20');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Edi', 'Brewood', 'ebrewood22@yellowpages.com', '1796529640', '2024-11-28 01:04:57');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Drusie', 'McGettrick', 'dmcgettrick23@etsy.com', '8666986097', '2024-12-02 08:35:30');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Ann-marie', 'Hexter', 'ahexter24@nature.com', '4738284258', '2024-11-04 23:38:03');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Corby', 'Rabbet', 'crabbet25@state.tx.us', '9412011237', '2025-07-17 03:59:39');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Ethel', 'Lathleiff', 'elathleiff26@pagesperso-orange.fr', '8589116811', '2025-07-01 13:24:17');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Andy', 'Woolhouse', 'awoolhouse27@wordpress.com', '1893985239', '2025-04-20 00:21:22');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Charlena', 'Perigoe', 'cperigoe28@sciencedirect.com', '2324980062', '2025-02-25 08:21:23');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Lou', 'Hein', 'lhein29@livejournal.com', '3933695625', '2025-03-07 06:49:40');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Joaquin', 'Casel', 'jcasel2a@multiply.com', '6823846225', '2024-09-27 22:30:42');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Chaddy', 'Sangwine', 'csangwine2b@aboutads.info', '6811644975', '2025-04-24 06:13:49');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Merissa', 'Woodcraft', 'mwoodcraft2c@youku.com', '9936086580', '2025-05-27 05:49:09');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Stacia', 'Hanssmann', 'shanssmann2d@timesonline.co.uk', '5731369487', '2025-03-24 01:58:33');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Taryn', 'Stroobant', 'tstroobant2e@ucla.edu', '1306646697', '2024-11-10 06:50:32');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (1, 'Orsola', 'Gerry', 'ogerry2f@hibu.com', '7748336024', '2024-11-22 02:47:09');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Federico', 'Hounsom', 'fhounsom2g@acquirethisname.com', '3284059772', '2025-03-25 14:31:44');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Elene', 'Cracknall', 'ecracknall2h@reuters.com', '5125081073', '2025-06-03 19:15:59');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Carita', 'Glazebrook', 'cglazebrook2i@examiner.com', '9481815887', '2024-10-31 18:02:02');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Calli', 'Rainford', 'crainford2j@newsvine.com', '5918590472', '2025-08-18 11:43:14');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Zorah', 'Metterick', 'zmetterick2k@statcounter.com', '2747695556', '2025-04-30 00:14:08');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Frances', 'Dumbleton', 'fdumbleton2l@comcast.net', '8987269400', '2025-08-29 19:14:53');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Mick', 'Matschoss', 'mmatschoss2m@businessinsider.com', '3406084858', '2025-08-09 06:40:27');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Michele', 'Jonin', 'mjonin2n@house.gov', '5884016766', '2025-07-08 14:10:21');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Ingrid', 'Narbett', 'inarbett2o@domainmarket.com', '3228266399', '2025-03-11 11:05:22');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Jessee', 'Birdsall', 'jbirdsall2p@dailymotion.com', '1862318321', '2024-11-09 04:51:35');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (3, 'Chick', 'Ferrillio', 'cferrillio2q@wisc.edu', '8237374328', '2025-08-26 16:24:50');
insert into gym.cliente (membresia_id, nombre, apellido, email, telefono, fecha_registro) values (2, 'Brandice', 'Cattini', 'bcattini2r@stanford.edu', '1738205765', '2024-10-27 06:26:39');


-- ==============================
-- gym.entrenador
-- ==============================
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Rodney', 'Sargeaunt', 'rsargeaunt0@etsy.com', '5518957589', '2025-05-29 22:12:29');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Lorie', 'Dossetter', 'ldossetter1@ibm.com', '8299404388', '2025-01-10 04:01:47');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Reagan', 'Packwood', 'rpackwood2@imdb.com', '2627092425', '2024-11-25 20:30:17');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Claudine', 'Murford', 'cmurford3@google.com.hk', '9198668071', '2025-03-07 01:22:45');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Tan', 'Kember', 'tkember4@posterous.com', '2153871110', '2024-12-29 13:43:13');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Gifford', 'Kellen', 'gkellen5@aol.com', '8568135120', '2025-03-27 18:01:51');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Ofella', 'Aizikowitz', 'oaizikowitz6@time.com', '4018374845', '2025-01-12 21:03:37');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Kerianne', 'Gallagher', 'kgallagher7@squidoo.com', '4673275513', '2025-04-23 14:00:01');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Rollin', 'Kelsall', 'rkelsall8@springer.com', '1881353998', '2025-03-29 06:52:31');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Ariela', 'Brellin', 'abrellin9@tumblr.com', '6485011293', '2024-11-04 08:26:11');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Henrie', 'Beecham', 'hbeechama@hc360.com', '5105108151', '2025-07-15 18:29:36');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Addia', 'Halbord', 'ahalbordb@wufoo.com', '7438674351', '2025-08-05 01:05:33');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Nichol', 'Sconce', 'nsconcec@yale.edu', '8913363427', '2025-09-04 09:43:14');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Marcella', 'Masse', 'mmassed@jigsy.com', '9287210961', '2025-06-30 11:21:54');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Julee', 'Raun', 'jraune@tiny.cc', '5819523102', '2024-10-26 18:59:17');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Gayel', 'Lowdes', 'glowdesf@ifeng.com', '7059110430', '2025-06-08 21:55:36');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Heddi', 'Durgan', 'hdurgang@wikia.com', '6781304010', '2025-05-10 04:18:00');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Ruthann', 'Melvin', 'rmelvinh@wikimedia.org', '8081954559', '2024-11-05 17:14:31');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Nertie', 'Eastes', 'neastesi@webnode.com', '4315547997', '2024-09-26 15:05:12');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Filberte', 'Austen', 'faustenj@wp.com', '2081527691', '2024-09-24 09:22:08');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Virgie', 'Vanyukov', 'vvanyukovk@weebly.com', '8037237309', '2025-06-18 18:22:21');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Patric', 'Marriot', 'pmarriotl@deviantart.com', '3718569457', '2024-11-24 17:02:08');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Kessia', 'Sidebottom', 'ksidebottomm@sun.com', '4855804448', '2025-01-05 00:38:43');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Kalindi', 'Drought', 'kdroughtn@deviantart.com', '2853951366', '2025-02-21 03:20:18');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Elsie', 'Hanwell', 'ehanwello@newsvine.com', '6951652506', '2025-09-08 06:56:35');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Leonerd', 'Sparkwill', 'lsparkwillp@sbwire.com', '9262292865', '2024-09-28 09:23:22');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Alano', 'Braniff', 'abraniffq@purevolume.com', '6299606315', '2025-08-18 12:31:57');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Drusilla', 'Bomb', 'dbombr@goodreads.com', '1662861437', '2025-02-28 16:55:53');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Josias', 'Chaucer', 'jchaucers@smugmug.com', '8885402632', '2025-04-19 07:19:59');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Marge', 'Millson', 'mmillsont@hubpages.com', '8961960169', '2025-09-06 11:07:31');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Noellyn', 'Swaddle', 'nswaddleu@answers.com', '5013285420', '2025-04-15 19:11:56');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Isadore', 'Fogt', 'ifogtv@mozilla.org', '3603573781', '2025-02-14 06:15:03');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Augusta', 'Dashkov', 'adashkovw@examiner.com', '1823402700', '2025-02-15 04:41:15');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Leese', 'Sturror', 'lsturrorx@blogtalkradio.com', '3806010541', '2025-01-25 10:38:30');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Mohammed', 'Glencross', 'mglencrossy@rambler.ru', '3958743675', '2025-08-24 04:31:31');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Mariellen', 'Marklund', 'mmarklundz@issuu.com', '1704592635', '2025-04-06 18:02:29');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Emmanuel', 'Surgison', 'esurgison10@furl.net', '3564339004', '2025-02-21 09:51:07');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Myrilla', 'Egiloff', 'megiloff11@umich.edu', '8992489290', '2025-03-11 05:29:07');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Evanne', 'Leverette', 'eleverette12@sfgate.com', '6555469896', '2025-03-25 12:16:03');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Faber', 'Gerber', 'fgerber13@bloomberg.com', '5805034144', '2024-10-09 23:33:28');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Ax', 'Learmonth', 'alearmonth14@wp.com', '5333265013', '2025-01-27 14:27:53');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Bradley', 'MacBain', 'bmacbain15@nba.com', '5986570864', '2025-08-18 17:04:37');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Falkner', 'Brik', 'fbrik16@unicef.org', '2326039948', '2024-11-14 14:01:38');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Osmund', 'Gotcliff', 'ogotcliff17@utexas.edu', '5437297205', '2025-03-02 00:04:05');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Wes', 'Stevens', 'wstevens18@goo.ne.jp', '7809741278', '2025-02-28 20:54:24');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Philipa', 'Scholes', 'pscholes19@imageshack.us', '6702388788', '2025-06-23 01:51:20');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Gustaf', 'Fri', 'gfri1a@ft.com', '1057296139', '2025-09-08 07:11:36');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Sutherland', 'Laflin', 'slaflin1b@youtu.be', '7271364557', '2024-11-23 07:49:06');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Phelia', 'Ruffles', 'pruffles1c@miibeian.gov.cn', '3891726922', '2024-11-03 22:21:18');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Hersch', 'McGuire', 'hmcguire1d@tripadvisor.com', '4335350790', '2025-03-08 00:42:53');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Mari', 'Thirwell', 'mthirwell1e@ft.com', '8736340170', '2025-05-16 02:24:06');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Karlyn', 'Locks', 'klocks1f@kickstarter.com', '2581527956', '2024-10-05 06:33:58');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Lilyan', 'Kingsmill', 'lkingsmill1g@bloomberg.com', '2028287902', '2024-11-03 06:13:04');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Veronike', 'Standall', 'vstandall1h@globo.com', '3292045171', '2024-12-27 17:21:47');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Karissa', 'Bisseker', 'kbisseker1i@comsenz.com', '1242949635', '2025-05-02 03:25:37');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Jacklyn', 'Blakeney', 'jblakeney1j@pen.io', '3127805163', '2025-07-22 21:55:05');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Damiano', 'Sibbson', 'dsibbson1k@surveymonkey.com', '1771057841', '2024-11-18 02:29:12');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Yoshiko', 'Hayer', 'yhayer1l@vkontakte.ru', '3818820415', '2025-01-08 14:24:05');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Dorita', 'Gage', 'dgage1m@fda.gov', '7187764865', '2024-12-25 23:46:06');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Glenn', 'Bullimore', 'gbullimore1n@a8.net', '1293162748', '2024-12-03 00:37:19');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Adair', 'Avann', 'aavann1o@nydailynews.com', '7493216662', '2025-04-18 20:42:48');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Fae', 'Kydde', 'fkydde1p@meetup.com', '7953491881', '2024-11-28 07:03:03');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Ev', 'Ellingworth', 'eellingworth1q@ning.com', '3772409248', '2025-06-11 22:11:22');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Norrie', 'Clutheram', 'nclutheram1r@ihg.com', '4733410485', '2025-04-05 19:33:28');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Mella', 'Martill', 'mmartill1s@google.es', '9087467616', '2025-05-12 07:32:56');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Berke', 'Lardge', 'blardge1t@rambler.ru', '1394045300', '2025-03-07 01:50:52');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Roderic', 'Wickendon', 'rwickendon1u@un.org', '6401817570', '2024-11-18 09:49:55');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Luella', 'Bosquet', 'lbosquet1v@foxnews.com', '2248672930', '2025-07-16 09:38:11');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Bart', 'Brookz', 'bbrookz1w@virginia.edu', '4561875943', '2025-06-10 23:33:49');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Ingrim', 'Stanners', 'istanners1x@ycombinator.com', '6258407028', '2025-09-14 15:32:12');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Gusta', 'Goneau', 'ggoneau1y@feedburner.com', '8587956122', '2024-10-31 10:58:53');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Garrott', 'Buzek', 'gbuzek1z@smugmug.com', '9926014347', '2025-01-25 18:10:45');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Lian', 'Perelli', 'lperelli20@ning.com', '9483473599', '2024-11-02 05:47:43');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Wendie', 'Bonsale', 'wbonsale21@businesswire.com', '2037594668', '2025-02-21 05:20:25');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Andrea', 'Ruske', 'aruske22@mozilla.org', '4275030465', '2025-09-01 09:01:33');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Holt', 'Tobin', 'htobin23@washington.edu', '2901195870', '2025-04-22 08:51:23');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Waneta', 'Syalvester', 'wsyalvester24@alibaba.com', '9252271358', '2025-06-14 04:50:35');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Yale', 'Sorrill', 'ysorrill25@moonfruit.com', '4504077950', '2024-12-13 21:40:55');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Rikki', 'Neachell', 'rneachell26@prweb.com', '4728477637', '2025-04-26 11:44:56');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Rianon', 'Dmytryk', 'rdmytryk27@hibu.com', '1679334625', '2024-11-29 19:44:48');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Eugenius', 'Gilkes', 'egilkes28@kickstarter.com', '3511292709', '2025-01-19 06:40:30');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Biddy', 'Coupman', 'bcoupman29@cisco.com', '6642409913', '2025-03-28 07:07:04');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Grove', 'Paoloni', 'gpaoloni2a@w3.org', '8601744153', '2025-02-07 00:40:55');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Bailey', 'Bleasby', 'bbleasby2b@miibeian.gov.cn', '2649537054', '2024-11-16 09:08:20');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Susette', 'Svanetti', 'ssvanetti2c@java.com', '3061757072', '2024-11-07 13:09:37');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Raeann', 'Umbers', 'rumbers2d@shutterfly.com', '6894037114', '2025-03-22 22:13:12');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Leodora', 'Longhi', 'llonghi2e@livejournal.com', '8694384524', '2025-05-14 11:58:15');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Jermaine', 'Dincke', 'jdincke2f@blogger.com', '1032773485', '2025-02-05 15:50:47');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Michele', 'Dubbin', 'mdubbin2g@techcrunch.com', '6609084304', '2025-04-20 06:11:03');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Tally', 'Gentiry', 'tgentiry2h@noaa.gov', '8731224684', '2025-03-02 03:51:00');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Gray', 'Flawn', 'gflawn2i@ning.com', '1989026251', '2024-10-15 05:43:18');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Anastasia', 'Bramstom', 'abramstom2j@mysql.com', '5349322286', '2025-06-14 08:07:47');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Henrik', 'Wilkin', 'hwilkin2k@nasa.gov', '4676502631', '2025-07-06 00:08:49');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Rubi', 'Allwood', 'rallwood2l@edublogs.org', '2083146889', '2025-06-18 20:28:14');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Bernadine', 'Haddock', 'bhaddock2m@51.la', '3799059912', '2024-12-09 07:14:31');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Lezley', 'McGinnell', 'lmcginnell2n@cnn.com', '9199340890', '2025-05-28 19:50:01');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Kermie', 'Gutherson', 'kgutherson2o@artisteer.com', '6736958846', '2024-10-20 19:17:35');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Diane', 'Dodamead', 'ddodamead2p@army.mil', '1179814841', '2025-01-24 07:12:02');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Catarina', 'Tilliard', 'ctilliard2q@tinypic.com', '2363824857', '2024-09-24 10:40:08');
insert into gym.entrenador (nombre, apellido, email, telefono, fecha_registro) values ('Meredeth', 'Sandilands', 'msandilands2r@dagondesign.com', '6667784955', '2024-12-03 00:06:48');

-- ==============================
-- gym.sala
-- ==============================
insert into gym.sala (nombre, apellido, email, telefono, fecha_registro) values ('Meredeth', 'Sandilands', 'msandilands2r@dagondesign.com', '6667784955', '2024-12-03 00:06:48');



