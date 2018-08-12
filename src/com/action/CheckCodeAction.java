package com.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Map;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.action.BaseAction;
import com.util.ImageUtil;

/**
 * �л���֤��ͼƬ��
 */
public class CheckCodeAction extends BaseAction{

	private InputStream imageStream;
	
	public String execute(){
		Map<String, BufferedImage> map = ImageUtil.createImage();
		//��ȡ��֤��ͼƬ�ϵ��ַ�
		String key = map.keySet().iterator().next();
		session.put("checkCode", key);
		//��ȡBufferedImage����
		BufferedImage image = map.get(key);
		//��BufferedImage��ֵ��imageStream
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		JPEGImageEncoder imageEncoder = JPEGCodec.createJPEGEncoder(bos);
		try {
			imageEncoder.encode(image);
			byte[] imageBt = bos.toByteArray();
			imageStream = new ByteArrayInputStream(imageBt);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
			
	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}
	
}