; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1958504129 --problem-name spanner-s3-n3-l4-s1958504129
(define (problem spanner-s3-n3-l4-s1958504129)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_04 obj_13 obj_02 - type_2
     obj_11 obj_12 obj_07 - type_1
     obj_10 obj_06 obj_05 obj_03 - type_4
     obj_09 obj_01 - type_4
    )
 (:init 
    (pred_2 obj_08 obj_09)
    (pred_2 obj_04 obj_05)
    (pred_4 obj_04)
    (pred_2 obj_13 obj_03)
    (pred_4 obj_13)
    (pred_2 obj_02 obj_10)
    (pred_4 obj_02)
    (pred_6 obj_11)
    (pred_2 obj_11 obj_01)
    (pred_6 obj_12)
    (pred_2 obj_12 obj_01)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_01)
    (pred_5 obj_09 obj_10)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_10 obj_06)
    (pred_5 obj_06 obj_05)
    (pred_5 obj_05 obj_03)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_12)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
