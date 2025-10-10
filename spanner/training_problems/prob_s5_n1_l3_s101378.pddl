; params: python3 spanner-generator.py 5 1 3 --seed 101378 --problem-name prob_s5_n1_l3_s101378
(define (problem prob_s5_n1_l3_s101378)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 spanner4 spanner5 - spanner
     nut1 - nut
     location1 location2 location3 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location3)
    (useable spanner1)
    (at spanner2 location3)
    (useable spanner2)
    (at spanner3 location2)
    (useable spanner3)
    (at spanner4 location1)
    (useable spanner4)
    (at spanner5 location2)
    (useable spanner5)
    (loose nut1)
    (at nut1 gate)
    (link shed location1)
    (link location3 gate)
    (link location1 location2)
    (link location2 location3)
)
 (:goal
  (and
   (tightened nut1)
)))
