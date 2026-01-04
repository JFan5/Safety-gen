; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 586890095 --problem-name spanner-s3-n2-l4-s586890095
(define (problem spanner-s3-n2-l4-s586890095)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_07 obj_11 obj_09 - type_1
     obj_04 obj_01 - type_3
     obj_05 obj_06 obj_03 obj_08 - type_2
     obj_12 obj_02 - type_2
    )
 (:init 
    (pred_3 obj_10 obj_12)
    (pred_3 obj_07 obj_08)
    (pred_4 obj_07)
    (pred_3 obj_11 obj_06)
    (pred_4 obj_11)
    (pred_3 obj_09 obj_06)
    (pred_4 obj_09)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_02)
    (pred_5 obj_12 obj_05)
    (pred_5 obj_08 obj_02)
    (pred_5 obj_05 obj_06)
    (pred_5 obj_06 obj_03)
    (pred_5 obj_03 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_01))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
