package com.site.notice_board;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.site.vo.Notice_BoardVo;

@Controller
public class Notice_BoardController {

	@Autowired
	private Notice_BoardService notice_boardService;
	
	// 파일저장위치
	@Value("${fileUrlBoard}")
	private String fileUrl;

	// 게시판 글쓰기
	@GetMapping("/notice_board/notice_write")
	public String boardWrite() {
		return "/notice_board/notice_write";
	}

	@PostMapping("/notice_board/notice_write")
	public String boardWrite(Notice_BoardVo notice_boardVo, @RequestPart MultipartFile file) throws Exception {

		// 파일이 첨부가 되어 있으면
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename(); // 원본파일이름 저장
			long time = System.currentTimeMillis();
			// 파일이름
			String uploadFileName = String.format("%d_%s", time, originFileName);
			System.out.println("uploadFileName : " + uploadFileName);

			System.out.println("fileUrl : " + fileUrl);
			// 복사할 파일
			File f = new File(fileUrl + uploadFileName);
			// 파일 업로드
			file.transferTo(f);

			// db에 저장하기 위해 vo에 파일이름을 저장시킴.
			notice_boardVo.setNupload(uploadFileName);
		} else {
			notice_boardVo.setNupload(""); // 사진을 널값 처리
		}
		System.out.println("파일업로드");
		System.out.println(notice_boardVo.getNupload());
		notice_boardService.insertBoardWrite(notice_boardVo);
		return "redirect:/notice_board/notice_list";
	}

	// 게시판 리스트
	@RequestMapping("/notice_board/notice_list")
	public String boardList(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam (defaultValue = "") String category,@RequestParam (defaultValue = "") String category1, @RequestParam @Nullable String searchWord, Model model) {
		System.err.println(category);
		// db에서 모든 게시물 가져옴
		Map<String,Object> map = notice_boardService.selectBoardList(page,category,category1,searchWord);
		model.addAttribute("map", map);
		System.out.println("c_category : " + map.get("category"));
		System.out.println("c_searchWord : " + map.get("searchWord"));
		System.out.println(map.get("listCount"));
		return "/notice_board/notice_list";
	}

	/*
	 * // 게시판 리스트
	 * 
	 * @RequestMapping("search") public String
	 * search(@RequestParam(value="page",defaultValue = "1") int page,
	 * 
	 * @RequestParam String category,@RequestParam String searchWord, Model model) {
	 * //db에서 모든 게시물 가져옴 Map<String, Object> map =
	 * boardService.selectSearch(page,category,searchWord);
	 * model.addAttribute("map",map); return "/board/notice_list"; }
	 */

	// 게시판 뷰
	@RequestMapping("/notice_board/notice_view")
	public String boardView(@RequestParam int id, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {
		// db에서 게시글 1개 가져옴.
		Notice_BoardVo notice_boardVo = notice_boardService.selectBoardView(id);
		System.out.println(id);
		// 이전글
		Notice_BoardVo notice_boardVoPre = notice_boardService.selectBoardViewPre(id);
		// 다음글
		Notice_BoardVo notice_boardVoNext = notice_boardService.selectBoardViewNext(id);
		model.addAttribute("page", page);
		model.addAttribute("notice_boardVo", notice_boardVo);
		model.addAttribute("notice_boardVoPre", notice_boardVoPre);
		model.addAttribute("notice_boardVoNext", notice_boardVoNext);
		return "/notice_board/notice_view";
	}

	// 게시판 수정
	@GetMapping("/notice_board/notice_modify")
	public String boardModify(@RequestParam int id, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {
		// db에서 게시글 1개 가져옴.
		Notice_BoardVo notice_boardVo = notice_boardService.selectBoardView(id);
		model.addAttribute("page", page);
		model.addAttribute("notice_boardVo", notice_boardVo);
		return "/notice_board/notice_modify";
	}

	@PostMapping("/notice_board/notice_modify")
	public String boardModify(Notice_BoardVo notice_boardVo, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestPart MultipartFile file, @RequestParam String old_nupload, Model model) throws Exception {

		// 파일이 첨부가 되어 있으면
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename(); // 원본파일이름 저장
			long time = System.currentTimeMillis();
			// 파일이름
			String uploadFileName = String.format("%d_%s", time, originFileName);
			System.out.println("uploadFileName : " + uploadFileName);

			System.out.println("fileUrl : " + fileUrl);
			// 복사할 파일
			File f = new File(fileUrl + uploadFileName);
			// 파일 업로드
			file.transferTo(f);

			// db에 저장하기 위해 vo에 파일이름을 저장시킴.
			notice_boardVo.setNupload(uploadFileName);
		} else {
			// 파일첨부가 없을때 기존의 이름을 등록.
			notice_boardVo.setNupload(old_nupload);
		}

		// db에서 게시글 1개 가져옴.
		int result = notice_boardService.updateBoardModify(notice_boardVo);
		return "redirect:/notice_board/notice_list?page=" + page;
	}

	// 게시판 삭제
	@RequestMapping("/notice_board/notice_delete")
	public String boardDelete(@RequestParam int id, @RequestParam(value = "page", defaultValue = "1") int page) {

		notice_boardService.deleteBoardDelete(id);
		return "redirect:/notice_board/notice_list?page=" + page;
	}

}
