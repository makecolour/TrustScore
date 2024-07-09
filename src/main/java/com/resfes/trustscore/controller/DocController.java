package com.resfes.trustscore.controller;

import com.resfes.trustscore.model.PDFInfo;
import com.resfes.trustscore.service.FileService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;
import java.util.Optional;


@AllArgsConstructor
@Controller
@RequestMapping("/documents")
public class DocController {
    private final FileService fileService;
    private final ResourceLoader resourceLoader;

    @RequestMapping("/list")
    ModelAndView list(HttpSession session, @RequestParam(value = "q", required = false, defaultValue = "") String query, @RequestParam(value = "page", defaultValue = "0") int page, @RequestParam(value = "size", defaultValue = "9") int size) {
        ModelAndView modelAndView = new ModelAndView("doc-list");
        Page<PDFInfo> files = null;
        List<PDFInfo> newest3 = null;
        try {
            files = fileService.findPdfFiles(query, "", page, size);
            newest3 = fileService.find3NewestFiles("");
            modelAndView.addObject("files", files.getContent());
            modelAndView.addObject("totalPages", files.getTotalPages());
            modelAndView.addObject("currentPage", files.getNumber());
            modelAndView.addObject("newest", newest3);
            //newest3.forEach(System.out::println);
            session.setAttribute("query", query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping("/")
    ModelAndView viewDocument(@RequestParam("path") String path) {
        ModelAndView modelAndView = new ModelAndView("document");
        modelAndView.addObject("path", path);
        return modelAndView;
    }
    @RequestMapping("/viewPdf")
    public ModelAndView viewPdf(@PathVariable @RequestParam String fileName) {
        ModelAndView modelAndView = new ModelAndView("test");
        String pdfPath = fileService.getPdfFilePath(fileName);
        modelAndView.addObject("pdfPath", pdfPath);
        return modelAndView;
    }

    @GetMapping("/pdf/{fileName:.+}")
    public ResponseEntity<Resource> downloadPdf(@PathVariable String fileName) throws IOException {
        Resource resource = resourceLoader.getResource(fileService.getPdfFilePath(fileName));
        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @GetMapping("/view")
    public ModelAndView view(@RequestParam @PathVariable String fileName) {
        ModelAndView modelAndView = new ModelAndView("document");
        Optional<PDFInfo> pdfInfo = null;
        String pdfPath = "";
        List<PDFInfo> newest3 = null;
        try{
            pdfInfo = fileService.findPdfFile(fileName);
            pdfPath = fileService.getPdfFilePath(fileName);
            newest3 = fileService.find3NewestFiles("");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(pdfInfo.isEmpty()) {
            throw new RuntimeException("File not found");
        }
        modelAndView.addObject("pdfInfo", pdfInfo.get());
        modelAndView.addObject("pdfPath", pdfPath);
        modelAndView.addObject("newest", newest3);
        return modelAndView;
    }
}
