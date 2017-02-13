CREATE TABLE companies (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = InnoDB;

CREATE TABLE users (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    company_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
) ENGINE = InnoDB;
