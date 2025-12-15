; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 886415740 --problem-name spanner-s3-n3-l4-s886415740
(define (problem spanner-s3-n3-l4-s886415740)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_10 obj_07 obj_02 - type_2
     obj_12 obj_13 obj_09 - type_3
     obj_03 obj_01 obj_05 obj_04 - type_4
     obj_08 obj_11 - type_4
    )
 (:init 
    (pred_6 obj_06 obj_08)
    (pred_6 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_6 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_6 obj_02 obj_03)
    (pred_1 obj_02)
    (pred_2 obj_12)
    (pred_6 obj_12 obj_11)
    (pred_2 obj_13)
    (pred_6 obj_13 obj_11)
    (pred_2 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_03 obj_01)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_05 obj_04)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_13)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_13)) (not (pred_4 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
