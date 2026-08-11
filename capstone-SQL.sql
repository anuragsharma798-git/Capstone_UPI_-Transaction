create schema Capstone;
use Capstone;

-- Customer master info
CREATE TABLE customer_master (
    customer_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(15) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    gender VARCHAR(10),
    region VARCHAR(20),
    date_joined DATE NOT NULL,
    is_business_user BOOLEAN,
    risk_score DECIMAL(3,2) CHECK (risk_score BETWEEN 0 AND 1)
);

-- UPI account info
CREATE TABLE upi_account_details (
    upi_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    bank_name VARCHAR(50),
    account_type VARCHAR(20),
    date_added DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES customer_master(customer_id)
);

-- Device info
CREATE TABLE device_info (
    device_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    device_type VARCHAR(30),
    app_version VARCHAR(20),
    is_rooted BOOLEAN,
    last_active TIME,
    FOREIGN KEY (customer_id)
        REFERENCES customer_master(customer_id)
);

-- 4. Merchant Information
CREATE TABLE merchant_info (
    merchant_id VARCHAR(20) PRIMARY KEY,
    merchant_name VARCHAR(100) NOT NULL,
    merchant_type VARCHAR(30),
    region VARCHAR(20),
    onboard_date DATE,
    risk_score DECIMAL(3,2) CHECK (risk_score BETWEEN 0 AND 1)
);

-- 5. UPI Transaction History
CREATE TABLE upi_transaction_history (
    transaction_id VARCHAR(20) PRIMARY KEY,
    upi_id VARCHAR(50) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    transaction_time TIME,
    amount DECIMAL(12,2) CHECK (amount > 0),
    transaction_type VARCHAR(20),
    merchant_id VARCHAR(20),
    counterparty_upi VARCHAR(50),
    status VARCHAR(20),
    device_id VARCHAR(20),
    device_type VARCHAR(30),
    channel VARCHAR(20),
    fraud_flag BOOLEAN,
    reversal_flag BOOLEAN,
    failure_reason VARCHAR(255),

    FOREIGN KEY (upi_id)
        REFERENCES upi_account_details(upi_id),

    FOREIGN KEY (customer_id)
        REFERENCES customer_master(customer_id),

    FOREIGN KEY (merchant_id)
        REFERENCES merchant_info(merchant_id),

    FOREIGN KEY (device_id)
        REFERENCES device_info(device_id)
);

-- 6. Fraud Alert History
CREATE TABLE fraud_alert_history (
    alert_id VARCHAR(20) PRIMARY KEY,
    transaction_id VARCHAR(20) NOT NULL,
    alert_type VARCHAR(50),
    alert_date TIME,
    resolved BOOLEAN,
    resolution_date TIME,
    remarks VARCHAR(255),

    FOREIGN KEY (transaction_id)
        REFERENCES upi_transaction_history(transaction_id)
);

-- 7. Customer Feedback Surveys
CREATE TABLE customer_feedback_surveys (
    feedback_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    date_submitted DATE,
    feedback_text TEXT,
    satisfaction_score INT CHECK (satisfaction_score BETWEEN 1 AND 5),
    issue_type VARCHAR(50),
    resolved BOOLEAN,

    FOREIGN KEY (customer_id)
        REFERENCES customer_master(customer_id)
);

-- Load the Excel or CSV datasets into their respective SQL tables. 

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_master.csv"
INTO TABLE customer_master
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_feedback_surveys.csv"
INTO TABLE customer_feedback_surveys
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/device_info.csv"
INTO TABLE device_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fraud_alert_history.csv"
INTO TABLE fraud_alert_history
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/upi_transaction_history.csv'
INTO TABLE upi_transaction_history
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
transaction_id,
upi_id,
customer_id,
amount,
transaction_type,
@merchant_id,
status,
device_id,
device_type,
channel,
fraud_flag,
reversal_flag
)
SET merchant_id = NULLIF(@merchant_id,'');

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/upi_account_details.csv"
INTO TABLE upi_account_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/merchant_info.csv"
INTO TABLE merchant_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Row counts across tables 

SELECT 'customer_master' AS table_name, COUNT(*) AS row_count
FROM customer_master

UNION ALL

SELECT 'merchant_info', COUNT(*)
FROM merchant_info

UNION ALL

SELECT 'device_info', COUNT(*)
FROM device_info

UNION ALL

SELECT 'upi_account_details', COUNT(*)
FROM upi_account_details

UNION ALL

SELECT 'upi_transaction_history', COUNT(*)
FROM upi_transaction_history

UNION ALL

SELECT 'fraud_alert_history', COUNT(*)
FROM fraud_alert_history

UNION ALL

SELECT 'customer_feedback_surveys', COUNT(*)
FROM customer_feedback_surveys;

-- Random spot checks for correct field mapping

SELECT *FROM customer_master LIMIT 5;

-- Consistency of foreign key relationships after loading 

SELECT COUNT(*) AS invalid_customer_refs
FROM upi_transaction_history t
LEFT JOIN customer_master c
ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SHOW DATABASES;

USE capstone;
SHOW TABLES;