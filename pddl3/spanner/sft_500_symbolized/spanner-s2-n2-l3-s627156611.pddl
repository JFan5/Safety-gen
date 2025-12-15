; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 627156611 --problem-name spanner-s2-n2-l3-s627156611
(define (problem spanner-s2-n2-l3-s627156611)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_10 obj_02 - type_5
     obj_01 obj_07 - type_2
     obj_03 obj_08 obj_04 - type_3
     obj_09 obj_06 - type_3
    )
 (:init 
    (pred_2 obj_05 obj_09)
    (pred_2 obj_10 obj_04)
    (pred_1 obj_10)
    (pred_2 obj_02 obj_03)
    (pred_1 obj_02)
    (pred_6 obj_01)
    (pred_2 obj_01 obj_06)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_06)
    (pred_3 obj_09 obj_03)
    (pred_3 obj_04 obj_06)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_08 obj_04)
)
 (:goal
  (and
   (pred_4 obj_01)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
