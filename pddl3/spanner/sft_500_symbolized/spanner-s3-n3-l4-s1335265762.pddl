; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1335265762 --problem-name spanner-s3-n3-l4-s1335265762
(define (problem spanner-s3-n3-l4-s1335265762)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_01 obj_05 obj_04 - type_2
     obj_08 obj_03 obj_09 - type_4
     obj_02 obj_07 obj_12 obj_06 - type_3
     obj_11 obj_13 - type_3
    )
 (:init 
    (pred_5 obj_10 obj_11)
    (pred_5 obj_01 obj_07)
    (pred_4 obj_01)
    (pred_5 obj_05 obj_07)
    (pred_4 obj_05)
    (pred_5 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_1 obj_08)
    (pred_5 obj_08 obj_13)
    (pred_1 obj_03)
    (pred_5 obj_03 obj_13)
    (pred_1 obj_09)
    (pred_5 obj_09 obj_13)
    (pred_6 obj_11 obj_02)
    (pred_6 obj_06 obj_13)
    (pred_6 obj_02 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_6 obj_12 obj_06)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_03)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
