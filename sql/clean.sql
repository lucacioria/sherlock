DROP FUNCTION IF EXISTS SPLIT_STR;
CREATE FUNCTION SPLIT_STR(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
)
RETURNS VARCHAR(255)
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');

drop table if exists transfers;

create table transfers (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `transferType` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  `errorMessage` varchar(200) NOT NULL,
  `smsConfirmationActive` BOOL NOT NULL,
  `beneficiaryIban` varchar(200) NOT NULL,
  `beneficiaryName` varchar(200) NOT NULL,
  `beneficiaryCountry` varchar(200) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `userIp` varchar(45) NOT NULL,
  `userCountry` varchar(45) NOT NULL,
  `userASN` varchar(45) NOT NULL,
  `sessionId` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

insert into transfers (
  userIp, sessionId, timestamp, transferType, amount, errorMessage, userId, beneficiaryIban, beneficiaryName, smsConfirmationActive,
  beneficiaryCountry, userCountry, userASN
) select
IP, IDSessione, Timestamp, TipoOperazione, Importo, MsgErrore, UserID, IBAN, Nominativo, IF(NumConfermaSMS = 'Si', 1, 0),
IBAN_CC, SPLIT_STR(CC_ASN, ',', 1), SPLIT_STR(CC_ASN, ',', 2)
from quiubi_bonifici;

-- create user aggregation view
DROP VIEW IF EXISTS user_analysis;
CREATE VIEW user_analysis AS
select userId, count(1) numberOfTransfers, sum(amount) totalAmount
from transfers
group by userId;

-- create empty anomalies tables
drop table if exists user_hour_anomaly;
create table user_hour_anomaly (
  userId varchar(45) NOT NULL,
  month int not null,
  anomaly float not null
)
