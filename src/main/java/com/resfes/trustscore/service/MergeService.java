package com.resfes.trustscore.service;

import java.io.IOException;

public interface MergeService {
    void mergeJsonFiles() throws IOException;
    boolean checkKey(String key);
    void transformAndWriteLinks();
}
