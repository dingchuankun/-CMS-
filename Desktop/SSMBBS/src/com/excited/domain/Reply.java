package com.excited.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Reply {
    // Œƒ’¬ªÿ∏¥ Ù–‘
    private int replyId;
    private int replyPostId;
    private String replyUserName;
    private String replyContent;
    private int replyGoodCount;
    private int replyBadCount;
    private String user_img;
    public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	private Date replyCreateTime;
    private String CreateTime;

    public String getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}

	public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getReplyPostId() {
        return replyPostId;
    }

    public void setReplyPostId(int replyPostId) {
        this.replyPostId = replyPostId;
    }

    public String getReplyUserName() {
        return replyUserName;
    }

    public void setReplyUserName(String replyUserName) {
        this.replyUserName = replyUserName;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public int getReplyGoodCount() {
        return replyGoodCount;
    }

    public void setReplyGoodCount(int replyGoodCount) {
        this.replyGoodCount = replyGoodCount;
    }

    public int getReplyBadCount() {
        return replyBadCount;
    }

    public void setReplyBadCount(int replyBadCount) {
        this.replyBadCount = replyBadCount;
    }

    public Date getReplyCreateTime() {
        return replyCreateTime;
    }

    public void setReplyCreateTime(Date replyCreateTime) {
        this.replyCreateTime = replyCreateTime;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "replyId=" + replyId +
                ", replyPostId=" + replyPostId +
                ", replyUserName=" + replyUserName +
                ", replyContent=" + replyContent +
                ", replyGoodCount=" + replyGoodCount +
                ", replyBadCount=" + replyBadCount +
                ", replyCreateTime" + replyCreateTime + "}";
    }
}
