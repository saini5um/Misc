select * from user_tables
where table_name like '%PROP%';

select * from network where entityid = 75075106
order by createddate desc;

select * from network where id = '7275006';

select * from networknode 
where network = 75075342
order by createddate desc;

select * from NETNODE_LOGDEVREL order by createddate desc;

-- all logical devices associated in the network
select logicaldevice
from network n, networknode o, netnode_logdevrel r
where n.id = '7275006'
and n.entityid = o.network
and o.entityid = r.networknode;

-- location of a logical device
select deviceidentifier, l.name, networklocationentitycode, l.propertylocation,
horizontal, vertical, latitude, longitude 
from logicaldevice l, geographicplace g
where l.entityid = 106877641
and g.entityid = l.propertylocation
and g.entityclass = 'PropertyLocationDAO';

select deviceidentifier, l.name, networklocationentitycode, horizontal, vertical, latitude, longitude
from network n, networknode o, netnode_logdevrel r, logicaldevice l, geographicplace g
where n.id = '7275006'
and n.entityid = o.network
and o.entityid = r.networknode
and r.logicaldevice = l.entityid
and g.entityid = l.propertylocation
and g.entityclass = 'PropertyLocationDAO';


select * from place_logicaldevicerel;

select * from GEOGRAPHICPLACE
where propertylocation = 91575113;

select * from geographicplace 
where entityid = 91575113 or propertylocation = 91575113;
and entityid < 91575116;