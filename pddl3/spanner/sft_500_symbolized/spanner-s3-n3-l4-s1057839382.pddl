; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1057839382 --problem-name spanner-s3-n3-l4-s1057839382
(define (problem spanner-s3-n3-l4-s1057839382)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_02 obj_04 obj_06 - type_1
     obj_03 obj_09 obj_07 - type_2
     obj_11 obj_10 obj_08 obj_13 - type_4
     obj_12 obj_01 - type_4
    )
 (:init 
    (pred_5 obj_05 obj_12)
    (pred_5 obj_02 obj_11)
    (pred_4 obj_02)
    (pred_5 obj_04 obj_13)
    (pred_4 obj_04)
    (pred_5 obj_06 obj_08)
    (pred_4 obj_06)
    (pred_1 obj_03)
    (pred_5 obj_03 obj_01)
    (pred_1 obj_09)
    (pred_5 obj_09 obj_01)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_01)
    (pred_6 obj_12 obj_11)
    (pred_6 obj_13 obj_01)
    (pred_6 obj_11 obj_10)
    (pred_6 obj_10 obj_08)
    (pred_6 obj_08 obj_13)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_09)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
