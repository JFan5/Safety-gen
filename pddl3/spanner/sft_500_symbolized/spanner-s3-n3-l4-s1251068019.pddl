; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1251068019 --problem-name spanner-s3-n3-l4-s1251068019
(define (problem spanner-s3-n3-l4-s1251068019)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_13 obj_12 obj_02 - type_3
     obj_07 obj_04 obj_10 - type_1
     obj_03 obj_06 obj_05 obj_09 - type_4
     obj_08 obj_01 - type_4
    )
 (:init 
    (pred_6 obj_11 obj_08)
    (pred_6 obj_13 obj_05)
    (pred_5 obj_13)
    (pred_6 obj_12 obj_05)
    (pred_5 obj_12)
    (pred_6 obj_02 obj_05)
    (pred_5 obj_02)
    (pred_1 obj_07)
    (pred_6 obj_07 obj_01)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_01)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_01)
    (pred_2 obj_08 obj_03)
    (pred_2 obj_09 obj_01)
    (pred_2 obj_03 obj_06)
    (pred_2 obj_06 obj_05)
    (pred_2 obj_05 obj_09)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_04)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
