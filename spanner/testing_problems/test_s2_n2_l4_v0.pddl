; params: python3 spanner-generator.py 2 2 4 --seed 1474168 --problem-name test_s2_n2_l4_v0
(define (problem test_s2_n2_l4_v0)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 - spanner
     nut1 nut2 - nut
     location1 location2 location3 location4 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location4)
    (useable spanner1)
    (at spanner2 location4)
    (useable spanner2)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (link shed location1)
    (link location4 gate)
    (link location1 location2)
    (link location2 location3)
    (link location3 location4)
)
 (:goal
  (and
   (tightened nut1)
   (tightened nut2)
)))
