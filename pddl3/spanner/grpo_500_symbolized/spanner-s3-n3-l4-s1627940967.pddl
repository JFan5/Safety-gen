; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1627940967 --problem-name spanner-s3-n3-l4-s1627940967
(define (problem spanner-s3-n3-l4-s1627940967)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_13 obj_05 obj_02 - type_3
     obj_10 obj_01 obj_09 - type_1
     obj_06 obj_07 obj_04 obj_08 - type_2
     obj_11 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_11)
    (pred_6 obj_13 obj_07)
    (pred_5 obj_13)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_6 obj_02 obj_06)
    (pred_5 obj_02)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_03)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_03)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_03)
    (pred_3 obj_11 obj_06)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_06 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_3 obj_04 obj_08)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_01)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_01))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
