package com.excited.service;

import com.excited.domain.Dianzan;
import com.excited.domain.Post;

import java.util.ArrayList;
import java.util.List;

public interface PostService {
    public List<Dianzan> dianzans=new ArrayList<Dianzan>(); 
	public void addPostByPost(Post post);
    public Post listPostContent(int postId);
    public List<Post> findPostByUserName(String postUserName);
    public List<Post> listAllPost();
    public List<Post> listAllPostbytime(int postBoardId);
    public void updatepoststate(int postStatus,int postId);
    public void deletePost(int postId);
    public void updatePostByPost(Post post);
    public void updateviewCount(Post post);
    public void updateGoodCount(Post Post);
    public List<Post> findByPost(String name);
    public List<Dianzan> Postdianzan(Dianzan dianzan);
}
