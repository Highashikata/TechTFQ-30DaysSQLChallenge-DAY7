DROP TABLE IF EXISTS day_indicator;

CREATE TABLE day_indicator
  (
     product_id    VARCHAR(10),
     day_indicator VARCHAR(7),
     dates         DATE
  );

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('04-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('05-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('06-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('07-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('08-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('09-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('AP755',
             '1010101',
             To_date('10-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('04-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('05-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('06-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('07-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('08-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('09-Mar-2024', 'dd-mon-yyyy'));

INSERT INTO day_indicator
VALUES      ('XQ802',
             '1000110',
             To_date('10-Mar-2024', 'dd-mon-yyyy'));

SELECT *
FROM   day_indicator; 