; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 710078358 --problem-name spanner-s3-n2-l4-s710078358
(define (problem spanner-s3-n2-l4-s710078358)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 - spanner
     nut1 nut2 - nut
     location1 location2 location3 location4 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location1)
    (useable spanner1)
    (at spanner2 location3)
    (useable spanner2)
    (at spanner3 location3)
    (useable spanner3)
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
))
(:constraints
  (and
    (always (imply (not (tightened nut1)) (not (tightened nut2))))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
)
