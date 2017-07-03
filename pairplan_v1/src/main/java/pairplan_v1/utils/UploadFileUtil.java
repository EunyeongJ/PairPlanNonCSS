package pairplan_v1.utils;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtil {

	//에디터에 작성된 이미지 업로드(고유한 파일이름)
	public static String uploadEditorFile(String uploadPath, MultipartFile multipartFile, String uniquePath){
		long now = System.currentTimeMillis();
		Random ranNum = new Random();
		
		String fileName = ranNum.nextInt(50) + "_" + now + "_" + multipartFile.getOriginalFilename();
		
		File directory = new File(uploadPath + uniquePath);
		if(!directory.exists())
			directory.mkdirs();
		
		File file = new File(uploadPath + uniquePath + fileName);
		try {
			multipartFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	//에디터에 작성되지 않은 이미지 파일 삭제
	public static void deleteEditorFile(String uploadPath, String[] images, String uniquePath){
		File directory = new File(uploadPath + uniquePath);
		
		if(directory.exists()){
			File[] files = directory.listFiles();
			
			boolean check;
			for(File file : files){
				check = false;
				for(int i=0; i<images.length; i++){
					if(images[i].indexOf(uniquePath + file.getName())>-1)
						check= true;
				}
				if(!check)
					file.delete();
			}
		}
	}
	
	//해당 디렉토리와 하위 파일을 모두 삭제
	public static void deleteDirectory(String uploadPath, String uniquePath){
		File directory = new File(uploadPath + uniquePath);
		
		if(directory.exists()){
			File[] files = directory.listFiles();
			
			for(File file : files){
				file.delete();
			}
			directory.delete();
		}
	}
	
	//이미지를 해당 폴더에 업로드
	public static void uploadImage(String uploadPath, String uniquePath, MultipartFile multipartFile){
		File directory = new File(uploadPath + uniquePath);
		if(!directory.exists())
			directory.mkdirs();
		
		File file = new File(uploadPath + uniquePath + multipartFile.getOriginalFilename());
		try {
			multipartFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
