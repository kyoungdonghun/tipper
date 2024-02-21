package kr.donghun.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.donghun.domain.AttachFileDTO;
import kr.donghun.mapper.AttachFileMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_= {@Autowired})
	private AttachFileMapper attachfilemapper;

	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron = "0 0 2 * * *")
	public void checkFiles() throws Exception{
		log.warn("File Check Task Run...");
		log.warn("=======");
		
		List<AttachFileDTO> fileList = attachfilemapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("/Users/kyoung/myUpload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName())).collect(Collectors.toList());
		
		log.warn("========");

		fileList.stream().filter(vo -> vo.isImage() == true).map(vo -> Paths.get("/Users/kyoung/myUpload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName())).forEach(p -> fileListPaths.add(p));
		
		log.warn("========");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		File targetDir = Paths.get("/Users/kyoung/myUpload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("---------");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
		
		
	}
		
}
