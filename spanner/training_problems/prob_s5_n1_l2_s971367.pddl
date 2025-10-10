; params: python3 spanner-generator.py 5 1 2 --seed 971367 --problem-name prob_s5_n1_l2_s971367
(define (problem prob_s5_n1_l2_s971367)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 spanner4 spanner5 - spanner
     nut1 - nut
     location1 location2 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location2)
    (useable spanner1)
    (at spanner2 location2)
    (useable spanner2)
    (at spanner3 location1)
    (useable spanner3)
    (at spanner4 location2)
    (useable spanner4)
    (at spanner5 location2)
    (useable spanner5)
    (loose nut1)
    (at nut1 gate)
    (link shed location1)
    (link location2 gate)
    (link location1 location2)
)
 (:goal
  (and
   (tightened nut1)
)))
