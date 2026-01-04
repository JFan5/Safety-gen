; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2007706533 --problem-name spanner-s3-n3-l4-s2007706533
(define (problem spanner-s3-n3-l4-s2007706533)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_05 obj_06 obj_02 - type_3
     obj_12 obj_09 obj_10 - type_2
     obj_11 obj_03 obj_08 obj_04 - type_4
     obj_01 obj_07 - type_4
    )
 (:init 
    (pred_6 obj_13 obj_01)
    (pred_6 obj_05 obj_03)
    (pred_3 obj_05)
    (pred_6 obj_06 obj_11)
    (pred_3 obj_06)
    (pred_6 obj_02 obj_08)
    (pred_3 obj_02)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_07)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_07)
    (pred_2 obj_01 obj_11)
    (pred_2 obj_04 obj_07)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_08 obj_04)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_09)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
