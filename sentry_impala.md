hive整合sentry，impala，hue之后权限管理操作
7.Hive授权参考(开启sentry之后,对用户授权用不了,只能针对用户组，grant role testrole to user xxxxxxx; )

7.1：角色创建和删除
create role star_read ;
drop role star_read ;
grant role star_read to group star_read;

7.2：角色授权和取消授权
7.2.1：表授权给角色
grant select on table test_table to role star_read (针对表级赋予角色权限);

grant select on database hbase_db to role star_read (针对数据库级赋予角色权限);

revoke select on table test_table to role role_name(取消权限);


7.2.1：列授权给角色
grant select(column1,column2) on table test_table to role role_name;

revoke select(column1,column2) on table test_table to role role_name;


7.3：组授权和取消授权
grant role role_name to group user_group；

revoke role role_name to group user_group;

注意：Sentry适用于用户组授权，不适用于用户授权；

8.查看赋予的权限
show grant role aragon on database hbase_db(查看角色aragon有数据库hbase_db哪些权限);

show role grant group star_read;(查看哪些角色赋予了star_read组)


+-----------+--------+------------+---------+-----------------+-----------------+------------+---------------+-------------------+----------+--+
| database | table | partition | column | principal_name | principal_type | privilege | grant_option | grant_time | grantor |
+-----------+--------+------------+---------+-----------------+-----------------+------------+---------------+-------------------+----------+--+
| hbase_db | | | | aragon | ROLE | select | false | 1535966545398000 | -- |
+-----------+--------+------------+---------+-----------------+-----------------+------------+---------------+-------------------+----------+--+