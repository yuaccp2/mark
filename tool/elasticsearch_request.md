POST user/_close

PUT user/_settings
{
  "number_of_replicas": 0,
  "index":{
    "analysis.analyzer.default.type":"ik_max_word",
    "analysis.search_analyzer.default.type":"ik_smart"
  }
}
POST user/_open


PUT cbs_order_info_test/_settings
{
    "analysis": {
      "normalizer": {
        "my_normalizer": {
          "type": "custom",
          "char_filter": [],
          "filter": ["lowercase", "asciifolding"]
        }
      }
}
}

PUT cbs_order_info_test/_mapping/list

{
	"properties": {
		"license": {
		  "type": "keyword",
		  "ignore_above": 256,
		  "normalizer": "my_normalizer"
		}
	}	
}

{
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
  },
  "mappings": {
    "list": {
      "properties": {
        "license": {
          "type": "keyword",
          "ignore_above": 256,
          "normalizer": "case_insensitive"
        }
      }
    }
  }
}



PUT _aliases
{
    "actions":[
        {
            "remove":{
                "alias":"order_info",
                "index":"cbs_order_info"
            },
            "add":{
                "alias":"order_info",
                "index":"cbs_order_info_190515"
            }
        }
    ]
}
