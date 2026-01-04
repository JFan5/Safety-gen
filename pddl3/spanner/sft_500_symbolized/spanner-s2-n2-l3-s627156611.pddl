; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 627156611 --problem-name spanner-s2-n2-l3-s627156611
(define (problem spanner-s2-n2-l3-s627156611)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_10 obj_09 - type_5
     obj_04 obj_06 - type_3
     obj_03 obj_07 obj_01 - type_4
     obj_02 obj_08 - type_4
    )
 (:init 
    (pred_3 obj_05 obj_02)
    (pred_3 obj_10 obj_01)
    (pred_2 obj_10)
    (pred_3 obj_09 obj_03)
    (pred_2 obj_09)
    (pred_1 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_1 obj_06)
    (pred_3 obj_06 obj_08)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_03 obj_07)
    (pred_5 obj_07 obj_01)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
