* Encoding: UTF-8.
* rename variables

if (likable_m >0) Likable = likable_m. 
if (likable_j >0) Likable = likable_j. 
if (gogetter_m >0) gogetter = gogetter_m. 
if (gogetter_j >0) gogetter = gogetter_j. 
if (cold_m >0) cold = cold_m. 
if (cold_j >0) cold = cold_j. 
if (insensitive_m >0) insensitive = insensitive_m. 
if (insensitive_j >0) insensitive = insensitive_j. 
if (unmotivated_m >0) unmotivated = unmotivated_m. 
if (unmotivated_j >0) unmotivated = unmotivated_j. 
if (caring_m >0) caring = caring_m. 
if (caring_j >0) caring = caring_j. 
if (competent_m >0) competent = competent_m. 
if (competent_j >0) competent = competent_j. 
if (goodpeople_m >0) goodpeople = goodpeople_m. 
if (goodpeople_j >0) goodpeople = goodpeople_j. 
if (hardworking_m >0) hardworking = hardworking_m. 
if (hardworking_j >0) hardworking = hardworking_j. 
if (friendly_m >0) friendly = friendly_m. 
if (friendly_j >0) friendly = friendly_j. 
if (lazy_m >0) lazy = lazy_m. 
if (lazy_j >0) lazy = lazy_j. 
if (active_m >0) active = active_m. 
if (active_j >0) active = active_j. 
if (careearn_m >-1) careearn = careearn_m. 
if (careearn_j >-1) careearn = careearn_j. 
if (earncare_m >-1) earncare = earncare_m. 
if (earncare_j >-1) earncare = earncare_j.
if (similarmike_m >0) similar = similarmike_m. 
if (similarjen >0) similar = similarjen. 
if (idealmike_m >0) ideal = idealmike_m. 
if (idealjen >0) ideal = idealjen.
execute. 


if (idealjen >0) targgender = 2. 
if (idealmike_m >0) targgender = 1. 
if (likable_m >0) targgender = 1. 
if (likable_j >0) targgender = 2. 
execute. 

*DEMOGRAPHICS

FREQUENCIES VARIABLES=gender race children
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=age
  /STATISTICS=MEAN STDDEV MIN MAX.

*reverse coded items

RECODE cold insensitive unmotivated lazy (1=9) (2=8) (3=7) (4=6) (5=5) (9=1) (8=2) (7=3) (6=4).
EXECUTE.

*Competence reliability

RELIABILITY
  /VARIABLES=active hardworking competent unmotivated gogetter lazy
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

* Warmth reliability

RELIABILITY
  /VARIABLES=Likable cold insensitive caring goodpeople friendly
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

* create new composite warmth and competence columns

COMPUTE Warmth=mean(Likable,cold,insensitive,caring,goodpeople,friendly).
EXECUTE.
COMPUTE competence =mean(active,hardworking,competent,unmotivated,gogetter,lazy).
EXECUTE.

*Compare warmth vs. competence ratings
    
T-TEST PAIRS=competence WITH Warmth (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

*Grand mean competence

MEANS TABLES=competence
  /CELLS MEAN COUNT STDDEV.

*Grand mean warmth

MEANS TABLES=Warmth
  /CELLS MEAN COUNT STDDEV.

* recode and label conditions 

DO IF  (jen11s.7 >0).
RECODE jen11s.7 (1=2) INTO time.
END IF.
EXECUTE.


DO IF  (mike11s.7 >0).
RECODE mike11s.7 (1=2) INTO time.
END IF.
EXECUTE.

DO IF  (jen11t.1 >0).
RECODE jen11t.1 (1=1) INTO time.
END IF.
EXECUTE.
DO IF  (mike11t.1 >0).
RECODE mike11t.1 (1=1) INTO time.
END IF.
EXECUTE.

val lab  time  1 "tuesday" 2 'saturday'.
execute. 


if time = 1 and targgender = 1  condition = 1. 
if time = 1 and targgender = 2  condition = 2. 
if time = 2 and targgender = 1  condition = 3. 
if time = 2 and targgender = 2  condition = 4. 
execute. 

val lab condition 1 'man on tuesday' 2 ' woman on tuesday' 3 'man on saturday' 4 'woman on saturday' . 
execute. 

**main analyses

*Manipulation check 
    
UNIANOVA careearn BY time targgender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(time*targgender)
  /EMMEANS=TABLES(targgender*time) COMPARE(time) ADJ(LSD)
    /EMMEANS=TABLES(targgender*time) COMPARE(targgender) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=time targgender time*targgender.


* See if perceptions of caring and earning vary by day of week

T-TEST GROUPS=time(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=careearn
  /CRITERIA=CI(.95).

* See if perceptions of caring and earning vary by target gender

T-TEST GROUPS=targgender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=careearn
  /CRITERIA=CI(.95).

**COMPETENCE 
    *with simple effects (because inx is sig)
    
UNIANOVA competence BY time targgender gender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(time*targgender)
  /EMMEANS=TABLES(targgender*time) COMPARE(time) ADJ(LSD)
    /EMMEANS=TABLES(targgender*time) COMPARE(targgender) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=time targgender gender time*targgender time*gender targgender*gender 
    time*targgender*gender.

**WARMTH
    * with simple effects (because inx is sig)
    
UNIANOVA Warmth BY time targgender gender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(time*targgender)
  /EMMEANS=TABLES(targgender*time) COMPARE(time) ADJ(LSD)
    /EMMEANS=TABLES(targgender*time) COMPARE(targgender) ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=time targgender gender time*targgender time*gender targgender*gender 
    time*targgender*gender.

