; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1724679265 --problem-name spanner-s3-n3-l4-s1724679265
(define (problem spanner-s3-n3-l4-s1724679265)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_13 obj_10 obj_12 - type_3
     obj_05 obj_09 obj_03 - type_2
     obj_01 obj_06 obj_07 obj_08 - type_5
     obj_11 obj_04 - type_5
    )
 (:init 
    (pred_3 obj_02 obj_11)
    (pred_3 obj_13 obj_01)
    (pred_1 obj_13)
    (pred_3 obj_10 obj_06)
    (pred_1 obj_10)
    (pred_3 obj_12 obj_07)
    (pred_1 obj_12)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_04)
    (pred_6 obj_11 obj_01)
    (pred_6 obj_08 obj_04)
    (pred_6 obj_01 obj_06)
    (pred_6 obj_06 obj_07)
    (pred_6 obj_07 obj_08)
)
 (:goal
  (and
   (pred_4 obj_05)
   (pred_4 obj_09)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_05)) (not (pred_4 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
