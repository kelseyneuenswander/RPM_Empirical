* Encoding: UTF-8.

SELECT IF (cond = 1 or cond = 2 or cond = 11 or cond = 12).
EXECUTE.


*DEMOGRAPHICS

FREQUENCIES VARIABLES=subj_gend subj_race subj_work sub_chidrn
  /STATISTICS=MEAN
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=subj_age
  /STATISTICS=MEAN STDDEV MIN MAX.

**Reliabilities with added measures
    *Competence
    
RELIABILITY
  /VARIABLES=competent active hardworking motivated gogetter lazyr  independent competitive intelligent successful
    Dominant Confident
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /SUMMARY=TOTAL.
    
    *Warmth

RELIABILITY
  /VARIABLES=likable warm sensitive caring friendly patient loving understanding Trustworthy
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE
  /SUMMARY=TOTAL.

* create new composite warmth and competence columns
    
compute warmth2  = mean(likable warm sensitive caring friendly patient loving understanding Trustworthy).
execute. 

compute competence2 = mean(competent, active, hardworking, motivated, gogetter, lazyr,  independent, competitive,  intelligent, successful,
    Dominant, Confident). 
execute. 

* compare perceptions of warmth with competence

T-TEST PAIRS=competence2 WITH warmth2 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.
  
*Grand mean Competence

MEANS TABLES=competence2
  /CELLS MEAN COUNT STDDEV.

*Grand mean warmth

MEANS TABLES=warmth2
  /CELLS MEAN COUNT STDDEV.

*Grand mean ideal

MEANS TABLES=ideal
  /CELLS MEAN COUNT STDDEV.

*Grand mean masculinity

MEANS TABLES=masculine
  /CELLS MEAN COUNT STDDEV.

*Grand mean femininity

MEANS TABLES=feminine
  /CELLS MEAN COUNT STDDEV.

* comparing perceptions of masculinity and femininity

T-TEST PAIRS=masculine WITH feminine (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

*Grand mean good earner

MEANS TABLES=earner
  /CELLS MEAN COUNT STDDEV.

* Manipulation check
    
UNIANOVA balance_care BY gender_targ day 
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day.

MEANS TABLES=balance_care BY day BY gender_targ
  /CELLS MEAN COUNT STDDEV.

* Caring/earning on Tueseday vs Saturday

T-TEST GROUPS=day(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=balance_care
  /CRITERIA=CI(.95)
  
* Caring/earning for Mothers vs Fathers

T-TEST GROUPS=gender_targ(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=balance_care
  /CRITERIA=CI(.95)

** MAIN ANALYSES

* Competence
    *with simple effects

UNIANOVA competence2 BY gender_targ day subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ day*gender_targ*subj_gend)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day subj_gend gender_targ*day gender_targ*subj_gend day*subj_gend 
    gender_targ*day*subj_gend.

    *Simple effects male participants
    
temporary. 
select if subj_gend = 1.
UNIANOVA competence2 BY gender_targ day
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day.

    *Simple effects female participants
    
temporary. 
select if subj_gend = 2.
UNIANOVA competence2 BY gender_targ day
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day.

* Warmth
    *with simple effects
    
UNIANOVA warmth2 BY gender_targ day subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ day*gender_targ*subj_gend)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day subj_gend gender_targ*day gender_targ*subj_gend day*subj_gend 
    gender_targ*day*subj_gend.

    *simple effects for male participants

temporary. 
select if subj_gend = 1.
UNIANOVA warmth2 BY gender_targ day
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day.

    *simple effects for female participants

temporary. 
select if subj_gend = 2.
UNIANOVA warmth2 BY gender_targ day
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day.

*Ideal for Gender
    *with simple effects
    
UNIANOVA ideal BY gender_targ day subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ day*gender_targ*subj_gend)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day subj_gend gender_targ*day gender_targ*subj_gend day*subj_gend 
    gender_targ*day*subj_gend.

**Masculinity
    *with simple effects
    
UNIANOVA masculine BY gender_targ day subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ day*gender_targ*subj_gend)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day subj_gend gender_targ*day gender_targ*subj_gend day*subj_gend 
    gender_targ*day*subj_gend.

UNIANOVA masculine BY gender_targ day 
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ)
  /EMMEANS=TABLES(gender_targ*day) COMPARE(day) ADJ(LSD)
    /EMMEANS=TABLES(gender_targ*day) COMPARE(gender_targ) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day gender_targ*day 


*Femininity
    *no simple effects (inx not sig)
    
UNIANOVA feminine BY gender_targ day subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ day*gender_targ*subj_gend)
  /EMMEANS=TABLES(gender_targ*day) 
  /EMMEANS=TABLES(day) 
  /EMMEANS=TABLES(gender_targ) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day subj_gend gender_targ*day gender_targ*subj_gend day*subj_gend 
    gender_targ*day*subj_gend.

*Good Earner
    *no simple effects (inx not sig)
    
UNIANOVA earner BY gender_targ day subj_gend
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(day*gender_targ day*gender_targ*subj_gend)
  /EMMEANS=TABLES(gender_targ*day) 
  /EMMEANS=TABLES(day) 
  /EMMEANS=TABLES(gender_targ) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=gender_targ day subj_gend gender_targ*day gender_targ*subj_gend day*subj_gend 
    gender_targ*day*subj_gend.



