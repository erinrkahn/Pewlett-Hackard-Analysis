# Pewlett Hackard Analysis

## Overview of the Analysis 

### Purpose
The purpose of this analysis is to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. With many employees eligible for retirement, this analysis will support planning for hiring, as well as a proposal for a mentorship program, where retiring employees opt to stay on part-time to mentor new staff. This analysis and included queries utilized the following company information within a SQL database; employee information, department and manager data, and employee salaries and titles.

## Results

### Summary of Findings

* A key step in our first analysis analysis to compile all employees who might be retiring soon was accounting for the fact that some retiring employees have held multiple titles while working at the company. This resulted in multiple duplicate rows for employees, elevating the total number of employees who might be retiring soon. To get an accurate count of employees who might retire soon, we utilized the DISTINCT ON function to only retreive the first occurrence of the employee number. This gave us a result that **41,380** employees might be retiring from the company soon. 

* After retrieving employee and title information from the Employees and Titles table and filtering by birthdate, we were able to see titles for all employees who might be retiring soon. We then used the DISTINCT ON and GROUP BY functions to isolate the retiring employee count for each title. This table indicates that the departments/titles that will potentially be losing the greatest number of employees in the coming years are: Senior Engineer, Senior Staff, Engineer and Staff. These positions should be of focus for the hiring team. 
###### Retiring Employee Count per Title
>![retiring_titles](https://user-images.githubusercontent.com/77405273/111104841-cd940b80-850e-11eb-9301-2432d5adcfe8.png)

* To identify individuals who might participate in the mentorship program, we ran a query on employees who will be retiring soon and will be candidates for the mentorship program based on their birthdate. We utilized the DISTINCT ON function to identify their most recent title to inform their eligibility for the program. This allowed us to get an accurate, big picture view on which titles will be onboarding more individuals due to attrition. 

*  Based on our last query, we can see that **1,549 employees of the 41,380** who might be retiring soon are eligible for the mentorship program. This allows us to narrow down our list and focus on the departments that will be doing the most hiring in the coming months and years. 
###### Mentorship Eligibility List
>![mentorship_eligibility_list](https://user-images.githubusercontent.com/77405273/111104845-cec53880-850e-11eb-84f5-0f636e9b9f43.png)

## Summary

__How many roles will need to be filled as the "silver tsunami" begins to make an impact?__

*

__Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?__

*

#### Additional Considerations

* An additional query that will be helpful to the company is a title count for individuals within the mentorship eligible group. We can see that compared to the retiring employee count per title, they may need to adjust where they have support. There is a higher need for hiring within the positions of Senior Engineer, Senior Staff and Engineer while the top titles of the mentoring group include Senior Staff and Engineer, they may need more mentors within the Senior Engineering group.  
###### Title Count for Mentorship Eligible Group
>![membership_eligibility_title_count](https://user-images.githubusercontent.com/77405273/111104851-cff66580-850e-11eb-96eb-b974af39d17e.png)

* An additional query with relevant information is looking at the mentorship eligible group and identifying individuals who have held certain titles the longest. This is a helpful set of data to designate leaders for each mentor group or establish where more support might be needed. 
###### Mentorship Eligible Group Having Held Titles the Longest
>![mentorship_eligibility_title_term](https://user-images.githubusercontent.com/77405273/111104849-cf5dcf00-850e-11eb-953c-e871e684259e.png)
