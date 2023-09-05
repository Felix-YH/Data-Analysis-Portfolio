# Overview
This repository contains a data analysis project focused on medical appointments. 
## Table of contents
- [Project Description](#project-description)
- [Data Description](#data-description)
- [Analysis](#analysis)
  - [Data Cleaning](#data-cleaning)
  - [Question Answers](#question-answers)


# Project Description
This repository contains the code and documentation for a data analysis project focused on medical appointment data. The project utilizes SAS (Statistical Analysis System) to perform a comprehensive analysis of the dataset. The objective is to gain insights into various aspects of medical appointments, including factors influencing appointment attendance and patient demographics

# Data Description
The dataset used for this analysis can be found on [kaggle](https://www.kaggle.com/datasets/joniarroba/noshowappointments?resource=download&select=KaggleV2-May-2016.csv) It includes information about medical appointments, such as patient demographics, appointment dates, appointment characteristics, and whether the patient showed up for the appointment. The dataset is in CSV format and is named medical_appointment_data.csv.

# Analysis 
Below are the questions I seek answers to:
- What is the percentage of no-shows?
- What are the factors that may affect whether a patient will show up for their scheduled appointment or not?
- Is there any effect of Gender on whether a patient will show up for the booked appointment or not?
- Are patients with scholarships more likely to miss their appointments?
- Are patients who don’t receive SMS more likely to miss their appointment?
- Does the time difference between the scheduling and appointment have any impact on whether a patient will show up for their appointment or not?
- On which weekdays people don’t show up most often?

  ## Data Cleaning
Before starting with my analysis,
I changed some column's name - No-show to Show, Hipertnsion to Hypertension 
Created new columns for datetime values - aptm_date and schl_date, date_diff
Remove some columns - patientid and appointementid;

  ## Question Answers
  1. What is the percentage of no-shows? Ans- From the diagram in Sas_med.pdf, we can see that most patients showed up for their appointments. Approximately 80 % of patients showed up for their appointments.
  2. What are the factors that may affect whether a patient will show up for their scheduled appointment or not? Ans- Having a look at the final report, the following variables are likely to affect a patient's appointment i.e. gender, the number of days between the scheduled date and appointment date,  scholarship, and SMS. I will explore these factors in more detail.
  3. Is there any effect of Gender on whether a patient will show up for the booked appointment or not? Ans- Yes, the gender of the patient affects whether they show up for their booked appointment. The percentage of females missing their appointment is nearly two times the number of males. So females are more likely to miss their appointment.
  4. Are patients with scholarships more likely to miss their appointments? Patient wth scholarship or insurance are more likely to miss thier appointment. 76% of patients with scholarships are more likely to miss thier appointment.
  5. Are patients who don’t receive SMS more likely to miss their appointment?
     An unusual discovery indicates that patients who have received an SMS are       more likely to not attending their appointments. Most  patient did not received sms messages still turned up for their appointments. Clearly, receiving an sms does not play an importmant role in determing whether  a patient will show up for their appointments.
  6. Does the time difference between the scheduling and appointment have any impact on whether a patient will show up for their appointment or not?
It seems that as the time gap between the scheduling date and the appointment date increases, the likelihood of the patient not attending their appointment also rises.
  7. On which weekdays people don’t show up most often?
     The majority of missed appointments tend to occur on Tuesdays and Wednesdays
