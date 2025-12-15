; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1274572435 --problem-name spanner-s3-n3-l4-s1274572435
(define (problem spanner-s3-n3-l4-s1274572435)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_08 obj_10 obj_13 - type_3
     obj_11 obj_09 obj_01 - type_4
     obj_03 obj_07 obj_06 obj_02 - type_2
     obj_12 obj_05 - type_2
    )
 (:init 
    (pred_4 obj_04 obj_12)
    (pred_4 obj_08 obj_03)
    (pred_5 obj_08)
    (pred_4 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_4 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_6 obj_11)
    (pred_4 obj_11 obj_05)
    (pred_6 obj_09)
    (pred_4 obj_09 obj_05)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_05)
    (pred_3 obj_12 obj_03)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_07 obj_06)
    (pred_3 obj_06 obj_02)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_09)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
