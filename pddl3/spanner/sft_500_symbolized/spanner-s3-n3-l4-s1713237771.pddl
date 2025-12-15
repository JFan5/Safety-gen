; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1713237771 --problem-name spanner-s3-n3-l4-s1713237771
(define (problem spanner-s3-n3-l4-s1713237771)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_12 obj_11 obj_07 - type_3
     obj_05 obj_06 obj_08 - type_4
     obj_13 obj_03 obj_04 obj_09 - type_5
     obj_02 obj_10 - type_5
    )
 (:init 
    (pred_5 obj_01 obj_02)
    (pred_5 obj_12 obj_04)
    (pred_1 obj_12)
    (pred_5 obj_11 obj_13)
    (pred_1 obj_11)
    (pred_5 obj_07 obj_13)
    (pred_1 obj_07)
    (pred_2 obj_05)
    (pred_5 obj_05 obj_10)
    (pred_2 obj_06)
    (pred_5 obj_06 obj_10)
    (pred_2 obj_08)
    (pred_5 obj_08 obj_10)
    (pred_6 obj_02 obj_13)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_13 obj_03)
    (pred_6 obj_03 obj_04)
    (pred_6 obj_04 obj_09)
)
 (:goal
  (and
   (pred_4 obj_05)
   (pred_4 obj_06)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_06)) (not (pred_4 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_02)))
  )
)
)
