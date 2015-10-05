DROP DATABASE IF EXISTS desigio;
CREATE DATABASE desigio;
GRANT ALL PRIVILEGES ON desigio.* to 'jevis'@'%';
CREATE TABLE desigio.Value (
  NamedItem_ID INT,
  RecTime DATETIME,
  Value FLOAT,
  PRIMARY KEY (NamedItem_ID,RecTime)
);
INSERT INTO desigio.Value
  (NamedItem_ID, RecTime, Value)
VALUES
  (1, '2015-09-29 15:00:00', 1.1),
  (2, '2015-09-29 15:00:00', 1.2),
  (3, '2015-09-29 15:00:00', 1.3),
  (1, '2015-09-29 15:15:00', 2.1),
  (2, '2015-09-29 15:15:00', 2.2),
  (3, '2015-09-29 15:15:00', 2.3);

