package com.excited.controller;

import com.excited.domain.Post;
import com.excited.domain.Reply;
import com.excited.domain.User;
import com.excited.service.ReplyService;
import com.excited.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/reply")
public class ReplyController {
    @Autowired
    ReplyService replyService;

    @Autowired
    UserService userService;
    int flag=0;

    // 添加回复
    @RequestMapping(value = "addReply", method = RequestMethod.POST)
    public String addReply(Reply reply, HttpServletRequest request,Model model) throws ParseException {
     	String username=(String) request.getSession().getAttribute("username");
    	User user=userService.getUserByUserName(username);
    	System.out.println(user);
    	if(user.getUserState()!=0) {
    		model.addAttribute("Msg", "你已经被禁言！");
    		return "error";
    	}else {
        replyService.addReply(reply);
        }
        return "redirect:/post/postContent-" + reply.getReplyPostId();
    }
    //回复点赞
    @ResponseBody
    @RequestMapping("/replydianzan")
    public Map<String, Object>  replydianzan(int replyid,HttpServletRequest request) {
    	Reply reply=replyService.replybyid(replyid);
    	Map<String, Object> map = new HashMap<String, Object>();
		String username=(String) request.getSession().getAttribute("username");
		if(request.getSession().getAttribute(username+"_flag_"+replyid)==null)
		{
			reply.setReplyGoodCount(reply.getReplyGoodCount()+1);
			replyService.updatereplyGoodCount(reply);
			request.getSession().setAttribute(username+"_flag_"+replyid, 0);
		}else {
			if((int)request.getSession().getAttribute(username+"_flag_"+replyid)==0) {
				reply.setReplyGoodCount(reply.getReplyGoodCount()-1);
				replyService.updatereplyGoodCount(reply);
				request.getSession().setAttribute(username+"_flag_"+replyid, 1);
			}else {
				reply.setReplyGoodCount(reply.getReplyGoodCount()+1);
				replyService.updatereplyGoodCount(reply);
				request.getSession().setAttribute(username+"_flag_"+replyid, 0);
			}
		}

    	map.put("reply", reply);
    	System.out.println(reply);
    	return map;
    	
    }
    
}
