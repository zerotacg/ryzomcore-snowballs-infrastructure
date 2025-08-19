CREATE TABLE IF NOT EXISTS shard
(
    ShardId           int(10)                                              NOT NULL DEFAULT '0',
    domain_id         int(11) unsigned                                     NOT NULL DEFAULT '0',
    WsAddr            varchar(64)                                                   DEFAULT NULL,
    NbPlayers         int(10) unsigned                                              DEFAULT '0',
    Name              varchar(255)                                                  DEFAULT 'unknown shard',
    Online            tinyint(1) unsigned                                           DEFAULT '0',
    ClientApplication varchar(64)                                                   DEFAULT 'snowballs',
    Version           varchar(64)                                          NOT NULL DEFAULT '',
    PatchURL          varchar(255)                                         NOT NULL DEFAULT '',
    DynPatchURL       varchar(255)                                         NOT NULL DEFAULT '',
    FixedSessionId    int(11) unsigned                                     NOT NULL DEFAULT '0',
    State             enum ('ds_close','ds_dev','ds_restricted','ds_open') NOT NULL DEFAULT 'ds_dev',
    MOTD              text                                                 NOT NULL DEFAULT '',
    prim              int(10) unsigned primary key auto_increment
) COMMENT ='contains all shards information for login system';


-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS user
(
    UId                   int(10) primary key auto_increment,
    Login                 varchar(64) unique                                 NOT NULL DEFAULT '',
    Password              varchar(106)                                                DEFAULT NULL,
    ShardId               int(10)                                            NOT NULL DEFAULT '-1',
    State                 enum ('Offline','Online', 'Authorized', 'Waiting') NOT NULL DEFAULT 'Offline',
    Privilege             varchar(255)                                       NOT NULL DEFAULT '',
    ExtendedPrivilege     varchar(128)                                       NOT NULL DEFAULT '',
    Cookie                VARCHAR(30)                                        NOT NULL DEFAULT ''
) COMMENT ='contains all users information for login system';

-- add default user with login 'snowballs' and password 'snowballs
insert into user (Login, Password, ShardId, Privilege, ExtendedPrivilege)
values ('snowballs', '9af24e310629db1370b494fabd6317a6', '300', ':DEV:', ':EXTENDED:');
