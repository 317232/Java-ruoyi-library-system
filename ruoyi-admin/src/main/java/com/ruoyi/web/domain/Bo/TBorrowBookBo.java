package com.ruoyi.web.domain.Bo;

import com.ruoyi.web.domain.TBorrowBooks;
import lombok.Data;

import java.util.Date;

@Data
public class TBorrowBookBo extends TBorrowBooks {
    private String userName;
    private Date borrowStartTime;
    private Date borrowEndTime;
    private Date startTime;
    private Date EndTime;
    private Date returnStartTime;
    private Date returnEndTime;
}
