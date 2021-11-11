select * from user_tables where table_name like '%EQUIPMENT%';

select * from EQUIPMENTSPECIFICATION
where vendorname is null;

select vendorname, count(*) from equipmentspecification
group by vendorname order by 2 desc;

select s.name, s.* from specification s, physicaldevicespecification p
where s.entityid = p.entityid
and s.entityclass = 'PhysicalDeviceSpecificationDAO'
and upper(name) like '%ERICSSON%';

select count(*) from specification s, physicaldevicespecification p
where s.entityid = p.entityid
and s.entityclass = 'PhysicalDeviceSpecificationDAO'; -- 271

select * from physicaldevicespecification;

select s.name, s.entityclass, l.* from logicaldevicespecification l, specification s
where vendorname is null
and l.entityid = s.entityid
and s.entityclass = 'LogicalDeviceSpecificationDAO';

select vendorname, count(*) 
from logicaldevicespecification
group by vendorname;

select * from service;
