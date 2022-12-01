CREATE SCHEMA Bohemia;

CREATE TABLE if not exists Region
(
	"RegionID"	bigserial	not null	constraint Region_PK primary key,
	"City"	varchar	not null,
	"Country"	varchar not null
);

CREATE TABLE if not exists Platform
(
	"PlatformID"	bigserial	not null	constraint Platform_PK primary key,
	"Platform"	varchar	not null
);

