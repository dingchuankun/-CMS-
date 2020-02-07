package com.excited.controller;

import com.excited.domain.Board;
import com.excited.domain.Post;
import com.excited.domain.User;
import com.excited.service.BoardService;
import com.excited.service.PostService;
import com.excited.service.ReplyService;
import com.excited.service.UserService;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    BoardService boardService;

    @Autowired
    UserService userService;

    @Autowired
    PostService postService;

    @Autowired 
    ReplyService replyService;

    // 论坛管理中心
    @RequestMapping(value = "/manageCenter")
    public String manageCenter(HttpServletRequest request) {
        if (request.getSession().getAttribute("username").equals("admin")) {
            return "admin/manageCenter";
        }
        return "redirect:/error";
    }

    // 论坛版块管理中心
    @RequestMapping(value = "/manageBoard")
    public String manageBoard(HttpServletRequest request) {
        if (request.getSession().getAttribute("username").equals("admin")) {
            List<Board> boards = boardService.listAllBoard();
            for(Board board:boards) {
            	if(board.getBoardDesc().length()>10) {
                    String substring1 = board.getBoardDesc().substring(0, 10)+"...";
                    board.setBoardDesc(substring1);
            	}
            }
            String username=(String) request.getSession().getAttribute("username");
            User user =userService.getUserByUserName(username);
            request.setAttribute("user", user);
            System.out.println(boards);
            request.setAttribute("boards", boards);
            return "admin/manageBoard";
        }
        return "redirect:/error";
    }

    // 添加论坛板块
    @RequestMapping(value = "addBoard", method = RequestMethod.POST)
    public String addBoard(MultipartFile file,Board board, HttpServletRequest request) throws IllegalStateException, IOException {
    	if (file.getOriginalFilename().length() >= 3) {
			String url = request.getRealPath("WEB-INF/resources/img/board/");
			file.transferTo(new File(url + "/" + file.getOriginalFilename()));
			board.setBoard_img("resources/img/board/" + file.getOriginalFilename());
		}
    	if (board != null) {
            boardService.addBoardByBoard(board);
            return "redirect:/admin/manageBoard";
        }

        request.getSession().setAttribute("Msg", "添加板块出错！");
        return "admin/error";
    }

    // 修改板块信息
    @RequestMapping(value = "updateBoard", method = RequestMethod.POST)
    public String updateBoard(MultipartFile file,Board board, HttpServletRequest request) throws IllegalStateException, IOException {

		if (file.getOriginalFilename().length() >= 3) {
			String url = request.getRealPath("WEB-INF/resources/img/board/");
			file.transferTo(new File(url + "/" + file.getOriginalFilename()));
			board.setBoard_img("resources/img/board/" + file.getOriginalFilename());
		}
        if (board != null) {
        	System.out.println(board);
            boardService.updateBoardInfo(board);
            // 成功更新数据后跳转页面
            return "redirect:/admin/manageBoard";
        }
        // 更新数据失败跳转到错误页面
        return "redirect:/error";
    }

    // 管理用户信息
    @RequestMapping(value = "manageUser")
    public String manageUser(HttpServletRequest request) {
        List<User> users = userService.getAllUser();

        if (users != null) {
            request.setAttribute("users", users);
            return "/admin/allUserInfo";
        }

        return "redirect:/error";
    }
    //禁言用户
    @ResponseBody
    @RequestMapping(value = "prohibitUser")
    public String prohibitUser(HttpServletRequest request,int id) {
    		int userState=1;
    		userService.updateuserstate(userState,id);
    		return "success";
    }
    //不禁言用户
    @ResponseBody
    @RequestMapping(value = "noprohibitUser")
    public String noprohibitUser(HttpServletRequest request,int id) {
    		int userState=0;
    		userService.updateuserstate(userState,id);
    		return "success";
    }
    //屏蔽主题
    @ResponseBody
    @RequestMapping(value = "pingbipost")
    public String pingbipost(HttpServletRequest request,int id) {
    		int poststate=1;
    		postService.updatepoststate(poststate,id);
    		return "success";
    }
    //解除屏蔽主题
    @ResponseBody
    @RequestMapping(value = "nopingbipost")
    public String nopingbipost(HttpServletRequest request,int id) {
    		int poststate=0;
    		postService.updatepoststate(poststate,id);
    		return "success";
    }
    //删除用户
    @ResponseBody
    @RequestMapping(value = "deleteuser",produces = "text/plain;charset=utf-8")
    public String deleteuser(HttpServletRequest request,String name) {
	    	User user=userService.getUserByUserName(name);
	    	if(user.getUserType()==0) {
				return "这是管理员，删除失败！";
			}
    		userService.deleteUserByUserName(name);
    		return "success";
    }
    //搜索用户
    @RequestMapping("/searchuser")
    public String searchuser(String name,HttpServletRequest request) {
        System.out.println(name);
        List<User> users = userService.findByuser(name);
        if (users != null) {
        	request.setAttribute("users", users);
            return "/admin/allUserInfo";
        }
        return "redirect:/error";
    }
    // 管理发表的主题
    @RequestMapping(value = "managePost")
    public String managePost(HttpServletRequest request) {
        List<Post> posts = postService.listAllPost();
        if (posts != null) {
            request.setAttribute("posts", posts);
            return "/admin/allPostInfo";
        }

        return "redirect:/error";
    }

    // 删除已经发表的主题
    @RequestMapping(value = "deletePost")
    public String deletePost(int postId, int postBoardId) {
        postService.deletePost(postId);
        return "redirect:/board/listPosts-" + postBoardId;
    }

    // 删除回复
    @RequestMapping(value = "deleteReply")
    public String deleteReply(int replyId, int replyPostId) {
        replyService.deleteReply(replyId);
        return "redirect:/post/postContent-" + replyPostId;
    }
    // 删除主题

    @RequestMapping(value = "deletePostx")
    public String deletePostx(int postId,HttpServletRequest request) {
        postService.deletePost(postId);
        List<Post> posts = postService.listAllPost();
        request.setAttribute("posts", posts);
        return "/admin/allPostInfo";
    }


    // 删除板块
    @RequestMapping(value = "deleteBoard")
    public String deleteBoard(int boardId) {
        boardService.deleteBoard(boardId);
        return "redirect:manageBoard";
    }
}
