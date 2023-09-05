/* Access Data  */

/* Create a file path to help import the dataset  */

%Let path = /home/u63253701/Medical Project/Data;

/* Create a libanme to file output the imported dataset */

libname  outset "/home/u63253701/Medical Project/output";

/* Imports the medical appoinments dataset using ;
	proc import*/
proc import datafile="&path/Medical.csv" dbms=csv out= outset.Med_data;
	guessingrows= max;
run;

/*Check the contents of medical appointment dataset */
proc contents data=outset.med_data;
run;

/*  */

/* Exploring and Analyzing Data */
/*Check for missing values  */

proc means data=outset.med_data NMISS N; 
run;

/* rename some columns and changing category to numeric  */

Data outset.med_data1 (rename=('No-show'n=Show Hipertension=Hypertension));
	set outset.med_data;
run;



/* changing category to numeric  */

data outset.med_data2;
	set outset.med_data1;
	if show = 'No' then Show = "Yes";
	else if show = 'Yes' then Show = "No";
run;

/*to check the names of the variables*/

proc print data=outset.med_data2 (obs=5);
run;

/*Create new columns for dates and drop unimportant variables; 
and drop one case which has a negative age value */
data outset.med_data3 (drop=patientid appointmentid);
	set outset.med_data2 ;
	drop scheduledday appointmentday;
	Schl_date = datepart(scheduledday);
	Aptm_date = datepart(Appointmentday);
	format schl_date aptm_date date9.;
	day_diff = (aptm_date - schl_date);
	if Age < 0 then delete;
run;


/*Exploratory Data Analysis  */
/* Check the number of people that showed up */
ods pdf file= "&path/final.pdf";

ods graphics on;
proc freq data=outset.med_data3;
tables show / nocum plots=freqplot(type=bar scale=percent);
run;
ods graphics off;




/* Check the relationship between gender and showed up */

ods graphics on;
proc freq data=outset.med_data3;
tables show*gender/ plots=freqplot(twoway=stacked orient=vertical);
run;
ods graphics off;


/* Check the relationship scholarship  and show */
ods graphics on;
proc freq data=outset.med_data3;
	tables show*scholarship/ plots=freqplot(twoway=stacked orient=vertical);
	run;
ods graphics off;

/* Check the SMS   and show */

ods graphics on;
proc freq data=outset.med_data3;
	tables show*sms_received/ plots=freqplot(twoway=stacked orient=Horizontal);
	run;
ods graphics off;

/* Check the relationship betweeb number of days and show */

data Dat_cate;
set outset.med_data3;
length Interval $ 20;
if day_diff <= 0 then Interval = 'Same Day';
else if day_diff <= 4 then Interval = 'Few Days';
else if day_diff > 4 and day_diff <= 15 then Interval = 'More than 4';
else Interval = 'More than 15';
run;

proc freq data=Dat_cate;
tables Interval/nocum;
run;

ods graphics on;
proc freq data=Dat_cate;
tables show*Interval /plots=freqplot(twoway=grouphorizontal orient=vertical);
run;
ods graphics off;


/* Day of the week vs show  */

data dayofweek;
set outset.med_data3;
	dof = weekday(Aptm_date);
	if dof = 1 then weekday = 'Sun';
	else if dof = 2 then weekday = 'Mon';
	else if dof = 3 then weekday = 'Tues';
	else if dof = 4 then weekday = 'Wednes';
	else if dof = 5 then weekday = 'Thurs';
	else if dof = 6 then weekday = 'Fri';
	else weekday = 'Sat';
run;


proc sort data=dayofweek;
	by weekday;
run;

*/Bar char*/

title "Weekdays On Which Most of the Appointments Were Missed ";
proc sgplot data = dayofweek ;
    vbar weekday/ categoryorder=respdesc group=show groupdisplay=cluster stat=freq  ;
run;



