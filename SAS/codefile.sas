/* importing external data into sas */

/* Access Data  */
%Let path = /home/u63253701/ECRB94/data;
libname tsa  "&path";
 
options validvarname=v7;
proc import datafile="&path/TSAClaims2002_2017.csv"
	out=tsa.claims_cleaned 
	dbms=csv 
	replace;
	guessingrows = max;
	delimiter=",";
run;



/* Explore Data  */

proc print data=tsa.claims_cleaned(obs=500);
run;

proc contents data=tsa.claims_cleaned;
run;

proc sort data=tsa.claims_cleaned out=sorted_tsa nodup;
	by _all_;
run;


proc freq data=tsa.claims_cleaned;
	tables Claim_Type Claim_Site Disposition  / nocol norow nopercent;
run;

/* Prepare Data  */

data tsa.claims_cleaned_1;
	set tsa.claims_cleaned;
	if Claim_Type in ("-", " ") then Claim_Type = 'Unknown';
	if Claim_Type = "Passenger Property Loss" 
		or Claim_Type = "Passenger Property Loss/Personal Injur"
		or Claim_Type = "Passenger Property Loss/Personal Injury"
		then Claim_Type = "Passenger Property Loss";
	if Claim_Type = "Property Damage" 
		or Claim_Type = "Property Damage/Personal Injury" 
		then Claim_Type = "Property Damage";
	if Claim_Site in ("-"," ") then Claim_Site = 'Unknown';
	if Disposition in ("-"," ") then Disposition = 'Unknown';
	if Disposition in ("Closed: Canceled", "Closed:Canceled") 
		then Disposition = "Closed:Canceled";
	if Disposition in ("Closed:Contractor Claim", "losed: Contractor Claim") 
		then Disposition = "Closed:Contractor Claim";
	StateName = PROPCASE(StateName);
	State = UPCASE(State);
	if  Incident_Date = . or Date_Received = . then Date_Issues = "Needs Review";
	if year(Incident_Date)<2002 or year(Incident_Date)>2017 then Date_Issues = "Needs Review";
	if year(Date_Received)<2002 or year(Date_Received)>2017  then Date_Issues = "Needs Review";
	if Incident_Date > Date_Received then Date_Issues = "Needs Review";
	Incident_Year = year(Incident_Date);
	drop County City;
	format Incident_Date Date_Received date9. Close_Amount dollar12.2 ;
	label   Claim_number = "claim number"
		    Airport_Name =	"Airport Name"
			Claim_Site = "Claim Site"
			Claim_Type	= "Claim Type"
			Close_Amount =	"Close Amount"
			Date_Received =	"Date Received"
			Incident_Date = "Incident Date"
			Item_Category = "Item Category";
run;



proc sort data=	tsa.claims_cleaned_1 out=tsa_sort;
	by Incident_Date;
run;


/* Analyze Data & Export Data */

ods pdf file="/home/u63253701/ECRB94_2/final.pdf" startpage=no pdftoc=1;
ods noproctitle;
ods proclabel "Date Issues";
	title1 "Number of Date Issues";
	proc freq data=tsa_sort;
		table Date_Issues / nocol norow nopercent;
	run;
	
ods graphics on;
ods proclabel "Claims Per year";
	title2 "Incident claims per year";
	proc freq data=tsa_sort;
		table  Incident_Year  / nocol norow nopercent nocum plots=freqplot;
		where Date_Issues not contains "Needs Review";
	run;

%Let n_State = HI;	
ods proclabel "&n_State Claim Claim Site and Dispositin per year";
	proc freq data=tsa_sort;
	title "Frequecy for claim type  based on &n_State State";
		tables Claim_Type Claim_Site Disposition /nocol norow nocum nopercent;
		where State = "&n_State" and Date_Issues not contains "Needs Review";
	run;

ods proclabel "&n_State Summary Statistics for Closed Amount";
	proc means data=tsa_sort mean min max sum maxdec=0;
	title "Summary Statistics for Closed Amount  based on &n_State State";
		var  Close_Amount;
		where State = "&n_State" and  Date_Issues not contains "Needs Review";
	run;
ods pdf close;
		
	
	





