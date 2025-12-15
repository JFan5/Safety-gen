; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1811345436 --problem-name spanner-s3-n2-l4-s1811345436
(define (problem spanner-s3-n2-l4-s1811345436)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_01 obj_11 obj_10 - type_3
     obj_06 obj_09 - type_5
     obj_08 obj_07 obj_05 obj_04 - type_2
     obj_02 obj_03 - type_2
    )
 (:init 
    (pred_1 obj_12 obj_02)
    (pred_1 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_1 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_1 obj_10 obj_05)
    (pred_5 obj_10)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_03)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_03)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_04 obj_03)
    (pred_3 obj_08 obj_07)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_05 obj_04)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
