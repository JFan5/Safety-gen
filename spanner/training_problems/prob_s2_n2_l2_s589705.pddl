; params: python3 spanner-generator.py 2 2 2 --seed 589705 --problem-name prob_s2_n2_l2_s589705
(define (problem prob_s2_n2_l2_s589705)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 - spanner
     nut1 nut2 - nut
     location1 location2 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location2)
    (useable spanner1)
    (at spanner2 location2)
    (useable spanner2)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (link shed location1)
    (link location2 gate)
    (link location1 location2)
)
 (:goal
  (and
   (tightened nut1)
   (tightened nut2)
)))
