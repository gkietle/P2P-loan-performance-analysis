-- Dim Time table
CREATE TABLE Dim_Time (
    time_id INT IDENTITY(1,1) PRIMARY KEY,
    issue_date DATE,
    month INT,
    quarter INT,
    year INT
);

-- Dim Borrower table
CREATE TABLE Dim_Borrower (
    borrower_id INT IDENTITY(1,1) PRIMARY KEY,
    zip_code VARCHAR(255),
    addr_state VARCHAR(255),
    emp_title VARCHAR(255),
    emp_length VARCHAR(255),
    home_ownership VARCHAR(255),
    verification_status VARCHAR(255),
    annual_inc_bin VARCHAR(255),
    annual_inc FLOAT,
    delinq_2yrs FLOAT,
    fico_range_low FLOAT,
    fico_range_high FLOAT,
    open_acc FLOAT,
    total_acc FLOAT,
    revol_bal FLOAT,
    revol_util FLOAT,
    fico_score_bin VARCHAR(255),
    total_bal_ex_mort FLOAT,
    tot_cur_bal FLOAT,
    percent_bc_gt_75 FLOAT,
    num_tl_op_past_12m FLOAT,
    total_rev_hi_lim FLOAT,
    inq_last_6mths FLOAT
);

-- Dim Loan table
CREATE TABLE Dim_Loan (
    loan_id INT IDENTITY(1,1) PRIMARY KEY,
    application_type VARCHAR(255),
    purpose VARCHAR(255),
    loan_amnt FLOAT,
    term VARCHAR(255),
    int_rate FLOAT,
    installment FLOAT,
    grade VARCHAR(255),
    sub_grade VARCHAR(255),
    dti FLOAT,
    int_rate_bin VARCHAR(255),
    dti_bin VARCHAR(255)
);

-- Fact Loan Details table
CREATE TABLE Fact_Loan_Details (
    time_id INT,
    borrower_id INT,
    loan_id INT,
    funded_amnt FLOAT,
    total_pymnt FLOAT,
    total_rec_prncp FLOAT,
    total_rec_int FLOAT,
    loan_status VARCHAR(255),
    ROI FLOAT,
    IRR FLOAT,
    PRIMARY KEY (time_id, borrower_id, loan_id),
    FOREIGN KEY (time_id) REFERENCES Dim_Time(time_id),
    FOREIGN KEY (borrower_id) REFERENCES Dim_Borrower(borrower_id),
    FOREIGN KEY (loan_id) REFERENCES Dim_Loan(loan_id)
);
