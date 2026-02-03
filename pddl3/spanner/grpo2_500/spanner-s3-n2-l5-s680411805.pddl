; params: python3 /home/jfan5/Safety-gen/pddl3/spanner/spanner-generator.py 3 2 5 --seed 680411805 --problem-name spanner-s3-n2-l5-s680411805
(define (problem spanner-s3-n2-l5-s680411805)
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
    (at spanner1 location3)
    (useable spanner1)
    (at spanner2 location5)
    (useable spanner2)
    (at spanner3 location2)
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
