define({ "api": [
  {
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "optional": false,
            "field": "varname1",
            "description": "<p>No type.</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "varname2",
            "description": "<p>With type.</p>"
          }
        ]
      }
    },
    "type": "",
    "url": "",
    "version": "0.0.0",
    "filename": "webside-dtgrid/src/main/webapp/apidoc/main.js",
    "group": "D__gitapp_webside_webside_dtgrid_src_main_webapp_apidoc_main_js",
    "groupTitle": "D__gitapp_webside_webside_dtgrid_src_main_webapp_apidoc_main_js",
    "name": ""
  },
  {
    "type": "GET",
    "url": "/openapi/v1/weather/{cityName}",
    "title": "获取天气",
    "version": "1.0.0",
    "name": "Get_weather_information_by_cityName_",
    "group": "Weather",
    "permission": [
      {
        "name": "none"
      }
    ],
    "description": "<p>Get weather information by cityName.</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "cityName",
            "description": "<p>Name of the city.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Request-Example:",
          "content": "{\n  \"id\": 4711\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "firstname",
            "description": "<p>The weather information fo the city.</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "lastname",
            "description": "<p>The weather information fo the city.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"firstname\": \"John\",\n  \"lastname\": \"Doe\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 404 Not Found\n{\n  \"error\": \"UserNotFound\"\n}",
          "type": "json"
        }
      ]
    },
    "filename": "webside-dtgrid/src/main/java/com/webside/open/controller/WeatherController.java",
    "groupTitle": "Weather"
  }
] });
