package com.example.demo.vo;

public class FAQBoardVO {

	private int faq_id;				// FAQ 번호
	private String crt_date;		// FAQ 생성 시간
	private String faq_title;		// FAQ 제목
	private String faq_contents;	// FAQ 내용
	private String faq_category;	// FAQ 분류(카테고리)
	private String user_id;			// UserID (권한 구분)
	public FAQBoardVO() {
	}
	
	public FAQBoardVO(int faq_id, String crt_date, String faq_title, String faq_contents, String faq_category,
			String user_id) {
		super();
		this.faq_id = faq_id;
		this.crt_date = crt_date;
		this.faq_title = faq_title;
		this.faq_contents = faq_contents;
		this.faq_category = faq_category;
		this.user_id = user_id;
	}
	
	public int getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}

	public String getCrt_date() {
		return crt_date;
	}

	public void setCrt_date(String crt_date) {
		this.crt_date = crt_date;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_contents() {
		return faq_contents;
	}

	public void setFaq_contents(String faq_contents) {
		this.faq_contents = faq_contents;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "FAQBoardVO [faq_id=" + faq_id + ", crt_date=" + crt_date + ", faq_title=" + faq_title
				+ ", faq_contents=" + faq_contents + ", faq_category=" + faq_category + ", user_id=" + user_id + "]";
	}
	
}
