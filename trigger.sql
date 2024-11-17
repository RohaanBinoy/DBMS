-- 2. Design a trigger to automatically update the "LastModified" column.

-- Create a sample table with a "LastModified" column.
CREATE TABLE SampleTable (
    id INT PRIMARY KEY,
    data VARCHAR(100),
    LastModified TIMESTAMP
);

-- Create the trigger.
CREATE OR REPLACE TRIGGER UpdateLastModified
BEFORE UPDATE ON SampleTable
FOR EACH ROW
BEGIN
    :NEW.LastModified := CURRENT_TIMESTAMP;
END;
/