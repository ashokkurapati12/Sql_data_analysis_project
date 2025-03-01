use mysql_project;
DROP TABLE IF EXISTS  hospital_data;
SELECT *
FROM hospital_info;
CREATE TABLE hospital_info (
    Hospital_name VARCHAR(50),
    Location VARCHAR(50),
    Department VARCHAR(50),
    Doctors_count INT,
    Patients_count INT,
    Admission_date DATE,
    Discharge_date DATE,
    Medical_expenses FLOAT
)





