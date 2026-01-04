; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1041154590 --problem-name spanner-s3-n3-l4-s1041154590
(define (problem spanner-s3-n3-l4-s1041154590)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_10 obj_01 obj_12 - type_1
     obj_07 obj_02 obj_09 - type_2
     obj_03 obj_13 obj_06 obj_08 - type_5
     obj_05 obj_11 - type_5
    )
 (:init 
    (pred_3 obj_04 obj_05)
    (pred_3 obj_10 obj_06)
    (pred_1 obj_10)
    (pred_3 obj_01 obj_03)
    (pred_1 obj_01)
    (pred_3 obj_12 obj_13)
    (pred_1 obj_12)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_11)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_11)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_11)
    (pred_6 obj_05 obj_03)
    (pred_6 obj_08 obj_11)
    (pred_6 obj_03 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_06 obj_08)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_02)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
