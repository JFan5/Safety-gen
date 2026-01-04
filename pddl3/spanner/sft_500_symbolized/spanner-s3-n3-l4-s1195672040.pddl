; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1195672040 --problem-name spanner-s3-n3-l4-s1195672040
(define (problem spanner-s3-n3-l4-s1195672040)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_04 obj_12 obj_02 - type_5
     obj_06 obj_10 obj_13 - type_4
     obj_08 obj_05 obj_11 obj_01 - type_2
     obj_03 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_03)
    (pred_6 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_6 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_6 obj_02 obj_11)
    (pred_5 obj_02)
    (pred_3 obj_06)
    (pred_6 obj_06 obj_09)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_09)
    (pred_3 obj_13)
    (pred_6 obj_13 obj_09)
    (pred_1 obj_03 obj_08)
    (pred_1 obj_01 obj_09)
    (pred_1 obj_08 obj_05)
    (pred_1 obj_05 obj_11)
    (pred_1 obj_11 obj_01)
)
 (:goal
  (and
   (pred_4 obj_06)
   (pred_4 obj_10)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_06)) (not (pred_4 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
