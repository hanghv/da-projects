# BellaBeat Case Study - User Behavior Analysis for Marketing
## Overview
This project aims at delivering high-level data-driven marketing recommendations for Bellabeat’s product based on the findings regarding user behaviors from the Fitbit’s users tracking data. The report as well as the dashboard provide the Bellabeat’s CEO, founders, and marketing team an overview about users and their dominant behaviors, thus facilitating the high-level and product-led recommendations for marketing initiatives.

About Bellabeat: A brand that provides high-tech health tracker devices (like Fitbit) focusing on women’s wellness, healthy lifestyle instead of intensive training. Their primary product line consists of screenless smart jewelry pairing with Bellabeat App to support a woman’s daily routine.

## Objectives
* **Analyze User Behavior:** Uncover dominant user behaviors focusing on activity level and intensity using Fitbit tracking data
* **Deliver Recommendations:** Translate the behavioral insights into high-level, data-driven marketing recommendations that align with Bellabeat’s core focus.

## Data Journey
* **Data cleaning (Power Query and Python):** Effectively removed duplicate entries across daily, hourly, and minute-level files. For the massive minute-level files, which exceed a million rows, Python was utilized to handle the removal of duplicates. The logic of deduplication takes into consideration both User ID and Date/Timestamp.
* **Data Manipulation (Python):** Employed Pandas for complex data manipulation such as identifying long sedentary windows. Specifically, I defined a sedentary window with 2-minute tolerance, flagged the rows where users were sedentary, and tracked the sequential time blocks to isolate sessions where users are inactive for 60 or more consecutive minutes.
* **Data Visualization (Tableau):** Selected charts that are appropriate to present the data, developed dashboards with collections of charts to tell executive-level visual narrative, This allows the stakeholders to quickly grab the key findings and easily cross-reference users' habits, activity level, and activity intensity.

## Findings & Reconmmendations
### Overview
Users are classified into 3 categories based on their average daily step count. Specifically:
* High-activity:  10,000 average daily steps
* Moderate-activity: 5,000 - 10,000 average daily steps
* Sedentary: < 5,000 average daily steps
	**Consistency Metric:** Users are classified as "Consistent" if they achieve 10,000 or more steps in  80% of their logged days.
  <img width="1306" height="1016" alt="image" src="https://github.com/user-attachments/assets/bcb4b8db-80a8-4e90-a7bd-29fd3bd0db5d" />
#### Highlights:
* **Step Deficit:** A low portion of active (21.21%) and consistent (12.12%) users, together with an overall of around 7,600 daily steps, suggests that most users do not meet the recommended 10,000-step daily benchmark.
* **Sedentary Paradox:** Sedentary behavior appears to be the dominant one across daily records. Even High-activity users spend a massive portion of their day inactive - around 16 average sedentary hours per day across all users.

#### Business Implications and Recommendations:
The combination of below-recommended step averages and overwhelming sedentary time points to a highly inactive daily routine among users. This presents a massive opportunity for Bellabeat. By focusing product positioning on combating daily inactive behavior, Bellabeat can seamlessly integrate into users’ daily routines and guide them toward more active habits.

### Sedentary Behavior Analysis
A long sedentary window was defined as a minimum of 60 consecutive sedentary minutes recorded. A 2-minute tolerance threshold is applied to account for micro-movements (e.g., standing up or changing seats) that do break the inactive streak..
Furthermore, the sleeping window from 22:00 to 06:00 was filtered out of  sedentary-session-start-hour analysis to ensure the focus was placed on active/working hours.
<img width="1328" height="1007" alt="image" src="https://github.com/user-attachments/assets/c39d770b-c793-4ae1-abc1-1cc5d19a44db" />
#### Highlights:
* **The High-activity Paradox:** Overall, all users spend the majority of their days inactive. Intriguingly, high-activity users register more average sedentary time than Moderate-activity ones. This indicates that the core factor differentiating the segments is not a reduction in overall inactive time, but rather the addition of active minutes.
* **Frequency and Duration Paradox:** While active user classes log a higher frequency of long inactive sessions per day, the duration of those sessions is much lower - average 3.3 hours compared to 6.6 hours.
* **Long Sessions’ Start-Hour Trends:** Active user classes show sharp fluctuations in when their long inactive sessions begin (peaking around lunch and post-work). In contrast, the sedentary user class shows a flatter, even distribution without a routine-based break.
#### Business Implications and Recommendations:
To help users build healthier and more active daily habits, Bellabeat can directly tackle this long sedentary behavior. Particularly, analyzing the  frequency of long-inactive-session start hours provides a data-driven roadmap for Bellabeat to determine exactly when to intervene in users’ daily routines.

