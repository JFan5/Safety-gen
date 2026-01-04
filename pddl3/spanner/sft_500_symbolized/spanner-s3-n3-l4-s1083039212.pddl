; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1083039212 --problem-name spanner-s3-n3-l4-s1083039212
(define (problem spanner-s3-n3-l4-s1083039212)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_08 obj_03 obj_07 - type_1
     obj_13 obj_09 obj_06 - type_2
     obj_11 obj_02 obj_10 obj_04 - type_5
     obj_05 obj_01 - type_5
    )
 (:init 
    (pred_4 obj_12 obj_05)
    (pred_4 obj_08 obj_11)
    (pred_6 obj_08)
    (pred_4 obj_03 obj_02)
    (pred_6 obj_03)
    (pred_4 obj_07 obj_11)
    (pred_6 obj_07)
    (pred_2 obj_13)
    (pred_4 obj_13 obj_01)
    (pred_2 obj_09)
    (pred_4 obj_09 obj_01)
    (pred_2 obj_06)
    (pred_4 obj_06 obj_01)
    (pred_5 obj_05 obj_11)
    (pred_5 obj_04 obj_01)
    (pred_5 obj_11 obj_02)
    (pred_5 obj_02 obj_10)
    (pred_5 obj_10 obj_04)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_09)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
