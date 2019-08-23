https://github.com/NLPchina/elasticsearch-sql
1.模糊匹配实现
GET cbs_order_info/_search
{
    "query": {
        "wildcard" : { "email": "*wondershare*" }
    }
}
2.导入日期格式问题
需显示的转换为字符串,python 或者 SQL 
3.分页问题
  size,from 只支持1W搜索
  采用scroll 连续分页
4.解决大小写问题
定制 normalizer 
https://www.elastic.co/guide/en/elasticsearch/reference/6.5/normalizer.html
eg.
  "settings": {
    "analysis": {
      "normalizer": {
        "case_insensitive": {
          "type": "custom",
          "char_filter": [],
          "filter": ["lowercase", "asciifolding"]
        }
      }
    }
  }
5.排序


