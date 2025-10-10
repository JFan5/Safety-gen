; params: python3 spanner-generator.py 1 1 8 --seed 948076 --problem-name prob_s1_n1_l8_s948076
(define (problem prob_s1_n1_l8_s948076)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 - spanner
     nut1 - nut
     location1 location2 location3 location4 location5 location6 location7 location8 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location4)
    (useable spanner1)
    (loose nut1)
    (at nut1 gate)
    (link shed location1)
    (link location8 gate)
    (link location1 location2)
    (link location2 location3)
    (link location3 location4)
    (link location4 location5)
    (link location5 location6)
    (link location6 location7)
    (link location7 location8)
)
 (:goal
  (and
   (tightened nut1)
)))
