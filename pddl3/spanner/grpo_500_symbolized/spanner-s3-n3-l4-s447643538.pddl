; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 447643538 --problem-name spanner-s3-n3-l4-s447643538
(define (problem spanner-s3-n3-l4-s447643538)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_09 obj_03 obj_02 - type_3
     obj_12 obj_06 obj_10 - type_1
     obj_05 obj_07 obj_08 obj_13 - type_2
     obj_01 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_04 obj_01)
    (pred_6 obj_09 obj_05)
    (pred_5 obj_09)
    (pred_6 obj_03 obj_05)
    (pred_5 obj_03)
    (pred_6 obj_02 obj_08)
    (pred_5 obj_02)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_11)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_11)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_11)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_13 obj_11)
    (pred_3 obj_05 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_3 obj_08 obj_13)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_06)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
