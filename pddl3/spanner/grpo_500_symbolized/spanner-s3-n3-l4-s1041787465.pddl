; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1041787465 --problem-name spanner-s3-n3-l4-s1041787465
(define (problem spanner-s3-n3-l4-s1041787465)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_04 obj_06 obj_12 - type_3
     obj_11 obj_13 obj_09 - type_1
     obj_01 obj_10 obj_02 obj_05 - type_2
     obj_07 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_07)
    (pred_6 obj_04 obj_02)
    (pred_5 obj_04)
    (pred_6 obj_06 obj_05)
    (pred_5 obj_06)
    (pred_6 obj_12 obj_10)
    (pred_5 obj_12)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_03)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_03)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_03)
    (pred_3 obj_07 obj_01)
    (pred_3 obj_05 obj_03)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_10 obj_02)
    (pred_3 obj_02 obj_05)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_13)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
