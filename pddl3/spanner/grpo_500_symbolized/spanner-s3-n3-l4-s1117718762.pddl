; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1117718762 --problem-name spanner-s3-n3-l4-s1117718762
(define (problem spanner-s3-n3-l4-s1117718762)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_09 obj_12 obj_04 - type_3
     obj_06 obj_07 obj_01 - type_1
     obj_03 obj_05 obj_08 obj_10 - type_2
     obj_11 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_13 obj_11)
    (pred_6 obj_09 obj_05)
    (pred_5 obj_09)
    (pred_6 obj_12 obj_10)
    (pred_5 obj_12)
    (pred_6 obj_04 obj_05)
    (pred_5 obj_04)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_02)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_02)
    (pred_3 obj_11 obj_03)
    (pred_3 obj_10 obj_02)
    (pred_3 obj_03 obj_05)
    (pred_3 obj_05 obj_08)
    (pred_3 obj_08 obj_10)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_07)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
