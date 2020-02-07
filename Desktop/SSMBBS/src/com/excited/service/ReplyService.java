package com.excited.service;

import com.excited.domain.Reply;

import java.text.ParseException;
import java.util.List;

public interface ReplyService {
    public void addReply(Reply reply) throws ParseException;

    public List<Reply> listReplyByPostId(int postId);

    public void deleteReply(int replyId);
    public void updatereplyGoodCount(Reply reply);
	public Reply replybyid(int replyid);
}
