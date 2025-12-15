; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1057839382 --problem-name spanner-s3-n3-l4-s1057839382
(define (problem spanner-s3-n3-l4-s1057839382)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_04 obj_06 obj_12 - type_4
     obj_08 obj_09 obj_05 - type_1
     obj_01 obj_02 obj_07 obj_13 - type_3
     obj_03 obj_10 - type_3
    )
 (:init 
    (pred_5 obj_11 obj_03)
    (pred_5 obj_04 obj_01)
    (pred_6 obj_04)
    (pred_5 obj_06 obj_13)
    (pred_6 obj_06)
    (pred_5 obj_12 obj_07)
    (pred_6 obj_12)
    (pred_1 obj_08)
    (pred_5 obj_08 obj_10)
    (pred_1 obj_09)
    (pred_5 obj_09 obj_10)
    (pred_1 obj_05)
    (pred_5 obj_05 obj_10)
    (pred_3 obj_03 obj_01)
    (pred_3 obj_13 obj_10)
    (pred_3 obj_01 obj_02)
    (pred_3 obj_02 obj_07)
    (pred_3 obj_07 obj_13)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_09)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
