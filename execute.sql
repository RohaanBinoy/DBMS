CREATE OR REPLACE PROCEDURE CalculateAverage (
    p_table_name IN VARCHAR2,
    p_column_name IN VARCHAR2
) AS
    v_sql       VARCHAR2(1000);  -- Variable to hold dynamic SQL
    v_avg_value NUMBER;          -- Variable to store the calculated average
BEGIN
    -- Construct the dynamic SQL to calculate the average
    v_sql := 'SELECT AVG(' || p_column_name || ') INTO :v_avg_value FROM ' || p_table_name;

    -- Execute the dynamic SQL using EXECUTE IMMEDIATE
    EXECUTE IMMEDIATE v_sql INTO v_avg_value;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('The average of column "' || p_column_name || 
                         '" in table "' || p_table_name || '" is: ' || v_avg_value);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END CalculateAverage;
/
