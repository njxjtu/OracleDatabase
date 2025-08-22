-- In a table, there is a column of clob type which stores a xml file with person information.

SELECT
    x.first_name,
    x.last_name,
    x.city
FROM
    TABLE_NAME t,
    XMLTABLE(
        XMLNAMESPACES(
            'http://www.example.com/schema/UCRecord' AS "ns1",
            'http://www.example.com/Application' AS "AdmApp"
        ),
        '/ns1:UCRecords/Person'
        PASSING XMLTYPE(t.clob_column)
        COLUMNS
            first_name VARCHAR2(100) PATH 'Name/FirstName',
            last_name  VARCHAR2(100) PATH 'Name/LastName',
            city       VARCHAR2(100) PATH 'Contacts/PermanentAddress/City'
    ) x
WHERE t.clob_column IS NOT NULL;
