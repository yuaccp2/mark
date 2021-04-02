alter table dm_sparrow_new_user_h MODIFY column updated DateTime DEFAULT now()
ALTER TABLE dm_data_dlin_country MODIFY COLUMN  dlin_renew Float64;
ALTER TABLE dm_data_dlin_country MODIFY COLUMN  dlin_renew_refund Float64;
ALTER TABLE dm_data_dlin_country MODIFY COLUMN  dlin_refund Float64;
ALTER TABLE dm_data_dlin_country MODIFY COLUMN  dlin_netamount Float64;
ALTER TABLE dm_data_dlin_country MODIFY COLUMN   product_id  Int64;
##
CREATE TABLE product_install_usage ENGINE = MergeTree order by install_date AS SELECT * FROM mysql('192.168.9.88:3307', 'cbs_logs', 'product_usage_20', 'logs_read', 'Logs@12345') where install_date>='2020-10-01 00:00:00';
CREATE TABLE product_full_install_usage ENGINE = MergeTree order by install_date AS SELECT * FROM mysql('192.168.9.88:3307', 'cbs_logs', 'product_install_usage_20', 'logs_read', 'Logs@12345') where install_date>='2020-10-01 00:00:00';
##
clickhouse-client --host 10.14.1.138 -u odsrpdev --password=asdf1982bm -d default --multiquery -q "insert into product_download_usage SELECT * FROM mysql('192.168.9.88:3307', 'cbs_logs', 'product_usage_20', 'logs_read', 'Logs@12345') where download_start>='2020-10-01 00:00:00'";

clickhouse-client --host 10.14.1.138 -u odsrpdev --password=asdf1982bm -d default --multiquery -q "insert into dim_property_data SELECT * FROM mysql('10.13.0.81:3306', 'report_dm', 'dim_property_data', 'ods_dev', '^2017$#ab@c^') limit 10'";


clickhouse-client --host 10.14.1.138 -u odsrpdev --password=asdf1982bm -d default --multiquery -q "insert into dim_property_data SELECT * FROM mysql('10.13.0.81:3306', 'report_dm', 'dim_property_data', 'ods_dev', '^2017$#ab@c^') limit 10'";

#mysql ENGINE
CREATE TABLE dim_property_data_external \
( \
    `dim_property_data_id` Int64 COMMENT '维度表ID', \
    `sparrow_id` Nullable(String) COMMENT 'sparrow_id', \
    `product_id` Nullable(Int64) COMMENT '产品ID', \
    `version_id` Nullable(Int64) COMMENT '版本ID', \
    `pver` Nullable(String) COMMENT '版本名称', \
    `cat_act` Nullable(String) COMMENT '种类-行为', \
    `property` Nullable(String) COMMENT '属性', \
    `property_value` Nullable(String) COMMENT '属性值', \
    `property_type` Nullable(String) COMMENT '属性类型', \
    `status` Int8 COMMENT '状态 1-可用 -1 -不可用', \
    `update_time` Nullable(String) COMMENT '更新时间' \
) ENGINE = MySQL('10.13.0.81:3306', 'report_dm', 'dim_property_data', 'ods_dev', '^2017$#ab@c^');

CREATE TABLE dim_property_data \
( \
    `dim_property_data_id` Int64 COMMENT '维度表ID', \
    `sparrow_id` Nullable(String) COMMENT 'sparrow_id', \
    `product_id` Nullable(Int64) COMMENT '产品ID', \
    `version_id` Nullable(Int64) COMMENT '版本ID', \
    `pver` Nullable(String) COMMENT '版本名称', \
    `cat_act` Nullable(String) COMMENT '种类-行为', \
    `property` Nullable(String) COMMENT '属性', \
    `property_value` Nullable(String) COMMENT '属性值', \
    `property_type` Nullable(String) COMMENT '属性类型', \
    `status` Int8 COMMENT '状态 1-可用 -1 -不可用', \
    `update_time` Nullable(String) COMMENT '更新时间' \
) \
ENGINE = MergeTree() \
ORDER BY dim_property_data_id;



#1######CBS订单
IP：192.168.250.171
端口：3306
账密：bigdata_extract_user/jlW43ArZMVd0UCZJ5j



#2#####vp订单表
IP：192.168.250.171
端口：3306
账密：bigdata_extract_user/forderhUwDqgTWD41odM
