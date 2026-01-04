; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1159031573 --problem-name spanner-s3-n3-l4-s1159031573
(define (problem spanner-s3-n3-l4-s1159031573)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_11 obj_07 obj_12 - type_4
     obj_05 obj_03 obj_13 - type_2
     obj_10 obj_01 obj_09 obj_02 - type_3
     obj_08 obj_04 - type_3
    )
 (:init 
    (pred_2 obj_06 obj_08)
    (pred_2 obj_11 obj_09)
    (pred_6 obj_11)
    (pred_2 obj_07 obj_09)
    (pred_6 obj_07)
    (pred_2 obj_12 obj_01)
    (pred_6 obj_12)
    (pred_4 obj_05)
    (pred_2 obj_05 obj_04)
    (pred_4 obj_03)
    (pred_2 obj_03 obj_04)
    (pred_4 obj_13)
    (pred_2 obj_13 obj_04)
    (pred_3 obj_08 obj_10)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_09)
    (pred_3 obj_09 obj_02)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_03)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
