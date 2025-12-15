; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 587750172 --problem-name spanner-s3-n3-l4-s587750172
(define (problem spanner-s3-n3-l4-s587750172)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_02 obj_10 obj_13 - type_3
     obj_07 obj_03 obj_08 - type_1
     obj_01 obj_12 obj_04 obj_09 - type_5
     obj_11 obj_05 - type_5
    )
 (:init 
    (pred_6 obj_06 obj_11)
    (pred_6 obj_02 obj_04)
    (pred_3 obj_02)
    (pred_6 obj_10 obj_12)
    (pred_3 obj_10)
    (pred_6 obj_13 obj_04)
    (pred_3 obj_13)
    (pred_5 obj_07)
    (pred_6 obj_07 obj_05)
    (pred_5 obj_03)
    (pred_6 obj_03 obj_05)
    (pred_5 obj_08)
    (pred_6 obj_08 obj_05)
    (pred_4 obj_11 obj_01)
    (pred_4 obj_09 obj_05)
    (pred_4 obj_01 obj_12)
    (pred_4 obj_12 obj_04)
    (pred_4 obj_04 obj_09)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_03)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
