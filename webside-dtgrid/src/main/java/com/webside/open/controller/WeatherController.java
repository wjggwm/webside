package com.webside.open.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webside.base.basecontroller.BaseController;

/**
 * 天气开放接口
 * 
 * @author gaogang
 *
 */
@RestController
@RequestMapping("/openapi/v1")
public class WeatherController extends BaseController {

	/**
	 * @api {GET} /openapi/v1/weather/:cityName Get weather information by cityName
	 * 
	 * @apiVersion 1.0.0
	 * 
	 * @apiName getWeatherByCityName
	 * 
	 * @apiGroup Weather
	 * 
	 * @apiPermission none
	 *
	 * @apiDescription Get weather information by cityName.
	 *
	 * @apiParam {String} cityName Name of the city.
	 *
	 * @apiSuccess {String} firstname  The weather information fo the city.
	 * @apiSuccess {String} lastname  The weather information fo the city.
	 *
	 * @apiParamExample {json} Request-Example:
	 *     {
	 *       "id": 4711
	 *     }
	 *     
	 * @apiSuccessExample {json} Success-Response:
	 *     HTTP/1.1 200 OK
	 *     {
	 *       "firstname": "John",
	 *       "lastname": "Doe"
	 *     }
	 *     
	 * @apiErrorExample {json} Error-Response:
	 *     HTTP/1.1 404 Not Found
	 *     {
	 *       "error": "UserNotFound"
	 *     }
	 */
	@RequestMapping("/weather/{0}")
	public String getWeatherByCityName(String cityName)
	{
		return "";
	}
}
