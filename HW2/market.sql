DROP DATABASE IF EXISTS stock_market;
CREATE DATABASE stock_market;
USE stock_market;
CREATE TABLE stock (
	stock_id INT(100) NOT NULL,
	stock_name VARCHAR(20) NOT NULL,
    stock_lowest_price INT(100) NOT NULL,
    stock_highest_price INT(100) NOT NULL,
    stock_grouth_number INT(100) NOT NULL,
    PRIMARY KEY (stock_id)
);
INSERT INTO stock VALUES ('1','talaei','10','1000','37');
CREATE TABLE company (
    company_number INT(20) NOT NULL,
    company_name VARCHAR(20) NOT NULL,
    manager_name VARCHAR(50) NOT NULL,
    company_phone_number INT(20) NOT NULL,
    company_address VARCHAR(100) NOT NULL,
    company_email VARCHAR(20) NOT NULL,
    company_password VARCHAR(10) NOT NULL,
    company_field VARCHAR(20) NOT NULL,
    stock_id INT(100) NOT NULL,
     PRIMARY KEY (company_number),
    FOREIGN KEY (stock_id) REFERENCES stock (stock_id)
);
INSERT INTO company VALUES ('23324','digikala','akbari','0214456','meidane vanak-khiabane khodami','digikala@gmail.com','123456789','hamechi:)','1');

CREATE TABLE bank_account(
	bank_account_id INT(10) NOT NULL,
    bank_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (bank_account_id)
);
CREATE TABLE history(
	history_time date NOT NULL,
    history_lowest_price INT(100) NOT NULL,
    history_highest_price INT(100) NOT NULL,
     PRIMARY KEY (history_time)
);
INSERT INTO history VALUES ('2021-04-18','20','5000');

CREATE TABLE stock_holder(
	bank_account_id INT(10) NOT NULL,
	stock_holder_id INT(10) NOT NULL,
    stock_holder_first_name VARCHAR(20) NOT NULL,
    stock_holder_last_name VARCHAR(20) NOT NULL,
    stock_holder_phone_number INT(10) NOT NULL,
    stock_holder_email VARCHAR(100) NOT NULL,
    stock_holder_birthday date NOT NULL,
    stock_holder_password VARCHAR(20) NOT NULL,
    stock_holder_address VARCHAR(20) NOT NULL,
    stock_holder_wallet INT(100) NOT NULL,
     PRIMARY KEY (stock_holder_id),
     FOREIGN KEY (bank_account_id) REFERENCES bank_account(bank_account_id)
);

CREATE TABLE demand(
	stock_holder_id INT(10) NOT NULL,
    stock_id INT(100) NOT NULL,
	demand_time date NOT NULL,
    demand_price INT(100) NOT NULL,
    demand_number INT(100) NOT NULL,
    demand_type VARCHAR(20) NOT NULL,
	PRIMARY KEY (stock_holder_id,stock_id),
    FOREIGN KEY (stock_holder_id) REFERENCES stock_holder(stock_holder_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);
CREATE TABLE transfer_in(
	stock_holder_id INT(10) NOT NULL,
    bank_account_id INT(10) NOT NULL,
	transfer_in_time date NOT NULL,
    transfer_in_amount INT(10) NOT NULL,
	PRIMARY KEY (stock_holder_id,bank_account_id),
    FOREIGN KEY (stock_holder_id) REFERENCES stock_holder(stock_holder_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(bank_account_id)
);
CREATE TABLE transfer_out(
	stock_holder_id INT(10) NOT NULL,
	bank_account_id INT(10) NOT NULL,
	transfer_out_time INT(10) NOT NULL,
    transfer_out_amount INT(10) NOT NULL,
	PRIMARY KEY (stock_holder_id,bank_account_id),
    FOREIGN KEY (stock_holder_id) REFERENCES stock_holder(stock_holder_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(bank_account_id)
);
CREATE TABLE buy_stock(
	stock_holder_id INT(10) NOT NULL,
	stock_id INT(100) NOT NULL,
	buy_stock_time date NOT NULL,
    buy_stock_amount INT(10) NOT NULL,
    buy_stock_price INT(10) NOT NULL,
	PRIMARY KEY (stock_holder_id,stock_id),
    FOREIGN KEY (stock_holder_id) REFERENCES stock_holder(stock_holder_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);
CREATE TABLE sell_stock(
    stock_holder_id INT(10) NOT NULL,
	stock_id INT(100) NOT NULL,
	sell_stock_time date NOT NULL,
    sell_stock_amount INT(10) NOT NULL,
    sell_stock_price INT(10) NOT NULL,
	PRIMARY KEY (stock_holder_id,stock_id),
    FOREIGN KEY (stock_holder_id) REFERENCES stock_holder(stock_holder_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);
CREATE TABLE property(
	stock_holder_id INT(10) NOT NULL,
	stock_id INT(100) NOT NULL,
     Percentage_of_ownership INT(10) NOT NULL,
     property_amount INT(10) NOT NULL,
     PRIMARY KEY (stock_holder_id,stock_id),
     FOREIGN KEY (stock_holder_id) REFERENCES stock_holder(stock_holder_id),
     FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
	);
INSERT INTO bank_account VALUES ('1','mellat');