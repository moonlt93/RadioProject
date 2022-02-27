package com.radio.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.bmc.ConfigFileReader;
import com.oracle.bmc.Region;
import com.oracle.bmc.auth.ConfigFileAuthenticationDetailsProvider;
import com.oracle.bmc.objectstorage.ObjectStorage;
import com.oracle.bmc.objectstorage.ObjectStorageClient;
import com.oracle.bmc.objectstorage.requests.GetObjectRequest;
import com.oracle.bmc.objectstorage.requests.PutObjectRequest;
import com.oracle.bmc.objectstorage.responses.GetObjectResponse;
import com.oracle.bmc.objectstorage.transfer.UploadConfiguration;
import com.oracle.bmc.objectstorage.transfer.UploadManager;
import com.oracle.bmc.objectstorage.transfer.UploadManager.UploadRequest;
import com.oracle.bmc.objectstorage.transfer.UploadManager.UploadResponse;
import com.radio.domain.VideoVO;
import com.radio.domain.Video_Criteria;
import com.radio.mapper.VideoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Service
@AllArgsConstructor
@Log4j
public class VideoServiceImpl implements VideoService{
	
	@Setter(onMethod_= @Autowired)
	private VideoMapper mapper;
	
	//bucket 
	@Setter(onMethod_= @Autowired)
	private String ociConfigMINPath;
	
	
	//게시물 목록
	@Override
	public List<VideoVO> getList(Video_Criteria cri) {
		return mapper.getList(cri);
	}
	
	
	//게시물 등록
	@Override
	public void register(VideoVO videoVO) {
		mapper.register(videoVO);
		
	}

	//게시물 읽기
	@Override
	public VideoVO read(Long video_bno) {
		mapper.increaseView_cnt(video_bno);
		return mapper.read(video_bno);
	}


	//게시물 수정
	@Override
	public boolean modify(VideoVO videoVO) {
		
		return mapper.modify(videoVO) == 1;
	}


	@Override
	public boolean delete(Long videoVO_bno) {
		
		return mapper.delete(videoVO_bno) == 1;
	}


	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}

	@Override
	public void transfer(MultipartFile file, String fileName) throws Exception {
			String profile = "DEFAULT";

			String objectName = file.getOriginalFilename();
			
			if (fileName != null) {
				objectName = fileName;
			}
			
			String contentType = file.getContentType();
			InputStream is = file.getInputStream();
			long size = file.getSize();

			Map<String, String> metadata = null;
			String contentEncoding = null;
			String contentLanguage = null;

			final ConfigFileReader.ConfigFile configFile = ConfigFileReader.parse(ociConfigMINPath);

			final ConfigFileAuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(
					configFile);

			String namespaceName = configFile.get("namespace_name");
			String bucketName = configFile.get("bucket_name");

			ObjectStorage client = new ObjectStorageClient(provider);
			client.setRegion(Region.AP_SEOUL_1);
			
			//client.setRegion(Region.AP_SEOUL_1);

			// configure upload settings as desired
			UploadConfiguration uploadConfiguration = UploadConfiguration.builder().allowMultipartUploads(true)
					.allowParallelUploads(true).build();

			UploadManager uploadManager = new UploadManager(client, uploadConfiguration);

			PutObjectRequest request = PutObjectRequest.builder().bucketName(bucketName).namespaceName(namespaceName)
					.objectName(objectName).contentType(contentType).contentLanguage(contentLanguage)
					.contentEncoding(contentEncoding).opcMeta(metadata).build();

			UploadRequest uploadDetails = UploadRequest.builder(is, size).allowOverwrite(true).build(request);

			UploadResponse response = uploadManager.upload(uploadDetails);

			// fetch the object just uploaded
			GetObjectResponse getResponse = client.getObject(GetObjectRequest.builder().namespaceName(namespaceName)
					.bucketName(bucketName).objectName(objectName).build());
		}
	
		
	
	
	

	
	
	
	

}