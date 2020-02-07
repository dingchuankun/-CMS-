package com.excited.controller;

import com.excited.domain.Board;
import com.excited.domain.Post;
import com.excited.domain.User;
import com.excited.service.BoardService;
import com.excited.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
    @Autowired
    BoardService boardService;
	@Autowired
	private UserService userService;
    // 显示相应板块的帖子
    @RequestMapping(value = "/listPosts-{boardId}")
    public String intoBoard(@PathVariable int boardId, HttpServletRequest request) {
        Board board = boardService.listAllPostOfBoard(boardId);
        if(board!=null) {
        	 List<Post> posts=board.getPosts();
        	 for (int i = 0, len = posts.size(); i < len; i++) {
     			if (posts.get(i).getPostStatus() == 1) {
     				posts.remove(posts.get(i));
     				len--;
     				i--;
     			}
     			if(posts.get(i).getPostContent().length()>70) {
                     String substring1 = posts.get(i).getPostContent().substring(0, 70)+"...";
                     posts.get(i).setPostContent(substring1);
     			}
     			String username=posts.get(i).getPostUserName();
     			User user=userService.getUserByUserName(username);
     			posts.get(i).setUser(user);
     		}
        }
        request.setAttribute("board", board);
        request.setAttribute("posts", board.getPosts());
        request.setAttribute("boardId", boardId);
        System.out.println(board);
        return "post/postMain";
    }
}
