; params: python3 spanner-generator.py 1 1 3 --seed 29557 --problem-name prob_s1_n1_l3_s29557
(define (problem prob_s1_n1_l3_s29557)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 - spanner
     nut1 - nut
     location1 location2 location3 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location3)
    (useable spanner1)
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
