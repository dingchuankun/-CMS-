package com.excited.service.Impl;

import com.excited.dao.PostDao;
import com.excited.dao.ReplyDao;
import com.excited.domain.Post;
import com.excited.domain.Reply;
import com.excited.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    ReplyDao replyDao;

    @Autowired
    PostDao postDao;

    @Override
    public void addReply(Reply reply) throws ParseException {
        // ����post��Ϣ
        Reply dbReply = reply;
        int postId = reply.getReplyPostId();
        Post post = postDao.findPostByPostId(postId);
        post.setPostReplyCount(post.getPostReplyCount() + 1);
        postDao.updatePostByPost(post);

        // ��ӻظ�
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String format = sf.format(new Date());
		Date parse = sf.parse(format);
        dbReply.setReplyCreateTime(parse);
        replyDao.addReply(dbReply);
    }

    @Override
    public List<Reply> listReplyByPostId(int replyPostId) {
        return replyDao.listReplyByPostId(replyPostId);
    }

    @Override
    public void deleteReply(int replyId) {
        // ����post��Ϣ
        Reply reply = replyDao.findReplyByReplyId(replyId);
        Post post = postDao.findPostByPostId(reply.getReplyPostId());
        post.setPostReplyCount(post.getPostReplyCount() - 1);
        postDao.updatePostByPost(post);

        // ɾ���ظ�
        replyDao.deleteReplyById(replyId);
    }

	@Override
	public Reply replybyid(int replyid) {
		// TODO Auto-generated method stub
		return replyDao.replybyid(replyid);
	}

	@Override
	public void updatereplyGoodCount(Reply reply) {
		// TODO Auto-generated method stub
		replyDao.updatereplyGoodCount(reply);
	}
}
