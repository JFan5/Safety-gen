; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2124237944 --problem-name spanner-s3-n3-l4-s2124237944
(define (problem spanner-s3-n3-l4-s2124237944)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_11 obj_13 obj_08 - type_5
     obj_03 obj_05 obj_02 - type_1
     obj_06 obj_01 obj_12 obj_10 - type_4
     obj_04 obj_09 - type_4
    )
 (:init 
    (pred_2 obj_07 obj_04)
    (pred_2 obj_11 obj_12)
    (pred_4 obj_11)
    (pred_2 obj_13 obj_12)
    (pred_4 obj_13)
    (pred_2 obj_08 obj_06)
    (pred_4 obj_08)
    (pred_3 obj_03)
    (pred_2 obj_03 obj_09)
    (pred_3 obj_05)
    (pred_2 obj_05 obj_09)
    (pred_3 obj_02)
    (pred_2 obj_02 obj_09)
    (pred_5 obj_04 obj_06)
    (pred_5 obj_10 obj_09)
    (pred_5 obj_06 obj_01)
    (pred_5 obj_01 obj_12)
    (pred_5 obj_12 obj_10)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_05)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
