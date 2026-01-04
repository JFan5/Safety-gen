; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2009696243 --problem-name spanner-s3-n3-l4-s2009696243
(define (problem spanner-s3-n3-l4-s2009696243)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_05 obj_12 obj_01 - type_5
     obj_06 obj_04 obj_11 - type_2
     obj_10 obj_09 obj_02 obj_13 - type_1
     obj_08 obj_03 - type_1
    )
 (:init 
    (pred_1 obj_07 obj_08)
    (pred_1 obj_05 obj_09)
    (pred_3 obj_05)
    (pred_1 obj_12 obj_09)
    (pred_3 obj_12)
    (pred_1 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_2 obj_06)
    (pred_1 obj_06 obj_03)
    (pred_2 obj_04)
    (pred_1 obj_04 obj_03)
    (pred_2 obj_11)
    (pred_1 obj_11 obj_03)
    (pred_4 obj_08 obj_10)
    (pred_4 obj_13 obj_03)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_09 obj_02)
    (pred_4 obj_02 obj_13)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_04)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
