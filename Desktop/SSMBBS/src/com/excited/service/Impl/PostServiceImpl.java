package com.excited.service.Impl;

import com.excited.dao.BoardDao;
import com.excited.dao.PostDao;
import com.excited.domain.Board;
import com.excited.domain.Dianzan;
import com.excited.domain.Post;
import com.excited.domain.User;
import com.excited.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostDao postDao;

    @Autowired
    BoardDao boardDao;
    
    @Override
    public void addPostByPost(Post post) {
        postDao.addPost(post);
    }

    @Override
    public Post listPostContent(int postId) {
        return postDao.findPostByPostId(postId);
    }

    @Override
    public List<Post> listAllPost() {
    	List<Post> posts=postDao.listAllPostInfo();
      	for(Post post:posts) {
    		Date date = post.getPostCreateTime();
			SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			post.setCreateTime(sdfDateTime.format(date));
    	}
        return posts;
    }

    @Override
    public void deletePost(int postId) {
        // 更新Board数据
        int boardId = postDao.findPostByPostId(postId).getPostBoardId();
        Board board = boardDao.findBoardByBoardId(boardId);
        board.setBoardPostNum(board.getBoardPostNum() - 1);
        boardDao.updateBoardByBoard(board);

        // 删除post
        postDao.deletePostById(postId);
    }

	@Override
	public List<Post> findByPost(String name) {
		// TODO Auto-generated method stub
		return postDao.findPostByPost(name);
	}

	@Override
	public List<Post> listAllPostbytime(int postBoardId) {
		// TODO Auto-generated method stub
		return postDao.listAllPostbytime(postBoardId);
	}

	@Override
	public void updatePostByPost(Post post) {
		postDao.updatePostByPost(post);
		
	}

	@Override
	public void updateviewCount(Post post) {
		// TODO Auto-generated method stub
		postDao.updateviewCount(post);
	}

	@Override
	public void updateGoodCount(Post post) {
		postDao.updateGoodCount(post);
		
	}

	@Override
	public void updatepoststate(int postStatus,int postId) {
		// TODO Auto-generated method stub
		postDao.updatepoststate(postStatus,postId);
	}

	@Override
	public List<Post> findPostByUserName(String postUserName) {
		// TODO Auto-generated method stub
		return postDao.findPostByUserName(postUserName);
	}

	@Override
	public List<Dianzan> Postdianzan(Dianzan dianzan) {
		// TODO Auto-generated method stub
		dianzans.add(dianzan);
		return dianzans;
	}
}
