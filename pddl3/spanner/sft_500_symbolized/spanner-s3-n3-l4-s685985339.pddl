; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 685985339 --problem-name spanner-s3-n3-l4-s685985339
(define (problem spanner-s3-n3-l4-s685985339)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_05 obj_03 obj_01 - type_3
     obj_09 obj_06 obj_12 - type_1
     obj_07 obj_02 obj_13 obj_10 - type_2
     obj_08 obj_04 - type_2
    )
 (:init 
    (pred_4 obj_11 obj_08)
    (pred_4 obj_05 obj_13)
    (pred_2 obj_05)
    (pred_4 obj_03 obj_02)
    (pred_2 obj_03)
    (pred_4 obj_01 obj_13)
    (pred_2 obj_01)
    (pred_3 obj_09)
    (pred_4 obj_09 obj_04)
    (pred_3 obj_06)
    (pred_4 obj_06 obj_04)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_04)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_13)
    (pred_6 obj_13 obj_10)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_06)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
