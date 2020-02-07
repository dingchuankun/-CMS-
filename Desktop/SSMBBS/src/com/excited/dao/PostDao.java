package com.excited.dao;

import com.excited.domain.Post;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostDao {
    public void addPost(Post post);
    public Post findPostByPostId(int postId);
    public List<Post> listAllPostInfo();
    public List<Post> listAllPostbytime(int postBoardId);
    public void deletePostById(int postId);
    public void updateGoodCount(Post post);
    public void updatePostByPost(Post post);
    public void updateviewCount(Post post);
    public List<Post> findPostByPost(String name);
    public List<Post> findPostByUserName(String postUserName);
	public void updatepoststate(@Param("postStatus") int postStatus, @Param("postId") int postId);
    
}
