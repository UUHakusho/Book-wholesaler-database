/*Category table*/
INSERT INTO Category VALUES ('6', 'Comic', 'Fiction');
INSERT INTO Category VALUES ('14', 'Sports', 'Non-fiction');
INSERT INTO Category VALUES ('27', 'Lifestyle', 'Non-fiction');

/*SalesRep table*/
INSERT INTO SalesRep VALUES ('122', 'Joe');
INSERT INTO SalesRep VALUES ('543', 'Nikki');
INSERT INTO SalesRep VALUES ('810', 'Keisha');

/*Shop table*/
INSERT INTO Shop VALUES ('1112', 'BookLand');
INSERT INTO Shop VALUES ('1655', 'PersonaBooks');
INSERT INTO Shop VALUES ('2000', 'BooksRUs');

/*Publisher table*/
INSERT INTO Publisher VALUES ('2100', 'Feather');
INSERT INTO Publisher VALUES ('2332', 'BPros');
INSERT INTO Publisher VALUES ('2850', 'SOS');

/*Book table*/
INSERT INTO Book VALUES ('3032', 'Russell Westbrook: Champion', '8.00', '14', '2332');
INSERT INTO Book VALUES ('3414', 'Samurai Black', '7.00', '6', '2850');
INSERT INTO Book VALUES ('3600', 'How to be happy', '6.00', '27', '2100');

/*ShopOrder table*/
INSERT INTO ShopOrder VALUES ('4235', '2019-04-29', '1112', '122');
INSERT INTO ShopOrder VALUES ('4766', '2019-05-05', '2000', '810');
INSERT INTO ShopOrder VALUES ('4909', '2019-05-01', '1655', '543');
INSERT INTO ShopOrder VALUES ('4500', '2019-06-15', '1112', '122'); /*Inserted another shoporder for Russell Westbrook: Champion, to test more than 1 shoporder*/

/*Orderline*/
INSERT INTO Orderline VALUES ('4235', '3032', '50', '7.00');
INSERT INTO Orderline VALUES ('4766', '3414', '80', '7.00');
INSERT INTO Orderline VALUES ('4909', '3600', '30', '5.00');
INSERT INTO Orderline VALUES ('4500', '3032', '40', '7.00'); 