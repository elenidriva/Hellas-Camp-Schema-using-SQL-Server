SET DATEFORMAT dmy; 
BULK INSERT mainTable
 FROM 'C:\Users\ele_1\Documents\Mathimata\Σχεδιασμός Βάσεων Δεδομένων\2η εργασία\GeneratedData.txt'
WITH (FIRSTROW = 2,FIELDTERMINATOR= ',', ROWTERMINATOR = '\n');