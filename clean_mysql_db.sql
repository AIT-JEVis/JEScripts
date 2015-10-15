-- sql dump --
delete from relationship
  where startobject in (select id from object where deletets is not null)
    or endobject in (select id from object where deletets is not null);
delete from attribute
  where object in (select id from object where deletets is not null);
delete from sample
  where object in (select id from object where deletets is not null);
delete from object
  where deletets is not null;
delete from type
  where jevisclass not in (select name from objectclass);
delete from classrelationship
  where startclass not in (select name from objectclass)
  or endclass not in (select name from objectclass);
-- end --

