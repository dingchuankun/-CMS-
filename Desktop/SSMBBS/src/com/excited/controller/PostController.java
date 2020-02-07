package com.excited.controller;

import com.excited.domain.Dianzan;
import com.excited.domain.Post;
import com.excited.domain.Reply;
import com.excited.domain.User;
import com.excited.service.BoardService;
import com.excited.service.PostService;
import com.excited.service.ReplyService;
import com.excited.service.UserService;
import com.excited.service.Impl.UserServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/post")
public class PostController {
	@Autowired
	PostService postService;

	@Autowired
	BoardService boardService;

	@Autowired
	ReplyService replyService;
	@Autowired
	private UserService userService;
	int postid_s = 0;

	// 添加帖子
	@RequestMapping(value = "/addPost")
	public String addPost(Post post, HttpServletRequest request, Model model) throws ParseException {
		if (post != null) {
			String username = (String) request.getSession().getAttribute("username");
			User user = userService.getUserByUserName(username);
			System.out.println(user);
			if (user.getUserState() != 0) {
				model.addAttribute("Msg", "你已经被禁言！");
				return "error";
			} else {
				Post newPost = post;
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String format = sf.format(new Date());
				Date parse = sf.parse(format);
				newPost.setPostCreateTime(parse);
				newPost.setPostUpdateTime(parse);
				postService.addPostByPost(newPost);
				boardService.updatePostNum(newPost.getPostBoardId());
				return "redirect:postContent-" + post.getPostId();
			}
		}
		return "error";
	}

	// 查看帖子
	@RequestMapping(value = "postContent-{postId}")
	public String intoPost(@PathVariable int postId, HttpServletRequest request) {
		Post post = postService.listPostContent(postId);
		List<Reply> replies = replyService.listReplyByPostId(postId);
		int viewCount = post.getPostViewCount();
		viewCount++;
		post.setPostViewCount(viewCount);
		String username = post.getPostUserName();
		User user = userService.getUserByUserName(username);
		post.setUser(user);
		System.out.println(post);
		postService.updateviewCount(post);
		if (post == null) {
			return "/error";
		}
		// 帖子有回复则添加回复信息
		if (replies != null) {
			for (Reply reply : replies) {
				User user2 = userService.getUserByUserName(reply.getReplyUserName());
				if (user2 != null) {
					reply.setUser_img(user2.getUser_img());
				}
			}
			request.setAttribute("replies", replies);
		}

		request.setAttribute("post", post);
		return "post/postContent";
	}

	// 搜索
	@RequestMapping("/search")
	public String managePost(String name, HttpServletRequest request) {
		System.out.println(name);
		List<Post> posts = postService.findByPost(name);
		if (posts != null) {
			for (Post post : posts) {
				String username = post.getPostUserName();
				User user = userService.getUserByUserName(username);
				post.setUser(user);
			}
			request.setAttribute("posts", posts);
			return "post/postMain";
		}
		return "redirect:/error";
	}

	// 点赞dianzan
	@ResponseBody
	@RequestMapping("/dianzan")
	public Map<String, Object> dianzan(int postid, HttpServletRequest request) {
		Post post = postService.listPostContent(postid);
		Map<String, Object> map = new HashMap<String, Object>();
		String username=(String) request.getSession().getAttribute("username");
		if(request.getSession().getAttribute(username+"_flag_"+postid)==null)
		{
			post.setPostGoodCount(post.getPostGoodCount() + 1);
			postService.updateGoodCount(post);
			request.getSession().setAttribute(username+"_flag_"+postid, 0);
		}else {
			if((int)request.getSession().getAttribute(username+"_flag_"+postid)==0) {
				post.setPostGoodCount(post.getPostGoodCount() - 1);
				postService.updateGoodCount(post);
				request.getSession().setAttribute(username+"_flag_"+postid, 1);
			}else {
				post.setPostGoodCount(post.getPostGoodCount() + 1);
				postService.updateGoodCount(post);
				request.getSession().setAttribute(username+"_flag_"+postid, 0);
			}
		}
		map.put("post", post);
		System.out.println(post);
		return map;

	}

}
