package com.poly.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Account;
import com.poly.entity.Publisher;

public interface PublisherDAO extends JpaRepository<Publisher, Integer>{

	Publisher findByAccount(Account account);

}
