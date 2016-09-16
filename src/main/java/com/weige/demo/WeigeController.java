package com.weige.demo;

import com.cloopen.rest.sdk.CCPRestSDK;
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
import java.util.HashMap;
import java.util.List;
import java.util.Set;

/**
 * Created by liqiang on 16/9/15.
 */
@Controller
public class WeigeController {

    HashMap<String, Object> result = null;
    CCPRestSDK restAPI;
    public WeigeController(){
        restAPI = new CCPRestSDK();
        restAPI.init("sandboxapp.cloopen.com", "8883");// 初始化服务器地址和端口，格式如下，服务器地址不需要写https://
        restAPI.setSubAccount("83054e9e7bdd11e6997a6c92bf2c165d", "64487c10dba9e3813334d349aaf51f0c");// 初始化子帐号和子帐号TOKEN
        restAPI.setAppId("8aaf0708570871f8015731aed3e113d0");// 初始化应用ID
//		result = restAPI.callback("13113656554", "18007357371", "13113656554", "18007357371", "xx.wav(可选第三方自定义回拨提示音)", "是否一直播放提示音", "用于终止播放提示音的按键","第三方私有数据","最大通话时长","实时话单通知地址", "是否给主被叫发送话单", "是否录音", "通话倒计时", "到达倒计时时间播放的提示音");

    }

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

    @RequestMapping(value = "/callback",method = RequestMethod.GET)
    public @ResponseBody String callback(@RequestParam(value = "from") String from
            , @RequestParam(value = "to") String to){

        if(StringUtils.isEmpty(from)||StringUtils.isEmpty(to)) {
            return "failure";
        }
        result = restAPI.callback(from,to,from,to,null,null, null,null,null,null,null,null,null, null);
        System.out.println("SDKTestCallback result=" + result);
        if("000000".equals(result.get("statusCode"))){
            //正常返回输出data包体信息（map）
//            HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
//            Set<String> keySet = data.keySet();
//            for(String key:keySet){
//                Object object = data.get(key);
//                System.out.println(key +" = "+object);
//            }
            return "successful" ;
        }else{
            //异常返回输出错误码和错误信息
//            System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
            return "failure";
        }
    }

}
