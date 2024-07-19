package com.sbs.prueba.domain.exception;

public class DataAlreadyExist extends Exception {
    public DataAlreadyExist() { super(); }
    public DataAlreadyExist(String message) { super(message); }
    public DataAlreadyExist(String message, Throwable cause) { super(message, cause); }
    public DataAlreadyExist(Throwable cause) { super(cause); }
}
