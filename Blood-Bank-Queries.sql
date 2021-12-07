
/*1. Looking for Nurses that makes more than 75,000*/
USE donations;
SELECT Fname, Lname, Salary
FROM nurses
WHERE Salary > 75000;

/*2. Ordering patients w/ first and last name priority for blood from High to Low */
USE donations;
SELECT Fname, Lname, Priority
FROM patients
ORDER BY Priority ASC;

/*3. Finding dates when donors donated without any duplicates */
USE donations;
SELECT distinct date_donated
FROM donation_information_sheet;
 
/*4. Using Donor_IDs that donated A+ or A- Red Blood Cells w/ dates */
USE donations;
SELECT Donation_ID, Date_Donated, Blood_Group, B_Components
FROM donation_information_sheet
where Blood_Group= 'A+' AND B_Components = 'Red Blood Cells' OR Blood_Group = 'A-' AND B_Components='Red Blood Cells';

/*5. listing Patients whoose blood that is B+,B-, AB+ and their condition ID*/ 
USE donations;
SELECT Patient_ID, Fname, Lname, Blood_Group, Condition_ID
FROM Patients
WHERE Blood_Group IN ('B+', 'B-', 'AB+');  

 /*6. Looking what patients only need 1 unit of any type of blood*/
 USE donations; 
 SELECT concat(' ', Fname, ' ', Lname) AS 'Patients', Blood_Group, Amount_Needed 
 FROM patients
 WHERE Amount_Needed LIKE '%1%'; 
 
/*7a. Getting the highest blood quantity, order each blood component, and list the blood group and ID from blood_bag table*/
USE donations; 
SELECT BloodBag_ID, B_Components, Blood_Group, MAX(Quantity) AS MaximumQuantity 
FROM blood_bag
GROUP BY B_Components
ORDER BY MAX(Quantity) DESC;

/*7b. Finding the sum of units of blood that was donated*/ 
USE donations; 
SELECT SUM(Amount_donated) AS Total_Donation_Amount
FROM donation_information_sheet; 

/*7c. Counting how many patients have high priority for blood*/ 
USE donations; 
SELECT COUNT(Priority) AS HighPriority_Total
FROM patients
WHERE Priority= 'High';  

/*8. Listing Patients IDs and the dates that getting blood at the same time*/
/*Self Join*/ 
USE donations;  
SELECT a.Patient_ID AS'Patients A', b.Patient_ID AS'Patients B', b.receive_date
FROM patients a, patients b
WHERE a.Patient_ID <> b.Patient_ID AND a.receive_date = b.receive_date
GROUP BY b.receive_date;

/*9. Figuring out the what patient received blood from a certain Nurse by listing the first/last names, IDs and Dates*/ 
/*Inner Join*/
USE donations; 
SELECT concat(' ', c.Fname, ' ', c.Lname) as 'Nurses', c.Nurse_ID, concat(' ', d.Fname,  ' ', d.Lname) as 'Patients', d.Patient_ID, Date_Patients AS Dates
FROM nurses c
INNER JOIN patients d ON c.Date_Patients = d.Receive_Date;

/*10. Listing the Donors that donated anywhere in NY with Address and Blood Bank Location */
/*Outer Join*/
USE donations; 
SELECT concat(' ', e.Fname, ' ', e.Lname) as 'Donors', e.BankLoc_ID, f.Address
FROM donors e
LEFT JOIN blood_bank_location f ON f.BankLoc_ID = e.BankLoc_ID
UNION
SELECT concat(' ', e.Fname, ' ', e.Lname) as 'Donors', e.BankLoc_ID,  f.Address
FROM donors e
Right JOIN blood_bank_location f ON f.BankLoc_ID = e.BankLoc_ID;

/*11. Listing the patient's first/last name, priority, and blood group that needs more than one unit of blood  */
USE donations; 
SELECT concat(' ', Fname, ' ', Lname) as 'patients', Priority, blood_group, amount_needed
FROM patients
GROUP BY Patient_ID 
HAVING amount_needed = '2 Units';
