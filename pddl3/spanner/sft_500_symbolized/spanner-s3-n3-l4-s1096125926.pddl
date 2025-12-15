; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1096125926 --problem-name spanner-s3-n3-l4-s1096125926
(define (problem spanner-s3-n3-l4-s1096125926)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_10 obj_04 obj_05 - type_2
     obj_02 obj_01 obj_03 - type_4
     obj_12 obj_11 obj_08 obj_07 - type_5
     obj_09 obj_06 - type_5
    )
 (:init 
    (pred_1 obj_13 obj_09)
    (pred_1 obj_10 obj_08)
    (pred_4 obj_10)
    (pred_1 obj_04 obj_11)
    (pred_4 obj_04)
    (pred_1 obj_05 obj_08)
    (pred_4 obj_05)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_06)
    (pred_5 obj_01)
    (pred_1 obj_01 obj_06)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_06)
    (pred_2 obj_09 obj_12)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_12 obj_11)
    (pred_2 obj_11 obj_08)
    (pred_2 obj_08 obj_07)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_01)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
