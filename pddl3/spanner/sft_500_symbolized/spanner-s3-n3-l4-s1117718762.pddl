; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1117718762 --problem-name spanner-s3-n3-l4-s1117718762
(define (problem spanner-s3-n3-l4-s1117718762)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_07 obj_10 obj_02 - type_1
     obj_01 obj_06 obj_03 - type_5
     obj_12 obj_04 obj_11 obj_13 - type_3
     obj_08 obj_05 - type_3
    )
 (:init 
    (pred_1 obj_09 obj_08)
    (pred_1 obj_07 obj_04)
    (pred_4 obj_07)
    (pred_1 obj_10 obj_13)
    (pred_4 obj_10)
    (pred_1 obj_02 obj_04)
    (pred_4 obj_02)
    (pred_5 obj_01)
    (pred_1 obj_01 obj_05)
    (pred_5 obj_06)
    (pred_1 obj_06 obj_05)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_05)
    (pred_2 obj_08 obj_12)
    (pred_2 obj_13 obj_05)
    (pred_2 obj_12 obj_04)
    (pred_2 obj_04 obj_11)
    (pred_2 obj_11 obj_13)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_06)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_01)) (not (pred_6 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
