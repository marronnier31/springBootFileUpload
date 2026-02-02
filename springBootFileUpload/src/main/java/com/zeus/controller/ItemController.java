package com.zeus.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zeus.domain.Item;
import com.zeus.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
@MapperScan(basePackages = "com.zeus.mapper")
public class ItemController {
	@Autowired
	private ItemService itemService;

	// application.properties에서 upload.path에 저장된 값을 주입
	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/createForm")
	public String itemCreateForm() {
		log.info("createForm");
		return "item/createForm";
	}

	@PostMapping("/create")
	public String itemCreate(Item item, Model model) throws IOException, Exception {
		log.info("create item = " + item.toString());
		// 1. 파일 업로드한 것을 가져온다.
		MultipartFile file = item.getPicture();
		// 2. 파일정보를 로그파일에 기록
		log.info("originalName: " + file.getOriginalFilename());
		log.info("size: " + file.getSize());
		log.info("contentType: " + file.getContentType());
		// 3. 파일을 외장하드에 저장
		String createdFileName = uploadFile(file.getOriginalFilename(), file.getBytes());
		// 4. 저장된 새로운 생성된 파일명을 item 도메인에 저장
		item.setUrl(createdFileName);
		// 5. 테이블에 상품화면정보를 저장
		int count = itemService.create(item);
		if (count > 0) {
			model.addAttribute("message", "%s 상품등록이 성공되었습니다.".formatted(file.getOriginalFilename()));
			return "item/success";
		}
		model.addAttribute("message", "%s 상품등록이 실패되었습니다.".formatted(file.getOriginalFilename()));
		return "item/failed";
	}

	@GetMapping("/itemList")
	public void itemList(Model model) throws Exception {
		List<Item> itemList = itemService.list();
		model.addAttribute("itemList", itemList);
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 절대 중복되지 않는 문자열 생성
		UUID uid = UUID.randomUUID();
		// 0aecc135-a28c-41d1-8b81-bfb71ac36f4e_우림.jpg
		String createdFileName = uid.toString() + "_" + originalName;
		// new File("D:/upload", "0aecc135-a28c-41d1-8b81-bfb71ac36f4e_우림.jpg")
		// D:/upload/0aecc135-a28c-41d1-8b81-bfb71ac36f4e_우림.jpg 내용이 없는 파일명만 생성
		File target = new File(uploadPath, createdFileName);
		// (파일내용이 있는 바이트배열)byte[] fileData을
		// D:/upload/0aecc135-a28c-41d1-8b81-bfb71ac36f4e_우림.jpd에 복사진행
		FileCopyUtils.copy(fileData, target);
		return createdFileName;
	}

}
