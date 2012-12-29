CREATE TABLE `ddns` (
      `name` varchar(40) default NULL,
      `type` enum('A','CNAME','MX','NS','SOA') default NULL,
      `data` varchar(40) default NULL,
      `updatetime` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

