package com.weige.demo;

import com.weige.demo.domain.StudentsEntity;
import com.weige.demo.domain.StudentsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by liqiang on 16/9/15.
 */
@Controller
public class WeigeController {

    @Autowired
    StudentsMapper studentsMapper;

    @RequestMapping(value = "/getStudents")
    @ResponseBody
    public List<StudentsEntity> getStudents(String name) {
        return studentsMapper.findByName(name);
    }

    @RequestMapping(value = "/postStudents", method = RequestMethod.POST)
    @ResponseBody
    public String postStudents(@RequestBody StudentsEntity studentsEntity) {

        int i = studentsMapper.insertByStudents(studentsEntity);
        if (i < 1) {
            return "failure";
        }
        return "successful";
    }

    @RequestMapping("/admin")
    public String admin(Model model){
        StudentsEntity studentsEntity = new StudentsEntity();
        studentsEntity.setName("登录成功");
        model.addAttribute("cao",studentsEntity);
        return "admin";
    }

    @RequestMapping(value = "/dologin",method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpSession session, @RequestParam(value = "user") String user
            , @RequestParam(value = "pwd") String pwd){

        if(StringUtils.isEmpty(user)||StringUtils.isEmpty(pwd)) {
           return "failure";
       }
       if(user.equals("admin") && pwd.equals("admin")){
           session.setAttribute("token","admin");
           session.setMaxInactiveInterval(60 * 30);
           return "successful";
       }else {
           return "failure";
       }
    }

//    @RequestMapping(value = "/login",method = RequestMethod.GET)
//    public String dologin(Model model){
//        return "login";
//    }

}
