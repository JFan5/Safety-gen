; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1849218894 --problem-name spanner-s3-n3-l4-s1849218894
(define (problem spanner-s3-n3-l4-s1849218894)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_12 obj_08 obj_01 - type_5
     obj_05 obj_06 obj_11 - type_2
     obj_13 obj_09 obj_07 obj_10 - type_1
     obj_04 obj_02 - type_1
    )
 (:init 
    (pred_6 obj_03 obj_04)
    (pred_6 obj_12 obj_09)
    (pred_1 obj_12)
    (pred_6 obj_08 obj_10)
    (pred_1 obj_08)
    (pred_6 obj_01 obj_09)
    (pred_1 obj_01)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_02)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_02)
    (pred_2 obj_04 obj_13)
    (pred_2 obj_10 obj_02)
    (pred_2 obj_13 obj_09)
    (pred_2 obj_09 obj_07)
    (pred_2 obj_07 obj_10)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_06)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
