package com.poly.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.Account;
import com.poly.entity.Invoice;

public interface InvoiceService {
	List<Invoice> findAll();

	Invoice create(JsonNode invoiceData);
	
	Invoice create(Invoice invoice);
	
	Invoice update(Invoice invoice);

	void deleteById(Integer id);

	Invoice findById(Integer id);

	List<Invoice> findBySeller(Account seller);
	
	List<Invoice> findByBuyer(Account buyer);
}
