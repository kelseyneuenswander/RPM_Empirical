* Encoding: UTF-8.
* Demographics

FREQUENCIES VARIABLES=subj_gend subj_race subj_work sub_chidrn libcons_1
  /STATISTICS=MEAN
  /ORDER=ANALYSIS.

compute age = number(subj_age, F2).
execute.

DESCRIPTIVES VARIABLES=age
  /STATISTICS=MEAN STDDEV MIN MAX.

* recode conditions

if (tue_M1 > 0) cond = 1. 
if (tue_j1 > 0) cond = 2. 
If (sat_m1 > 0) cond = 3.  
If (sat_j1 > 0) cond = 4. 

if (tue_cpc1 > 0) cond = 5. 
if (tue_cc_j1 > 0) cond = 6. 
If (sat_cpc1 > 0) cond = 7.  
If (sat_cc_j1 > 0) cond = 8. 

execute.  

val lab cond 1 ' mike tuesday' 2 ' jen tuesday' 3 'mike saturday' 4 ' jen saturday'  5 ' mike tuesday phone ' 6 ' jen tuesday phone' 7 'mike saturday phone' 8 ' jen saturday phone'. 

if (cond = 1) gendtarg = 1. 
if (cond = 2)  gendtarg = 2.  
if (cond = 3)  gendtarg = 1.  
if (cond = 4)  gendtarg = 2. 
if (cond = 5) gendtarg = 1. 
if (cond = 6)  gendtarg = 2.  
if (cond = 7)  gendtarg = 1.  
if (cond = 8)  gendtarg = 2. 


val lab gendtarg 1 'Michael' 2 ' Jennifer'. 
execute.

if (cond = 1) day = 1. 
if (cond = 2)  day = 1.  
if (cond = 3)  day = 2.  
if (cond = 4)  day = 2. 
if (cond = 5) day = 1. 
if (cond = 6)  day = 1.  
if (cond = 7)  day = 2.  
if (cond = 8)  day = 2. 

val lab day 1 ' Tuesday' 2 'saturday'.
EXECUTE. 

if (cond = 1) phone = 1. 
if (cond = 2)  phone = 1.  
if (cond = 3)  phone = 1.  
if (cond = 4)  phone = 1. 
if (cond = 5) phone = 2. 
if (cond = 6)  phone = 2.  
if (cond = 7)  phone = 2.  
if (cond = 8)  phone = 2. 


val lab phone 1 'no cell' 2 ' cell'. 
execute. 

**rename variables 


if (like_m_1 >0) Likable = like_m_1 . 
if (like_j_1 >0) Likable = like_J_1 . 
execute. 

if (intel_m_1 >0) intelligent = intel_m_1. 
if (intel_j_1 >0) intelligent =intel_j_1. 

if (goget_m_1 >0) gogetter = goget_m_1. 
if (goget_j_1 >0) gogetter =goget_j_1. 

if (warm_m_1 >0) warm = warm_m_1. 
if (warm_j_1 >0) warm = warm_j_1. 

if (sens_m_1 >0) sensitive = sens_m_1. 
if (insens_j_1 >0) sensitive = insens_j_1. 

if (motiv_m_1 >0) motivated = motiv_m_1. 
if (unmot_j_1 >0) motivated = unmot_j_1. 

if (caring_m_1 >0) caring = caring_m_1. 
if (care_j_1 >0) caring = care_j_1. 

if (compnt_m_1 >0) competent = compnt_m_1. 
if (comp_j_1 >0) competent = comp_j_1. 

if (indep_m_1 >0) independent = indep_m_1. 
if (indep_j_1 >0) independent = indep_j_1. 


if (compete_m_1 >0) competitive = compete_m_1. 
if (comptv_j_1 >0) competitive = comptv_j_1. 

if (hardwk_m_1 >0) hardworking = hardwk_m_1. 
if (hard_w_1 >0) hardworking = hard_w_1. 

if (friend_m_1 >0) friend = friend_m_1. 
if (friend_j_1 >0) friend = friend_j_1. 

if (lazy_m_1 >0) lazy = lazy_m_1. 
if (lazy_j_1 >0) lazy = lazy_j_1. 

if (active_m_1 >0) active = active_m_1. 
if (active_j_1 >0) active = active_j_1. 

if (patient_m_1 >0) patient = patient_m_1. 
if (patient_j_1 >0) patient = patient_j_1. 


if (intel_m_1 >0) patient = intel_m_1. 
if (intel_j_1 >0) patient = intel_j_1. 


if (loving_m_1 >0) loving = loving_m_1. 
if (loving_j_1 >0) loving = loving_j_1. 


if (success_m_1 >0) successful = success_m_1. 
if (success_j_1 >0) successful = success_j_1. 


if (underst_m_1 >0) understanding = underst_m_1. 
if (under_j_1 >0) understanding = under_j_1. 


