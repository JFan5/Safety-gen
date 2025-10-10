; params: python3 spanner-generator.py 1 1 5 --seed 101256 --problem-name prob_s1_n1_l5_s101256
(define (problem prob_s1_n1_l5_s101256)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 - spanner
     nut1 - nut
     location1 location2 location3 location4 location5 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location3)
    (useable spanner1)
    (loose nut1)
    (at nut1 gate)
    (link shed location1)
    (link location5 gate)
    (link location1 location2)
    (link location2 location3)
    (link location3 location4)
    (link location4 location5)
)
 (:goal
  (and
   (tightened nut1)
)))
