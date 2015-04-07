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
  `month` char(7) NOT NULL,
  `hour` int(2) NOT NULL,
  `transfer_type` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  `error_message` varchar(200) NOT NULL,
  `sms_confirmation_active` BOOL NOT NULL,
  `beneficiary_iban` varchar(200) NOT NULL,
  `beneficiary_name` varchar(200) NOT NULL,
  `beneficiary_country` varchar(200) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `user_ip` varchar(45) NOT NULL,
  `user_country` varchar(45) NOT NULL,
  `user_asn` varchar(45) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

insert into transfers (
  user_ip, session_id, timestamp, month, hour, transfer_type, amount, error_message, user_id, beneficiary_iban, beneficiary_name, sms_confirmation_active, beneficiary_country, user_country, user_asn
) select
IP, IDSessione, Timestamp, date_format(Timestamp, '%Y-%m'), hour(Timestamp), TipoOperazione, Importo, MsgErrore, UserID, IBAN, Nominativo, IF(NumConfermaSMS = 'Si', 1, 0),
IBAN_CC, SPLIT_STR(CC_ASN, ',', 1), SPLIT_STR(CC_ASN, ',', 2)
from quiubi_bonifici;

-- create user aggregation view
DROP VIEW IF EXISTS user_analysis;
CREATE VIEW user_analysis AS
select user_id, count(1) number_of_transfers, sum(amount) total_amount
from transfers
group by user_id;

-- create empty anomalies tables
-- drop table if exists user_hour_anomaly;
-- create table user_hour_anomaly (
  -- userId varchar(45) NOT NULL,
  -- month int not null,
  -- anomaly float not null
-- )
