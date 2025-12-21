; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 685985339 --problem-name spanner-s3-n3-l4-s685985339
(define (problem spanner-s3-n3-l4-s685985339)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_08 obj_09 obj_07 - type_5
     obj_03 obj_10 obj_12 - type_4
     obj_02 obj_11 obj_05 obj_13 - type_2
     obj_06 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_01 obj_06)
    (pred_2 obj_08 obj_05)
    (pred_1 obj_08)
    (pred_2 obj_09 obj_11)
    (pred_1 obj_09)
    (pred_2 obj_07 obj_05)
    (pred_1 obj_07)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_04)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_04)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_04)
    (pred_6 obj_06 obj_02)
    (pred_6 obj_13 obj_04)
    (pred_6 obj_02 obj_11)
    (pred_6 obj_11 obj_05)
    (pred_6 obj_05 obj_13)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_10)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
