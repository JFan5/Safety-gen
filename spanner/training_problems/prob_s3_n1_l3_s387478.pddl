; params: python3 spanner-generator.py 3 1 3 --seed 387478 --problem-name prob_s3_n1_l3_s387478
(define (problem prob_s3_n1_l3_s387478)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 - spanner
     nut1 - nut
     location1 location2 location3 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location1)
    (useable spanner1)
    (at spanner2 location1)
    (useable spanner2)
    (at spanner3 location1)
    (useable spanner3)
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
