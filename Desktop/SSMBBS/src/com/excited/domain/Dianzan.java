package com.excited.domain;

public class Dianzan {
	int postid;
	int replyid;
	String username;
	@Override
	public String toString() {
		return "Dianzan [postid=" + postid + ", replyid=" + replyid + ", username=" + username + "]";
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getReplyid() {
		return replyid;
	}
	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