### Intervention Opportunity
Knowing when the prolonged sedentary sessions begin allows Bellabeat to understand better when to intervene in order to break the sedentary streaks. However, layering this data with Average Steps per Hour provides a much more sophisticated, multidimensional view. By cross-referencing activity volume with inactive behavior triggers, Bellabeat can switch from reactive model to a proactive one, allowing two types of intervention:
* Prevention (Pre-emptive Nudges): Target high-activity windows before a drop occurs to prevent a sedentary streak from starting.
* Interruption (Reactive Nudges): Target established sedentary windows to break an active streak and re-introduce movement.
  
<img width="1383" height="985" alt="image" src="https://github.com/user-attachments/assets/9656a874-9c30-4c79-a87f-126570e6e2b8" />

Across all three user groups, the primary risk window for initiating long sedentary sessions occurs between 19:00 and 21:59, with secondary risk clusters emerging at 12:00 and 14:59.

#### High-activity users:
* **Highlights:** Users experience peak step counts at 14:00 and 19:00 (~1,000 steps), followed by dramatic drop-offs. Notably, 19:00 and 20:00 are among the highest peaks for the start of long sedentary sessions (10.93% and 10.05% respectively). It is reasonable to say that high-activity users have clear routines with activity bursts, and the peak sedentary sessions are more likely the recovery window after high-activity periods. Furthermore, 12:00 is also a secondary risky hour for prolonged inactive sessions.
* **Intervention Strategy (Prevention):** Since high-activity users’ behavior is highly routine driven,  Bellabeat can proactively target the recovery periods by sending nudges after the activity burst (14:15 and 19:15), suggesting a light stretching. Furthermore, a lunch-time prompt around 12:00 would be appropriate to catch afternoon drop-off before it takes root.
#### Moderate-activity users:
* **Highlights:** This group maintains a stable morning routine, but their step counts steadily decline after a mild noon peak. In general, their long sedentary sessions start after mid-day (12:00, 14:00, and 15:00), collectively accounting for ~20% of total hour frequency. The risk reaches the peak in late evening at 20:00 (10.06%) and 21:00 (9.68%). These users struggle heavily with a prolonged post-lunch slump and a tendency to completely disengage into couch-lock too early in the evening.
* **Intervention Strategy (Interruption):** Interventions should focus on two key risk horizons. First, to combat the heavy afternoon slump, light activity reminders should be triggered at 12:30, 14:30, and 15:30. Second, to interrupt evening couch-lock, a nudge around 20:30 should encourage a low-intensity lifestyle habit, such as preparing a meal for the next day or completing a quick evening tidy-up.
#### Sedentary users:
* **Highlights:** These users exhibit a flat activity profile, hardly breaking an average of 250 steps/hour. Because their baseline activity is already low, long sedentary sessions can trigger easily at almost any hour. Interestingly, the risk of starting a long inactive session is evenly distributed, but shows a spike at noon (12:00 with 8.02%), in the afternoon (17:00 with 8.64%), and in the  evening (20:00 with 8.95%).
* **Intervention Strategy (Interruption):**  The objective here is strict, frequent interruption via recurring prompts throughout the day. Crucially, the reminder content must bypass fitness-focused language. Instead, the nudges should serve low-friction, micro-step prompts for daily life tasks such as taking a glass of water during the daytime, or encouraging light household chores and meal prep during the 17:00 and 20:00 risk windows.

<img width="1362" height="508" alt="image" src="https://github.com/user-attachments/assets/257e88ac-51a9-4145-a595-4b554cd97682" />

## References
Bellabeat’s website: https://bellabeat.com/about-us/
Dataset: https://www.kaggle.com/datasets/arashnic/fitbit 
Dashboard: https://public.tableau.com/views/Userengagementintrackingdeviceusage-Fitbit-Bellabeat/Dashboard3?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link 





