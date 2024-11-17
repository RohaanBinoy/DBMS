-- Create the package specification.
CREATE OR REPLACE PACKAGE ProjectAllocation AS
    PROCEDURE AssignEmployeeToProject (
        p_employee_id IN NUMBER,
        p_project_id IN NUMBER
    );
    FUNCTION GetEmployeeProjects (
        p_employee_id IN NUMBER
    ) RETURN SYS_REFCURSOR;
END ProjectAllocation;
/

-- Create the package body.
CREATE OR REPLACE PACKAGE BODY ProjectAllocation AS

    -- Procedure to assign employees to a project.
    PROCEDURE AssignEmployeeToProject (
        p_employee_id IN NUMBER,
        p_project_id IN NUMBER
    ) IS
    BEGIN
        INSERT INTO ProjectAssignments (employee_id, project_id, assigned_date)
        VALUES (p_employee_id, p_project_id, SYSDATE);
    END AssignEmployeeToProject;

    -- Function to retrieve the list of projects for a specific employee.
    FUNCTION GetEmployeeProjects (
        p_employee_id IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        v_projects SYS_REFCURSOR;
    BEGIN
        OPEN v_projects FOR
        SELECT p.project_id, p.project_name, pa.assigned_date
        FROM Projects p
        JOIN ProjectAssignments pa ON p.project_id = pa.project_id
        WHERE pa.employee_id = p_employee_id;
        RETURN v_projects;
    END GetEmployeeProjects;

END ProjectAllocation;
/