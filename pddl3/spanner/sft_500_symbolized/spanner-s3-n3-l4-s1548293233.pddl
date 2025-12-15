; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1548293233 --problem-name spanner-s3-n3-l4-s1548293233
(define (problem spanner-s3-n3-l4-s1548293233)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_12 obj_13 obj_08 - type_5
     obj_11 obj_05 obj_02 - type_4
     obj_04 obj_01 obj_03 obj_07 - type_2
     obj_06 obj_09 - type_2
    )
 (:init 
    (pred_1 obj_10 obj_06)
    (pred_1 obj_12 obj_03)
    (pred_6 obj_12)
    (pred_1 obj_13 obj_03)
    (pred_6 obj_13)
    (pred_1 obj_08 obj_03)
    (pred_6 obj_08)
    (pred_2 obj_11)
    (pred_1 obj_11 obj_09)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_09)
    (pred_2 obj_02)
    (pred_1 obj_02 obj_09)
    (pred_4 obj_06 obj_04)
    (pred_4 obj_07 obj_09)
    (pred_4 obj_04 obj_01)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_03 obj_07)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_05)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_06)))
  )
)
)
