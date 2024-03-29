CREATE TABLE `ddns` (
      `zone` INTEGER NOT NULL,
      `name` varchar(40) default NULL,
      `type` enum('A','CNAME','MX','NS','SOA') default NULL,
      `data` varchar(40) default NULL,
      `updatetime` datetime default NULL,
      `applied` TINYINT(1) default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `zone` (
      `id` INTEGER NOT NULL AUTO_INCREMENT,
      `domain` varchar(40) NOT NULL,
      PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

