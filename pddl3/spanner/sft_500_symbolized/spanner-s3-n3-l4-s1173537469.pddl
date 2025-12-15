; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1173537469 --problem-name spanner-s3-n3-l4-s1173537469
(define (problem spanner-s3-n3-l4-s1173537469)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_09 obj_13 obj_04 - type_2
     obj_08 obj_03 obj_12 - type_1
     obj_10 obj_07 obj_11 obj_02 - type_4
     obj_01 obj_05 - type_4
    )
 (:init 
    (pred_3 obj_06 obj_01)
    (pred_3 obj_09 obj_07)
    (pred_4 obj_09)
    (pred_3 obj_13 obj_02)
    (pred_4 obj_13)
    (pred_3 obj_04 obj_07)
    (pred_4 obj_04)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_05)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_05)
    (pred_2 obj_01 obj_10)
    (pred_2 obj_02 obj_05)
    (pred_2 obj_10 obj_07)
    (pred_2 obj_07 obj_11)
    (pred_2 obj_11 obj_02)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_03)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
