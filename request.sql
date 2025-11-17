SELECT
  employee.id,
  employee.first_name,
  employee.last_name
FROM
  employee
  LEFT JOIN team on employee.id_team = team.id
WHERE
  employee.id_team is null;

SELECT
  employee.id,
  employee.first_name,
  employee.last_name
FROM
  employee
  LEFT JOIN leave on employee.id = leave.id_employee
WHERE
  leave.id is null;

SELECT
  leave.id,
  leave.start_date,
  leave.end_date,
  employee.last_name,
  employee.first_name,
  team.name
FROM
  employee
  JOIN leave on employee.id = leave.id_employee
  JOIN team on employee.id_team = team.id;

SELECT
  employee.contract_type,
  count(employee.id) AS employee_count
FROM
  employee
GROUP BY
  employee.contract_type;

SELECT
  count(employee.id) AS employee_count
FROM
  employee
  JOIN leave on employee.id = leave.id_employee
WHERE
  CURRENT_DATE BETWEEN start_date
  AND end_date;

SELECT
  employee.id,
  employee.last_name,
  employee.first_name,
  team.name as team_name
FROM
  employee
  JOIN team on employee.id_team = team.id
  JOIN leave on employee.id = leave.id_employee
WHERE
  CURRENT_DATE BETWEEN start_date
  AND end_date;