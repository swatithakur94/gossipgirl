package com.gossipgirl.forumcomment;

import java.util.List;

public interface ForumCommentDAO {

	public void addForumComment(ForumComment forumComment);
	
	public List<ForumComment> listForumComment();
	
	

}
