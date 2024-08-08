package common;

public class Page {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr = "";

		// 단계 3 : 전체 페이지 수 계산
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

		// 단계 4 : '이전 페이지 블록 바로가기' 출력
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";
		} // [첫 페이지] [이전 블록]
			// ?pageNum=1 // ?pageNum" + (pageTemp-1)

		// 단계 5 : 각 페이지 번호 출력
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) { // 마지막페이지에 게시물이 모자란경우 끝내줘야함
			if (pageTemp == pageNum) {
				// 현재 페이지는 링크를 걸지 않음
				pagingStr += "&nbsp;" + "<span class='current-page'>" + "&nbsp;" + pageTemp + "&nbsp;" + "&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		} // 6 7 8 9 10

		// 단계 6 : '다음 페이지 블록 바로가기' 출력
		if (pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		} // [다음블록] [마지막 페이지]
			// ?pageNum= + pagetemp // ?pageNum= + totalPages
		return pagingStr;
	}
}