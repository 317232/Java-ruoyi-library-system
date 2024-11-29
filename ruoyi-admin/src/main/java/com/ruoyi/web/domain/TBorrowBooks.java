package com.ruoyi.web.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TBorrowBooks {
    private Integer id;

    private Integer cardId;

    private Integer bookId;

    private Date borrowDate;

    private Date endDate;

    private Date returnDate;

    private String illegal;

    private String status;
}