/*
-------------- Completeness --------------
---- Total Spcialization 
-->> all types of the parent in childs   |          acount 
                  Vehicle                |            ||
					| |                  |           /  \
			      /  |  \                |      saving   checking
	         Car  Truck  Motorcycle      |

---- Partial Specialization 
-->> one or many of the childs not appear in the childs 
                  Vehicle
					 |
			       /   \
	            Car	  Truck
-- here MotorCycle disapeard cause there is no special attribute for it so the child disappeard and relation became partial 


-------------- Disjointness --------------
---- Disjoint
-->> the parent can be only one role of his chiles 
-->> adding new attribute "type" in parent to determine each of childs to select from 
select * f
from patient 
where type = 'O' -- as O stands for OutPatient
                  Patient
					|
			/-------d-------\
	   OutPatient      ResidentPatient 


-- Overlap 
-->> the parent can act as many roles 
                  Staff
					|
			/-------o-------\
	     Researcher      Teacher

*/