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
import com.oracle.bmc.objectstorage.requests.PutObjectRequest;
import com.oracle.bmc.objectstorage.transfer.UploadConfiguration;
import com.oracle.bmc.objectstorage.transfer.UploadManager;
import com.oracle.bmc.objectstorage.transfer.UploadManager.UploadRequest;
import com.oracle.bmc.objectstorage.transfer.UploadManager.UploadResponse;
import com.radio.domain.PictureRoomVO;
import com.radio.mapper.PictureRoomMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PictureRoomServiceImpl implements PictureRoomService {

	@Setter(onMethod_ = @Autowired)
	private PictureRoomMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private String ociConfigYJPath;

	
	
	@Override
	public void register(PictureRoomVO vo) {
		mapper.insertSelectKey(vo);
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

		final ConfigFileReader.ConfigFile configFile = ConfigFileReader.parse(ociConfigYJPath);

		final ConfigFileAuthenticationDetailsProvider provider = new ConfigFileAuthenticationDetailsProvider(
				configFile);

		String namespaceName = configFile.get("namespace_name");
		String bucketName = configFile.get("bucket_name");

		ObjectStorage client = new ObjectStorageClient(provider);
		client.setRegion(Region.AP_SEOUL_1);

		// configure upload settings as desired
		UploadConfiguration uploadConfiguration = UploadConfiguration.builder().allowMultipartUploads(true)
				.allowParallelUploads(true).build();

		UploadManager uploadManager = new UploadManager(client, uploadConfiguration);

		PutObjectRequest request = PutObjectRequest.builder().bucketName(bucketName).namespaceName(namespaceName)
				.objectName(objectName).contentType(contentType).contentLanguage(contentLanguage)
				.contentEncoding(contentEncoding).opcMeta(metadata).build();

		UploadRequest uploadDetails = UploadRequest.builder(is, size).allowOverwrite(true).build(request);

		UploadResponse response = uploadManager.upload(uploadDetails);
	}

	@Override
	public List<PictureRoomVO> list(Long from, Long length) {
		return mapper.list(from, length);
	}
	
	@Override
	public PictureRoomVO get(Long id) {
		return mapper.selectById(id);
	}
	@Override
	public boolean delete(Long id) {
		return mapper.delete(id) == 1;
	}
	
	@Override
	public boolean modify(PictureRoomVO vo) {
		return mapper.update(vo) == 1;
	}
}
