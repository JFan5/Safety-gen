; params: python3 spanner-generator.py 3 2 5 --seed 1861600 --problem-name test_s3_n2_l5_v6
(define (problem test_s3_n2_l5_v6)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 - spanner
     nut1 nut2 - nut
     location1 location2 location3 location4 location5 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location2)
    (useable spanner1)
    (at spanner2 location1)
    (useable spanner2)
    (at spanner3 location1)
    (useable spanner3)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
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
   (tightened nut2)
)))
