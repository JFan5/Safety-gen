; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 848155990 --problem-name spanner-s3-n3-l4-s848155990
(define (problem spanner-s3-n3-l4-s848155990)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_10 obj_05 obj_09 - type_4
     obj_12 obj_13 obj_07 - type_2
     obj_04 obj_01 obj_03 obj_11 - type_3
     obj_08 obj_06 - type_3
    )
 (:init 
    (pred_1 obj_02 obj_08)
    (pred_1 obj_10 obj_11)
    (pred_6 obj_10)
    (pred_1 obj_05 obj_11)
    (pred_6 obj_05)
    (pred_1 obj_09 obj_11)
    (pred_6 obj_09)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_06)
    (pred_5 obj_13)
    (pred_1 obj_13 obj_06)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_06)
    (pred_4 obj_08 obj_04)
    (pred_4 obj_11 obj_06)
    (pred_4 obj_04 obj_01)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_03 obj_11)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_13)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
