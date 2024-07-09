package com.resfes.trustscore.service;

import com.resfes.trustscore.model.PDFInfo;
import org.springframework.data.domain.Page;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface FileService {
    void mergeJsonFiles() throws IOException;
    boolean checkKey(String key);
    void transformAndWriteLinks();
    Page<PDFInfo> findPdfFiles(String query, String directoryPath, int page, int size) throws IOException ;
    List<PDFInfo> find3NewestFiles (String directoryPath) throws IOException;
    String getPdfFilePath(String fileName);
    Optional<PDFInfo> findPdfFile(String fileName);
}
