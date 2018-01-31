package com.hpe.ov.activator.Services;

import java.io.Serializable;

import java.util.*;


/**
 * @author Code generated using HPSA WebServiceDesigner
 *
 */
public class ReturnTypeActivateServices implements Serializable {
    Long TransactionId;
    Long ErrorCode;
    String Description;

    public Long getTransactionId() {
        return TransactionId;
    }

    public void setTransactionId(Long TransactionId) {
        this.TransactionId = TransactionId;
    }

    public Long getErrorCode() {
        return ErrorCode;
    }

    public void setErrorCode(Long ErrorCode) {
        this.ErrorCode = ErrorCode;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
}
