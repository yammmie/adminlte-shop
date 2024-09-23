package com.shopping.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.ProductVO;
import com.shopping.service.CategoryService;
import com.shopping.service.ProductService;
import com.shopping.util.MediaUtils;
import com.shopping.util.PageMaker;
import com.shopping.util.SearchCriteria;
import com.shopping.util.UploadFileUtils;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

	private static final Logger logger = LoggerFactory.getLogger(AdminProductController.class);

	@Inject
	private CategoryService cateService;

	@Inject
	private ProductService proService;

	@Resource(name = "uploadPath")  // servlet-context.xml
	private String uploadPath;  // C:\\Dev\\upload

	// 제품 목록 리스트 (검색 기능 O)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void productList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());

		model.addAttribute("list", proService.productListAll(cri));

		PageMaker pm = new PageMaker();

		pm.setCri(cri);
		pm.setTotalCount(proService.productListCount(cri));

		model.addAttribute("pm", pm);
	}

	// 상품 추가 페이지 요청 (+ 상위 카테고리 목록)
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void productInsert(Model model) throws Exception {
		logger.info("상위 카테고리");

		model.addAttribute("categoryListAll", cateService.categoryListAll());
	}

	// DB 상품 등록
	// 클라이언트로부터 전송된 값과 vo 클래스의 타입 불일치 문제
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String productInsert(ProductVO vo, RedirectAttributes rttr) throws Exception {
		logger.info(vo.toString());

		// 1. 파일 업로드 기능 2. 상품 테이블 저장 기능
		// 파라미터 : 업로드 경로, 파일명, 파일 자체를 의미(byte 배열)
		// 리턴 : 이미지명

		// 1. 파일 업로드 (servlet-context.xml에 등록해놓은 uploadPath에 메인 이미지 파일을 업로드 + 파일 이름을
		// 가져옴)
		vo.setPro_img(UploadFileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1().getBytes()));

		proService.insert(vo);

		return "redirect:/admin/product/list";
	}
	
	// 읽기
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public void productSelect(@ModelAttribute("cri") SearchCriteria cri, int pro_code, Model model) throws Exception {
		model.addAttribute("categoryListAll", cateService.categoryListAll()); // 상위 카테고리 전체 리스트
		
		String cate_prtcode = proService.select(pro_code).getCate_prtcode();
		model.addAttribute("subCategories", cateService.subCategoryListAll(cate_prtcode)); // 상위 카테고리에 해당하는 하위 카테고리 전체 리스트
		
		model.addAttribute(proService.select(pro_code)); // productVO

		PageMaker pm = new PageMaker();
		pm.setCri(cri);

		model.addAttribute("pm", pm);
	}
	
	// 수정 페이지 요청
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void productModifyGET(@ModelAttribute("cri") SearchCriteria cri, int pro_code, Model model) throws Exception {
		model.addAttribute("categoryListAll", cateService.categoryListAll()); // 상위 카테고리 전체 리스트
		
		String cate_prtcode = proService.select(pro_code).getCate_prtcode();
		model.addAttribute("subCategories", cateService.subCategoryListAll(cate_prtcode)); // 상위 카테고리에 해당하는 하위 카테고리 전체 리스트
		
		model.addAttribute(proService.select(pro_code)); // productVO

		PageMaker pm = new PageMaker();
		pm.setCri(cri);

		model.addAttribute("pm", pm);
	}
	
	// DB 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String productModifyPOST(ProductVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		if(vo.getFile1().getSize() > 0)
			vo.setPro_img(UploadFileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1().getBytes()));
		
		logger.info(vo.toString());
		
		proService.modify(vo);
		
		// redirect 주소 요청시 제공되는 파라미터 작업 구문
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		logger.info(cri.toString());
		
		return "redirect:/admin/product/list";
	}
	
	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String productDelete(SearchCriteria cri, int pro_code, String fileName, RedirectAttributes rttr) throws Exception {
		deleteFile(fileName); // 파일 삭제
		
		proService.delete(pro_code); // DB 상품 삭제
		
		// redirect 주소 요청시 제공되는 파라미터 작업 구문
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/list";
	}

	// /categoryListAll/1 → 넘어온 1을 파라미터로 사용 → @PathVariable
	// ResponseEntity : 데이터 + 상태코드 → 2가지 값을 클라이언트에게 리턴하게 됨
	@ResponseBody // Rest 방식을 사용하기 위해서 (@ResponseBody + @Controller = @RestController)
	@RequestMapping(value = "/categoryListAll/{cate_prtcode}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cate_prtcode") String cate_prtcode) {
		logger.info("하위 카테고리");

		ResponseEntity<List<CategoryVO>> entity = null;

		try {
			entity = new ResponseEntity<List<CategoryVO>>(cateService.subCategoryListAll(cate_prtcode), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// ckeditor에서 서버로 이미지 업로드 할 때 사용할 주소 (여기에 있는 MultipartFile upload는 ckeditor에서
	// 사용, insert에 name="file"과 같으면 XXXXX)
	@RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
	public void productImgUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		OutputStream out = null;
		PrintWriter printWriter = null;

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// home.jsp에서 application.getRealPath("/")를 출력한 값 + \\resources\\upload\\ → 고정적인
			// 경로
//			String uploadPath = "C:\\Dev\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\ShoppingMall\\resources\\upload\\"+fileName;

			// 스프링 프로젝트가 배포된 실 운영서버의 물리적 경로를 참조하는 구문
			String uploadPath = req.getSession().getServletContext().getRealPath("/");
			uploadPath = uploadPath + "resources\\upload\\" + fileName;
			out = new FileOutputStream(new File(uploadPath));

			out.write(bytes); // 서버에 업로드

			// 업로드 시킨 파일의 정보를 다시 불러옴
			// 업로드가 된 후 성공적 메시지와 클라이언트 쪽에 관련된 작업 진행을 하는 구문
			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter(); // PrintWriter : 서버에서 클라이언트로 보낼 때 사용
			String fileUrl = "/upload/" + fileName;

//			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//						+ callback
//						+ ",'"
//						+ fileUrl
//						+ "', '이미지를 업로드했습니다'"
//						+ ")</script>");

			// ckeditor 4 api 참조
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");

			printWriter.flush(); // 클라이언트한테 내보냄
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			if (printWriter != null) {
				try {
					printWriter.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	// 업로드 폴더에서 파일정보를 읽어오는 메소드
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + fileName);

		try {

			// "abc.gif" "gif" 파일의 확장자
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			// 이미지 종류의 파일인지 체크
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 데이터의 헤더작업, 부가정보
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName); // 외부 폴더 : C:\\Dev\\upload

			headers.setContentType(mType);

			// IOUtils.toByteArray(in) : commons라이브러리 참조. 파일의 정보를 읽어옴
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}
	
	// 업로드 폴더에서 해당하는 파일을 지우는 메소드
	public void deleteFile(String fileName) {
		logger.info("delete FileName : " + fileName);
		
		String front = fileName.substring(0, 12);
		String end = fileName.substring(14);
		
		//  /2019/08/26/ + e05510df-b909-49df-b549-4a78a234add2_Desert.jpg
		new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete(); // 원본 파일 지우기
		
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete(); // 썸네일 파일 지우기
	}
}
