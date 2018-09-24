package com.exam.mailCalendarChat.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.mailCalendarChat.model.CMBeanForShow;
import com.exam.mailCalendarChat.model.CMBeanForSortable;
import com.exam.mailCalendarChat.model.CMManageBean;
import com.exam.mailCalendarChat.service.CMManageService;

@Controller
public class CMManageController {

	@Autowired
	CMManageService cMManageService;
	
	@RequestMapping(value="CMManage", method=RequestMethod.GET)
	public String goToCMManage(Model model) {
		
		//上船用Bean
		CMManageBean cMManageBean = new CMManageBean();
		model.addAttribute("CMManageBean",cMManageBean);
		//更新用Bean
		CMManageBean uploadCMManageBean = new CMManageBean();
		model.addAttribute("uploadCMManageBean", uploadCMManageBean);
		
		List<CMManageBean> allCMManageBeanList = cMManageService.getAllCMManageBean();
		Map<CMManageBean,Object> allCMManageBeanMap = new HashMap<CMManageBean,Object>();
		
		//取得排序後的所有CMBEAM
		List<CMManageBean> CMBeanForShowForSortableList = cMManageService.getAllCMManageBeanByOrder();
		//準備傳給頁面顯示的LIST
		List<CMBeanForSortable> CMBeanForSortableList = new ArrayList<CMBeanForSortable>();
		
		for(CMManageBean eachBean : allCMManageBeanList) {
			Blob blobTemp = eachBean.getImage();
			byte[] byteTemp;
			try {
				byteTemp = blobTemp.getBytes(1, (int)blobTemp.length());
				String baseImageTemp = Base64.getEncoder().encodeToString(byteTemp);
				allCMManageBeanMap.put(eachBean, baseImageTemp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		model.addAttribute("allCMManageBeanMap",allCMManageBeanMap);
	
		for(CMManageBean eachBean :CMBeanForShowForSortableList) {
			CMBeanForSortable cMBeanForSortable = new CMBeanForSortable();
			cMBeanForSortable.setId(eachBean.getId());
			cMBeanForSortable.setSortNumber(eachBean.getSortNumber());
				Blob blob = eachBean.getImage();
				try {
					byte[]	byteArray = blob.getBytes(1, (int)blob.length());
					String base64String = Base64.getEncoder().encodeToString(byteArray);
					cMBeanForSortable.setBase64image(base64String);
					CMBeanForSortableList.add(cMBeanForSortable);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		model.addAttribute("CMBeanForSortableList",CMBeanForSortableList);
		
		return "mailCalendarChat/CMManage.jsp";
	}
	
	@RequestMapping(value="uploadNewImage",method=RequestMethod.POST)
	public String uploadNewImage(@ModelAttribute("CMManageBean") CMManageBean cMManageBean, RedirectAttributes redirectAttributes) {
		
//		System.out.println("===" + cMManageBean);
//		System.out.println("title :" + cMManageBean.getTitle() );
//		System.out.println("description :" + cMManageBean.getDescription() );
//		System.out.println("URL :" + cMManageBean.getWebURL());
//		System.out.println("Blob :" + cMManageBean.getImage());
//		System.out.println("getUploadImage" + cMManageBean.getUploadImage());
		
		if(cMManageBean.getSortNumber()==0) {
			cMManageBean.setSortNumber(1);
		}
		
		if(cMManageBean.getTitle()==null || cMManageBean.getTitle()=="" || cMManageBean.getTitle().isEmpty()) {
			cMManageBean.setTitle("NoTitle");
		}
		
		if(cMManageBean.getDescription() ==null|| cMManageBean.getDescription()=="" || cMManageBean.getDescription().isEmpty()) {
			cMManageBean.setDescription("NoDescription");
		}
		
		if(cMManageBean.getLinkURL() ==null|| cMManageBean.getLinkURL()=="" || cMManageBean.getLinkURL().isEmpty()) {
			cMManageBean.setLinkURL("#");
		}
		
		MultipartFile uploadImage = cMManageBean.getUploadImage();
		cMManageBean.setImageName(uploadImage.getOriginalFilename());
		
		
		if(uploadImage != null && !uploadImage.isEmpty()) {
			try {
				byte[] uploadImageByte =uploadImage.getBytes();
				Blob uploadImageBlob = new SerialBlob(uploadImageByte);
				cMManageBean.setImage(uploadImageBlob);
				cMManageService.insertCMManageBean(cMManageBean);
				redirectAttributes.addFlashAttribute("error", "上傳成功!");
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "圖片上傳異常!");
				e.printStackTrace();
			}
		}else {
			redirectAttributes.addFlashAttribute("error", "圖片上傳異常!");
		}

//		//  將上傳的檔案移到指定的資料夾
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists()) imageFolder.mkdirs();
//			File file = new File(imageFolder, bb.getBookId() + ext);
//			productImage.transferTo(file);
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
//		//  建立Blob物件，交由 Hibernate 寫入資料庫
//		if (productImage != null && !productImage.isEmpty() ) {
//			try {
//				byte[] b = productImage.getBytes();
//				Blob blob = new SerialBlob(b);
//				bb.setCoverImage(blob);
//			} catch(Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
//		
//		bb.setStock(0);
//		productService.addProduct(bb);
//		
//	//  將上傳的檔案移到指定的資料夾
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists()) imageFolder.mkdirs();
//			File file = new File(imageFolder, bb.getBookId() + ext);
//			productImage.transferTo(file);
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		
		return "redirect:CMManage";
	}
	
	
	@RequestMapping(value="updateImage",method=RequestMethod.POST)
	public String updateImage(@ModelAttribute("uploadCMManageBean") CMManageBean updateCMManageBean,Model model, RedirectAttributes redirectAttributes) {
	
		
		if(updateCMManageBean.getTitle()==null || updateCMManageBean.getTitle()=="") {
			updateCMManageBean.setTitle("NoTitle");
		}
		
		if(updateCMManageBean.getDescription() ==null|| updateCMManageBean.getDescription()=="") {
			updateCMManageBean.setDescription("NoDescription");
		}
		
		if(updateCMManageBean.getLinkURL() ==null|| updateCMManageBean.getLinkURL()=="") {
			updateCMManageBean.setLinkURL("#");
		}
		
		
		int id=updateCMManageBean.getId();
		String title = updateCMManageBean.getTitle();
		String description = updateCMManageBean.getDescription();
		String linkURL = updateCMManageBean.getLinkURL();
		int sortNumber = updateCMManageBean.getSortNumber();
//		System.out.println("===BEAN id: " + id);
		
		MultipartFile updateImage = updateCMManageBean.getUploadImage();
//		System.out.println("***********圖片存在嗎? " + !updateImage.isEmpty() );
		if(updateImage != null && !updateImage.isEmpty()) {
			try {
				
				String imageName = updateImage.getOriginalFilename();
				
				byte[] byteUpdateImage = updateImage.getBytes();
				Blob blobUpdateImage = new SerialBlob(byteUpdateImage);
				updateCMManageBean.setImage(blobUpdateImage);
				Blob image = updateCMManageBean.getImage();
				
				cMManageService.updateCMManageBean(id, imageName, image, linkURL, title, description, sortNumber);
				redirectAttributes.addFlashAttribute("error", "已更新!");
			} catch (Exception e) {
//				System.out.println("---------------THIS is EXCEPTION" );
				redirectAttributes.addFlashAttribute("error", "圖片上傳異常!");
				e.printStackTrace();
			}
		}else {
//			System.out.println("-----------------THIS is ELSE" );
			CMManageBean exsistBean= cMManageService.getCMManageBeanById(id);
			Blob exsistBeanBlobImage=exsistBean.getImage();
			String exsistBeanImageName= exsistBean.getImageName();
			cMManageService.updateCMManageBean(id, exsistBeanImageName, exsistBeanBlobImage, linkURL, title, description, sortNumber);
			redirectAttributes.addFlashAttribute("error", "已更新!");
		}
		
		return "redirect:CMManage";
	}
	
	@RequestMapping(value="deleteImage")
	public String deleteImage(HttpServletRequest request) {
		
			System.out.println("URI================" + request.getRequestURI());
			System.out.println("Stringid=====" + request.getParameter("deleteId"));
			
			String stringId = request.getParameter("deleteId");
			try {
				int id = Integer.valueOf(stringId);
				cMManageService.deleteCMManageBean(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:CMManage";
	}
	
	@RequestMapping(value="updateCMManageBeanSortNumber")
	public String updateCMManageBeanSortNumber(@RequestParam("id") int id, @RequestParam("sortNumber") int sortNumber) {
//		System.out.println("==id :" + id);
//		System.out.println("==sortNumber" + sortNumber);
		cMManageService.updateCMManageBeanSortNumber(id, sortNumber);
		return "CMManage";
	}
	
	
	@RequestMapping(value="CMSlider")
	public String goCMSlider(Model model) {
		
		List<CMManageBean> allCMManageBeanSotredList= cMManageService.getAllCMManageBeanByOrder();
		List<CMBeanForShow> allCMBeanForShowList = new ArrayList<CMBeanForShow>();
		
		for(CMManageBean eachBean : allCMManageBeanSotredList) {
			
			CMBeanForShow cMBeanForShow = new CMBeanForShow();
			cMBeanForShow.setTitle(eachBean.getTitle());
			cMBeanForShow.setLinkURL(eachBean.getLinkURL());
			Blob blobTemp = eachBean.getImage();
			
			if(blobTemp != null) {
				try {
					byte[] byteTemp = blobTemp.getBytes(1, (int)blobTemp.length());
					String stringTemp = Base64.getEncoder().encodeToString(byteTemp);
					cMBeanForShow.setBase64image(stringTemp);
					allCMBeanForShowList.add(cMBeanForShow);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		model.addAttribute("allCMBeanForShowList",allCMBeanForShowList);
		
		return "mailCalendarChat/CMSlider.jsp";
	}
	
}
