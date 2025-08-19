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
/*
    GroupName             varchar(255)                                       NOT NULL DEFAULT '',
    FirstName             varchar(255)                                       NOT NULL DEFAULT '',
    LastName              varchar(255)                                       NOT NULL DEFAULT '',
    Birthday              varchar(32)                                        NOT NULL DEFAULT '',
    Gender                tinyint(1) unsigned                                NOT NULL DEFAULT '0',
    Country               char(2)                                            NOT NULL DEFAULT '',
    Email                 varchar(255) unique                                NOT NULL DEFAULT '',
    Address               varchar(255)                                       NOT NULL DEFAULT '',
    City                  varchar(100)                                       NOT NULL DEFAULT '',
    PostalCode            varchar(10)                                        NOT NULL DEFAULT '',
    USState               char(2)                                            NOT NULL DEFAULT '',
    Chat                  char(2)                                            NOT NULL DEFAULT '0',
    BetaKeyId             int(10) unsigned                                   NOT NULL DEFAULT '0',
    CachedCoupons         varchar(255)                                       NOT NULL DEFAULT '',
    ProfileAccess         varchar(45)                                                 DEFAULT NULL,
    Level                 int(2)                                             NOT NULL DEFAULT '0',
    CurrentFunds          int(4)                                             NOT NULL DEFAULT '0',
    IdBilling             varchar(255)                                       NOT NULL DEFAULT '',
    Community             char(2)                                            NOT NULL DEFAULT '--',
    Newsletter            tinyint(1)                                         NOT NULL DEFAULT '1',
    Account               varchar(64)                                        NOT NULL DEFAULT '',
    ChoiceSubLength       tinyint(2)                                         NOT NULL DEFAULT '0',
    CurrentSubLength      varchar(255)                                       NOT NULL DEFAULT '0',
    ValidIdBilling        int(4)                                             NOT NULL DEFAULT '0',
    GMId                  int(4)                                             NOT NULL DEFAULT '0',
*/
    ExtendedPrivilege     varchar(128)                                       NOT NULL DEFAULT '',
/*
    ToolsGroup            varchar(20)                                        NOT NULL DEFAULT '',
    Unsubscribe           date                                               NOT NULL DEFAULT '0000-00-00',
    SubDate               datetime                                           NOT NULL DEFAULT '0000-00-00 00:00:00',
    SubIp                 varchar(20)                                        NOT NULL DEFAULT '',
    SecurePassword        varchar(32)                                        NOT NULL DEFAULT '',
    LastInvoiceEmailCheck date                                               NOT NULL DEFAULT '0000-00-00',
    FromSource            varchar(8)                                         NOT NULL DEFAULT '',
    ValidMerchantCode     varchar(13)                                        NOT NULL DEFAULT '',
    PBC                   tinyint(1)                                         NOT NULL DEFAULT '0',
    ApiKeySeed            varchar(8)                                                  DEFAULT NULL,
 */
    Cookie                VARCHAR(30)                                        NOT NULL DEFAULT ''
/*
    ,
    index GroupIndex (GroupName),
    index ToolsGroup (ToolsGroup),
    index CurrentSubLength (CurrentSubLength),
    index Community (Community),
    index GMId (GMId)
*/
) COMMENT ='contains all users information for login system';

-- add default user with login 'snowballs' and password 'snowballs
insert into user (Login, Password, ShardId, Privilege, ExtendedPrivilege)
values ('snowballs', '9af24e310629db1370b494fabd6317a6', '300', ':DEV:', ':EXTENDED:');
