-- 2. PL/SQL block using a cursor to fetch and display employee names from a specific department.

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_name
        FROM Employee
        WHERE department_id = 10; -- Replace with the specific department ID.
    v_employee_name Employee.employee_name%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_employee_name;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_name);
    END LOOP;
    CLOSE emp_cursor;
END;
/
