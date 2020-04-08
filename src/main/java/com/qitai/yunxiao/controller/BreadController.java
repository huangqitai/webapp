package com.qitai.yunxiao.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qitai.yunxiao.entity.Bread;
import com.qitai.yunxiao.service.BreadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/BreadController")
public class BreadController {

    @Resource
    private BreadService breadService;

    @RequestMapping(value="/loginCheck",method = RequestMethod.POST)
    @ResponseBody
    public String loginCheck(HttpServletRequest request , HttpServletResponse response){
        String loginName = request.getParameter("login_name");
        String loginPassword = request.getParameter("login_password");
        Bread bread = breadService.loginCheck(loginName,loginPassword);

        HttpSession loginCheckSession = request.getSession();

        if (bread == null){
            return "0";
        }else{
            loginCheckSession.setAttribute("bread",bread);
            return "1";
        }
    }

    @RequestMapping(value = "/login")
    public String login(){

        return "bread_main";
    }

    @RequestMapping(value = "/dispatcher")
    public String dispatcher(){

        return "dis";
    }


    @RequestMapping(value = "/getBread" , method = RequestMethod.POST)
    @ResponseBody
    public String getBread(HttpServletRequest request , HttpServletResponse response) throws IOException {
        Bread bread = (Bread) request.getSession().getAttribute("bread");

        List<Bread> breads = new ArrayList<>();
        breads.add(bread);
        System.out.println(bread.toString());

        Object json = JSONObject.toJSON(breads);
        String jsonStr=json.toString();

        return jsonStr;
    }

    @RequestMapping(value = "/signIn")
    public String signIn(){

        return "signIn";
    }

    @RequestMapping(value = "/signInDo" , method = RequestMethod.POST)
    @ResponseBody
    public  void signInDo(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String breadName = request.getParameter("login_name");
        String password = request.getParameter("login_password");
        int row_count = breadService.addBread(breadName,password);
        //int row_count = breadService.rowCount();
        Map<String,String> map = new HashMap<>();

        if(row_count>0){
            map.put("signCode","1");
        }else {
            map.put("signCode","0");
        }

        Object jsonObject = JSONObject.toJSON(map);
        response.getWriter().print(jsonObject);
    }

    @RequestMapping(value = "/getBreadAll")
    public ModelAndView getBreadAll(){

        ArrayList<Bread> breads = (ArrayList<Bread>) breadService.getBreadAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("breadAll");

        modelAndView.addObject("breads",breads);
        return modelAndView;
    }

    @RequestMapping(value = "/delBread")
    public String delBread(HttpServletRequest request){

        int id = Integer.parseInt(request.getParameter("breadNumber"));
        breadService.deleteBread(id);
        return "redirect:/BreadController/getBreadAll.do";
    }

    @RequestMapping(value = "/editBread")
    public ModelAndView editBread(HttpServletRequest request){

        int id = Integer.parseInt(request.getParameter("breadNumber"));
        Bread bread = breadService.getBreadById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editBread");
        modelAndView.addObject("bread",bread);
        return modelAndView;
    }

    @RequestMapping(value = "/editDo")
    public String editDo(HttpServletRequest request){

        int id = Integer.parseInt(request.getParameter("userId"));
        String newName = request.getParameter("username");
        String newPW = request.getParameter("PW");

        Bread bread = new Bread(id,newName,newPW);
        breadService.updateBread(bread);

        return "redirect:/BreadController/getBreadAll.do";
    }
}
