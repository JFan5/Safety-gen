; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 354109785 --problem-name spanner-s3-n2-l4-s354109785
(define (problem spanner-s3-n2-l4-s354109785)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_05 obj_11 obj_10 - type_3
     obj_12 obj_07 - type_4
     obj_01 obj_04 obj_06 obj_03 - type_5
     obj_02 obj_09 - type_5
    )
 (:init 
    (pred_2 obj_08 obj_02)
    (pred_2 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_2 obj_11 obj_03)
    (pred_5 obj_11)
    (pred_2 obj_10 obj_06)
    (pred_5 obj_10)
    (pred_6 obj_12)
    (pred_2 obj_12 obj_09)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_09)
    (pred_1 obj_02 obj_01)
    (pred_1 obj_03 obj_09)
    (pred_1 obj_01 obj_04)
    (pred_1 obj_04 obj_06)
    (pred_1 obj_06 obj_03)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
