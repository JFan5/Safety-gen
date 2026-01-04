; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1627940967 --problem-name spanner-s3-n3-l4-s1627940967
(define (problem spanner-s3-n3-l4-s1627940967)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_11 obj_12 obj_13 - type_3
     obj_09 obj_01 obj_06 - type_4
     obj_07 obj_03 obj_04 obj_02 - type_2
     obj_08 obj_10 - type_2
    )
 (:init 
    (pred_3 obj_05 obj_08)
    (pred_3 obj_11 obj_03)
    (pred_5 obj_11)
    (pred_3 obj_12 obj_02)
    (pred_5 obj_12)
    (pred_3 obj_13 obj_07)
    (pred_5 obj_13)
    (pred_4 obj_09)
    (pred_3 obj_09 obj_10)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_10)
    (pred_4 obj_06)
    (pred_3 obj_06 obj_10)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_02 obj_10)
    (pred_6 obj_07 obj_03)
    (pred_6 obj_03 obj_04)
    (pred_6 obj_04 obj_02)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_08)))
  )
)
)
