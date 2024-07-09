package com.resfes.trustscore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PDFInfo {
    private String fileName;
    private double size;
    private String path;
    private Date lastModified;
    private String thumbnailPath;
}