if (domn_m_1 >0) dominant = domn_m_1. 
if (dom_j_1 >0) dominant = dom_j_1. 


if (trust_m_1 >0) trustworthy = trust_m_1. 
if (trust_j_1 >0) trustworthy = trust_j_1. 


if (confdt_m_1 >0) confident = confdt_m_1. 
if (conf_j_1 >0) confident = conf_j_1. 


if (happy_m_1 >0) happy = happy_m_1. 
if (happy_j_1 >0) happy = happy_j_1. 

if (selfish_m_1 >0) selfish = selfish_m_1. 
if (selfish_j_1 >0) selfish = selfish_j_1. 



if (ideal_m >0) ideal = ideal_m. 
if (ideal_j >0) ideal = ideal_j. 


if (fem_m_1 >0) feminine = fem_m_1. 
if (fem_j_1 >0) feminine = fem_j_1. 


if (masc_m_1 >0) masculine = masc_m_1. 
if (masc_j__1 >0) masculine = masc_j__1. 


if (gdcare_m_1 >0) caregiver = gdcare_m_1. 
if (gcare_j_1 >0) caregiver = gcare_j_1. 

if (gearn_m_1 >0) earner = gearn_m_1. 
if (gearn_j_1 >0) earner = gearn_j_1. 


if (car_ear_m_1 >0) careearn = car_ear_m_1. 
if (liv_ear_j_1 >0) careearn = liv_ear_j_1. 


if (car_ear_m_2 >0) earncare = car_ear_m_2. 
if (liv_ear_j_2 >0) earncare = liv_ear_j_2. 

if (badmom_1 >0) badmomdad = badmom_1.
if (if baddad_1 >0) badmomdad = baddad_1.

if (fday >0) present = fday. 
if (mday_j >0) present  = mday_j. 


if (emot_m_1 >0) envy = emot_m_1. 
if (emotj_1 >0) envy  = emotj_1. 


if (emot_m_2 >0) contempt = emot_m_2. 
if (emotj_2 >0) contempt  = emotj_2. 


if (emot_m_3 >0) envy = emot_m_3. 
if (emotj_3 >0) envy  = emotj_3. 


if (emot_m_4 >0) admiration = emot_m_4. 
if (emotj_4 >0) admiration  = emotj_4.

if (emot_m_5 >0) negemot = emot_m_5. 
if (emotj_5 >0) negemot  = emotj_5.

if (emot_m_6 >0) posemot = emot_m_6. 
if (emotj_6 >0) posemot  = emotj_6.


if (chdfrien_j_1 >0) childfriend = chdfrien_j_1. 
if (chfriend_m_1 >0) childfriend = chfriend_m_1. 

if (neighbor_j_1>0) neighbor = neighbor_j_1. 
if (Mike_sdnei_1>0) neighbor = Mike_sdnei_1.  

if (cfriend_j_1 >0) friend  = cfriend_j_1 .
if (mike_sdfrn_1 >0) friend = mike_sdfrn_1.


if (fammemb_j_1 > 0)  fammembr = fammemb_j_1.
if (mike_sdfam_1 >0) fammembr = mike_sdfam_1. 

if (din_j_1 >0)  dinner= din_j_1.
if (mike_din_1 >0) dinner = mike_din_1.

if (j_rq_ga_1>0) getalong= j_rq_ga_1.
if (M_RQ_ga_1>0) getalong = M_RQ_ga_1.

if (J_rq_gt_1>0) goodteam = J_rq_gt_1.
if (M_Rq_gt_1>0) goodteam = M_Rq_gt_1. 

if (J_rq_hqr_1>0) hiqualrelat = J_rq_hqr_1.
if (M_Rq_hqr_1>0) hiqualrelat = M_Rq_hqr_1.

if (J_rq_lov_1>0) love = J_rq_lov_1.
if (M_Rq_lov_1 >0) love  = M_Rq_lov_1.

if ( sim_j_1 >0 ) similar = sim_j_1. 
if (Sim_M_1 >0) similar  = Sim_M_1.

if (Id_j_1 >0) identify = id_j_1.
if (Id_M_1 >0) identify = Id_M_1.
 
if (bonus_j >1) bonus = bonus_j. 
if (bonus_m> 1) bonus = bonus_m. 
execute. 

if (ident_j_1 >1) identify = ident_j_1. 
if (id_m_1> 1) identify = id_m_1. 
execute. 


if (sim_j_1 >1) similar = sim_j_1. 
if (sim_m_1> 1) similar = sim_m_1. 
execute. 

*Reliabilities
    *competence
    
RELIABILITY
  /VARIABLES=gogetter motivated competent independent competitive lazy active successful dominant 
    confident hardworking intelligent
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

    *warmth

RELIABILITY
  /VARIABLES=LIKABLE warm sensitive caring friend patient loving understanding happy trustworthy
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.

* create composite column for competence

