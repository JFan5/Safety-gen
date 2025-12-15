; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 869659796 --problem-name spanner-s3-n3-l4-s869659796
(define (problem spanner-s3-n3-l4-s869659796)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_05 obj_12 obj_11 - type_2
     obj_07 obj_13 obj_09 - type_4
     obj_03 obj_06 obj_02 obj_04 - type_1
     obj_08 obj_10 - type_1
    )
 (:init 
    (pred_2 obj_01 obj_08)
    (pred_2 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_2 obj_12 obj_04)
    (pred_4 obj_12)
    (pred_2 obj_11 obj_02)
    (pred_4 obj_11)
    (pred_1 obj_07)
    (pred_2 obj_07 obj_10)
    (pred_1 obj_13)
    (pred_2 obj_13 obj_10)
    (pred_1 obj_09)
    (pred_2 obj_09 obj_10)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_04 obj_10)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_6 obj_02 obj_04)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_13)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_13))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
