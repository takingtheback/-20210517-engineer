package com.side_on.dto;
import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CriteriaRc {
	//페이지 정보, 페이지 크기 정보를 저장하는 객체
		private int page;
		private int pageSize;
		
		public CriteriaRc() {
			this.page = 1;
			this.pageSize = 10;
		}

		public int getPage() {
			return page;
		}

		public void setPage(int page) {
			if(page <=0) {
				this.page = 1;
				return;
			}
			this.page = page;
		}

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			if(pageSize <=0 || pageSize > 100) {
				this.pageSize = 10;			
				return;
			}
			this.pageSize = pageSize;			
		}
		
		//페이징처리 시작하는 값생성
		//멤버변수가 아니지만 gettet와 setter를 생성하면 Mapper에서 접근가능하다.
		//Mapper에서 사용하는 법 #{pageStart}
		public int getPageStart() {
			return (this.page - 1)*this.pageSize;
		}
		
		//toString()
		@Override
		public String toString() {
			return "CriteriaRc [page=" + page + ", pageSize=" + pageSize + "]";
		}
}