compute competence  = mean(gogetter, motivated, competent, independent, competitive, lazy, active, successful, dominant, 
    confident, hardworking, intelligent).
execute. 

* create composite column for warmth

compute warmth  = mean(likable, warm, sensitive, caring, friend, patient, loving, understanding, happy, trustworthy).
execute.

* Grand mean competence

MEANS TABLES=competence
  /CELLS MEAN COUNT STDDEV.

* Grand mean warmth

MEANS TABLES=warmth 
  /CELLS MEAN COUNT STDDEV.

* Grand mean ideal for gender

MEANS TABLES=ideal
  /CELLS MEAN COUNT STDDEV.

* Grand mean masculinity

MEANS TABLES=masculine
  /CELLS MEAN COUNT STDDEV.

* Grand mean femininity

MEANS TABLES=feminine
  /CELLS MEAN COUNT STDDEV.

* Grand mean good earner

MEANS TABLES=earner
  /CELLS MEAN COUNT STDDEV.

* compare warmth versus competence
    
T-TEST PAIRS=competence WITH warmth (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

* Manipulation checks
   
* Caring/earning on Tuesday vs Saturday

T-TEST GROUPS=day(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=careearn
  /CRITERIA=CI(.95).

* Caring/earning for Mothers vs Fathers

T-TEST GROUPS=gendtarg(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=careearn
  /CRITERIA=CI(.95).

* Caring/earning Work Call vs No Call
    
T-TEST GROUPS=phone(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=careearn
  /CRITERIA=CI(.95).

** Main Analyses
    
*Competence
    *simple effects
    
UNIANOVA competence BY day phone gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg*phone)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(gendtarg) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(phone) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day phone gendtarg subj_gend day*phone day*phone*subj_gend day*gendtarg day*gendtarg*subj_gend phone*gendtarg phone*gendtarg*subj_gend
    day*phone*gendtarg day*phone*gendtarg*subj_gend.
    
    *looking at male participants

temporary. 
select if subj_gend = 1.
UNIANOVA competence BY gender_targ day
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day.

    *contrast tuesday work call dad with other 4 dad conditions


*Warmth
    *simple effects 
    
UNIANOVA warmth BY day phone gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg*phone)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(gendtarg) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(phone) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day phone gendtarg subj_gend day*phone day*phone*subj_gend day*gendtarg day*gendtarg*subj_gend phone*gendtarg phone*gendtarg*subj_gend
    day*phone*gendtarg day*phone*gendtarg*subj_gend.

    *looking only at male participants

temporary. 
select if phone = 1.
UNIANOVA warmth BY day gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg)
  /EMMEANS=TABLES(gendtarg*day) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day) COMPARE(gendtarg) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day gendtarg subj_gend day*gendtarg day*gendtarg*subj_gend

* Ideal for gender
       *simple effects
    
UNIANOVA ideal BY day phone gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg*phone)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(gendtarg) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(phone) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day phone gendtarg subj_gend day*phone day*phone*subj_gend day*gendtarg day*gendtarg*subj_gend phone*gendtarg phone*gendtarg*subj_gend
    day*phone*gendtarg day*phone*gendtarg*subj_gend.

*Masculinity
    *simple effects
    
UNIANOVA masculine BY day phone gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg*phone)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(gendtarg) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(phone) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day phone gendtarg subj_gend day*phone day*phone*subj_gend day*gendtarg day*gendtarg*subj_gend phone*gendtarg phone*gendtarg*subj_gend
    day*phone*gendtarg day*phone*gendtarg*subj_gend.

    *looking at male participants

temporary. 
select if subj_gend = 1.
UNIANOVA masculine BY day gendtarg 
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg)
  /EMMEANS=TABLES(gendtarg*day) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day) COMPARE(gendtarg) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day gendtarg day*gendtarg 
  
    *looking at female participants

temporary. 
select if subj_gend = 2.
UNIANOVA masculine BY day gendtarg 
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg)
  /EMMEANS=TABLES(gendtarg*day) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day) COMPARE(gendtarg) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day gendtarg day*gendtarg 

*Femininity 
    *simple effects
    
UNIANOVA feminine BY day phone gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg*phone)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(gendtarg) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(phone) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day phone gendtarg subj_gend day*phone day*phone*subj_gend day*gendtarg day*gendtarg*subj_gend phone*gendtarg phone*gendtarg*subj_gend
    day*phone*gendtarg day*phone*gendtarg*subj_gend.

*Good Earner
    *simple effects
    
UNIANOVA earner BY day phone gendtarg subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gendtarg day*gendtarg*phone)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(day) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(gendtarg) ADJ(LSD)
  /EMMEANS=TABLES(gendtarg*day*phone) COMPARE(phone) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=day phone gendtarg subj_gend day*phone day*phone*subj_gend day*gendtarg day*gendtarg*subj_gend phone*gendtarg phone*gendtarg*subj_gend
    day*phone*gendtarg day*phone*gendtarg*subj_gend.
