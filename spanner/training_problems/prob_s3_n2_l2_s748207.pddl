; params: python3 spanner-generator.py 3 2 2 --seed 748207 --problem-name prob_s3_n2_l2_s748207
(define (problem prob_s3_n2_l2_s748207)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 - spanner
     nut1 nut2 - nut
     location1 location2 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location1)
    (useable spanner1)
    (at spanner2 location2)
    (useable spanner2)
    (at spanner3 location1)
    (useable spanner3)
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
