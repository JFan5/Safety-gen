; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 3826487 --problem-name spanner-s3-n2-l4-s3826487
(define (problem spanner-s3-n2-l4-s3826487)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_09 obj_01 obj_03 - type_3
     obj_05 obj_08 - type_1
     obj_10 obj_06 obj_12 obj_11 - type_2
     obj_04 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_04)
    (pred_6 obj_09 obj_12)
    (pred_5 obj_09)
    (pred_6 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_6 obj_03 obj_12)
    (pred_5 obj_03)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_02)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_02)
    (pred_3 obj_04 obj_10)
    (pred_3 obj_11 obj_02)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_06 obj_12)
    (pred_3 obj_12 obj_11)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
