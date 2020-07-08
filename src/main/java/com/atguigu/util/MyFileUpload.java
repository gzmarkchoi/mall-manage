package com.atguigu.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MyFileUpload {

	public static List<String> uploadImages(MultipartFile[] files) {
		String path = MyPropertyUtil.getProperty("myUpload.properties", "windows_path");
		List<String> listImages = new ArrayList<>();

		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				String originalFileName = files[i].getOriginalFilename();

				// UUID randomUUID = UUID.randomUUID();
				String name = System.currentTimeMillis() + originalFileName;
				String uploadName = path + "/" + name;
				try {
					files[i].transferTo(new File(uploadName));
					listImages.add(name);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return listImages;
	}

}
