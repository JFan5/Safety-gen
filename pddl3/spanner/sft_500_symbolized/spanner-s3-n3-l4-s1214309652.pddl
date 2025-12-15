; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1214309652 --problem-name spanner-s3-n3-l4-s1214309652
(define (problem spanner-s3-n3-l4-s1214309652)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_10 obj_08 obj_07 - type_2
     obj_03 obj_06 obj_13 - type_5
     obj_05 obj_04 obj_02 obj_12 - type_1
     obj_09 obj_11 - type_1
    )
 (:init 
    (pred_2 obj_01 obj_09)
    (pred_2 obj_10 obj_02)
    (pred_6 obj_10)
    (pred_2 obj_08 obj_02)
    (pred_6 obj_08)
    (pred_2 obj_07 obj_04)
    (pred_6 obj_07)
    (pred_1 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_06)
    (pred_2 obj_06 obj_11)
    (pred_1 obj_13)
    (pred_2 obj_13 obj_11)
    (pred_5 obj_09 obj_05)
    (pred_5 obj_12 obj_11)
    (pred_5 obj_05 obj_04)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_02 obj_12)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_06)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_06)) (not (pred_4 obj_13))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
