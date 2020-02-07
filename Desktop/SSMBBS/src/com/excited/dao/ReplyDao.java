package com.excited.dao;

import com.excited.domain.Post;
import com.excited.domain.Reply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {
    public void addReply(Reply reply);

    public List<Reply> listReplyByPostId(int postId);

    public void deleteReplyById(int postId);

    public Reply findReplyByReplyId(int replyId);
    public void updatereplyGoodCount(Reply reply);
	public Reply replybyid(int replyid);
}
