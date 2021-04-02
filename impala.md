##精度问题
显示百分比，乘以100.0再用round函数 
用于除法时，会自动转换double精度，强制转换成Decimal
select concat(cast (round(cast((113743-539554) as Decimal)/539554 * 100.00,2) as string), '%')