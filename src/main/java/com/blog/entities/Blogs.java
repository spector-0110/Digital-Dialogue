package com.blog.entities;

import java.sql.Timestamp;

public class Blogs {

	private int pid;
	private String title;
	private String content;
	private String code;
	private String pic;
	private Timestamp dateTimestamp;
	private int cid;
	private int uid;

	public Blogs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blogs(int pid, String title, String content, String code, String pic, Timestamp dateTimestamp, int cid,
			int uid) {
		super();
		this.pid = pid;
		this.title = title;
		this.content = content;
		this.code = code;
		this.pic = pic;
		this.dateTimestamp = dateTimestamp;
		this.cid = cid;
		this.uid = uid;
	}

	public Blogs(String title, String content, String code, String pic, Timestamp dateTimestamp, int cid, int uid) {
		super();
		this.title = title;
		this.content = content;
		this.code = code;
		this.pic = pic;
		this.dateTimestamp = dateTimestamp;
		this.cid = cid;
		this.uid = uid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Timestamp getDateTimestamp() {
		return dateTimestamp;
	}

	public void setDateTimestamp(Timestamp dateTimestamp) {
		this.dateTimestamp = dateTimestamp;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "blogs [pid=" + pid + ", title=" + title + ", content=" + content + ", code=" + code + ", pic=" + pic
				+ ", dateTimestamp=" + dateTimestamp + ", cid=" + cid + ", uid=" + uid + "]";
	}

}
