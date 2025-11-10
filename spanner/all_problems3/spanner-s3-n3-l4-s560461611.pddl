; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 560461611 --problem-name spanner-s3-n3-l4-s560461611
(define (problem spanner-s3-n3-l4-s560461611)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 - spanner
     nut1 nut2 nut3 - nut
     location1 location2 location3 location4 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location4)
    (useable spanner1)
    (at spanner2 location1)
    (useable spanner2)
    (at spanner3 location2)
    (useable spanner3)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (loose nut3)
    (at nut3 gate)
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
   (tightened nut3)
))
(:constraints
  (and
    (always (imply (not (tightened nut2)) (not (tightened nut3))))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
)
