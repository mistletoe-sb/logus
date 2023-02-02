package com.logus.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.statistics.service.IStatisticsService;

@Controller
public class StatisticsController {
	
	@Autowired
	IStatisticsService statisticsService;
	
	@RequestMapping(value="/manager/statistics")
	public String getStatistics(Model model, RedirectAttributes redirectAttributession, HttpSession session) {
		if(session.getAttribute("sessionManagerId") != null) {
			
			model.addAttribute("jobRankList", statisticsService.countMemberJobList());
			
			return "manager/statistics";
		} else {
			return "manager/accessrestriction_manager";
		}
	}
	
	
	/*	 구글 차트 JSON 데이터의 형식
	{
	    "cols": [
	        {"label":"Topping","type":"string"},
	        {"label":"Slices","type":"number"}
	    ],        
	    "rows": [
	        {"c":[{"v":"Mushrooms"},{"v":3}]},
	        {"c":[{"v":"Onions"},{"v":1}]},
	        {"c":[{"v":"Olives"},{"v":1}]},
	        {"c":[{"v":"Zucchini"},{"v":1}]},
	        {"c":[{"v":"Pepperoni"},{"v":2}]}
	    ]
	}
	*/
	
	@RequestMapping(value="/manager/statistics/json/memberjob")
	public @ResponseBody JSONObject getJSONMemberJobList() {
		System.out.println("잡랭킹 : " + statisticsService.countMemberJobList());
		
		List<Map<String, Object>> maplist = statisticsService.countMemberJobList();
//		JSONArray json_array = new JSONArray(maplist);
		
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONArray ajaxArryCols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
	    JSONArray ajaxArryRows = new JSONArray();

		ajaxObjCols1.put("type", "string");
		ajaxObjCols2.put("type", "number");
		
		ajaxArryCols.add(ajaxObjCols1);
		ajaxArryCols.add(ajaxObjCols2);
				 
		for (int i=0; i<maplist.size(); i++){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
		    JSONObject legend = new JSONObject();
		    legend.put("v", maplist.get(i).get("memberJob"));
		    legend.put("f", null);
		    
		    JSONObject value = new JSONObject();
		    value.put("v", maplist.get(i).get("jobRank"));
		    value.put("f", null);
		 
		    JSONArray cValueArry = new JSONArray();
		    cValueArry.add(legend);
		    cValueArry.add(value);
		 
		    JSONObject cValueObj = new JSONObject();
		    cValueObj.put("c", cValueArry);
		    
		    ajaxArryRows.add(cValueObj);
		}

		data.put("cols", ajaxArryCols);
		data.put("rows", ajaxArryRows);
		
		return data;
	}
	
	@RequestMapping(value="/manager/statistics/json/membergeneration")
	public @ResponseBody JSONObject getJSONMemberGenerationList() {
		System.out.println("세대랭킹 : " + statisticsService.countMemberGenerationList());
		
		List<Map<String, Object>> maplist = statisticsService.countMemberGenerationList();
//		JSONArray json_array = new JSONArray(maplist);
		
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONArray ajaxArryCols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
	    JSONArray ajaxArryRows = new JSONArray();

		ajaxObjCols1.put("type", "string");
		ajaxObjCols2.put("type", "number");
		
		ajaxArryCols.add(ajaxObjCols1);
		ajaxArryCols.add(ajaxObjCols2);
				 
		for (int i=0; i<maplist.size(); i++){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
		    JSONObject legend = new JSONObject();
		    legend.put("v", maplist.get(i).get("'10세미만'"));
		    legend.put("f", null);
		    
		    JSONObject value = new JSONObject();
		    value.put("v", maplist.get(i).get("가입자"));
		    value.put("f", null);
		 
		    JSONArray cValueArry = new JSONArray();
		    cValueArry.add(legend);
		    cValueArry.add(value);
		 
		    JSONObject cValueObj = new JSONObject();
		    cValueObj.put("c", cValueArry);
		    
		    ajaxArryRows.add(cValueObj);
		}

		data.put("cols", ajaxArryCols);
		data.put("rows", ajaxArryRows);
		
		return data;
	}
}
