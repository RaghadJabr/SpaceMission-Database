CREATE LOGIN Admin 
WITH PASSWORD = 'CEO@1234';
CREATE USER AgencyAdministrator FOR LOGIN Admin;
GRANT ALL ON PreviousMissions TO AgencyAdministrator;
GRANT ALL ON Voter TO AgencyAdministrator;
GRANT ALL ON Agency TO AgencyAdministrator;
GRANT ALL ON AgencyPreMissions TO AgencyAdministrator;
GRANT ALL ON Astronaut_PhoneNumber TO AgencyAdministrator;
GRANT ALL ON Selected TO AgencyAdministrator;
GRANT ALL ON Astronaut TO AgencyAdministrator;
GRANT ALL ON Astro_experience TO AgencyAdministrator;
GRANT ALL ON Agency_Mission_Data TO AgencyAdministrator;
GRANT EXECUTE ON OBJECT::EditingMissionDescription TO AgencyAdministrator;
GRANT EXECUTE ON OBJECT::HireAstronaut TO AgencyAdministrator;

CREATE LOGIN Voter
WITH PASSWORD = 'VOTER@1234';
CREATE USER Employee FOR LOGIN Voter;
GRANT SELECT, INSERT, UPDATE ON Voter TO Employee;
GRANT SELECT ON Astro_experience TO Employee;
GRANT SELECT, INSERT, UPDATE ON Selected TO Employee;
Select * from Astro_experience;

CREATE LOGIN Astronaut
WITH PASSWORD = 'Astro@1234';
CREATE USER Astro FOR LOGIN Astronaut;
GRANT SELECT, INSERT, UPDATE ON Astronaut TO Astro;
GRANT ALL ON Astronaut_PhoneNumber TO Astro;

CREATE LOGIN ResearchScientist 
WITH PASSWORD = 'RS@1234';
CREATE USER Scientist FOR LOGIN ResearchScientist;
GRANT ALL ON PreviousMissions TO Scientist;
GRANT ALL ON Agency_Mission_Data TO Scientist;
GRANT ALL ON AgencyPreMissions TO Scientist;
GRANT EXECUTE ON OBJECT::EditingMissionDescription TO Scientist;

CREATE LOGIN PR
WITH PASSWORD = 'PR@1234';
CREATE USER PublicRelation FOR LOGIN PR;
GRANT SELECT, INSERT, UPDATE ON Agency TO PublicRelation;
GRANT SELECT, INSERT, UPDATE ON Astronaut TO PublicRelation;
GRANT SELECT, INSERT, UPDATE ON Voter TO PublicRelation;
GRANT SELECT, INSERT, UPDATE ON Selected TO PublicRelation;
GRANT SELECT, INSERT, UPDATE ON Astronaut_PhoneNumber TO PublicRelation;
GRANT SELECT, INSERT, UPDATE ON Astro_experience TO PublicRelation;


