; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 930706115 --problem-name spanner-s3-n3-l4-s930706115
(define (problem spanner-s3-n3-l4-s930706115)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_13 obj_09 obj_11 - type_3
     obj_01 obj_12 obj_05 - type_1
     obj_04 obj_02 obj_08 obj_10 - type_2
     obj_06 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_06)
    (pred_6 obj_13 obj_02)
    (pred_5 obj_13)
    (pred_6 obj_09 obj_10)
    (pred_5 obj_09)
    (pred_6 obj_11 obj_08)
    (pred_5 obj_11)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_07)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_07)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_07)
    (pred_3 obj_06 obj_04)
    (pred_3 obj_10 obj_07)
    (pred_3 obj_04 obj_02)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_08 obj_10)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_12)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
