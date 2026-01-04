; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 587750172 --problem-name spanner-s3-n3-l4-s587750172
(define (problem spanner-s3-n3-l4-s587750172)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_12 obj_13 obj_08 - type_1
     obj_05 obj_09 obj_07 - type_4
     obj_01 obj_10 obj_06 obj_11 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_3 obj_03 obj_02)
    (pred_3 obj_12 obj_06)
    (pred_5 obj_12)
    (pred_3 obj_13 obj_10)
    (pred_5 obj_13)
    (pred_3 obj_08 obj_06)
    (pred_5 obj_08)
    (pred_4 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_4 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_4 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_1 obj_02 obj_01)
    (pred_1 obj_11 obj_04)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_10 obj_06)
    (pred_1 obj_06 obj_11)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_09)
   (pred_6 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
