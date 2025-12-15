; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 848155990 --problem-name spanner-s3-n3-l4-s848155990
(define (problem spanner-s3-n3-l4-s848155990)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_03 obj_12 obj_02 - type_5
     obj_10 obj_01 obj_07 - type_3
     obj_05 obj_13 obj_09 obj_06 - type_2
     obj_08 obj_11 - type_2
    )
 (:init 
    (pred_5 obj_04 obj_08)
    (pred_5 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_5 obj_12 obj_06)
    (pred_1 obj_12)
    (pred_5 obj_02 obj_06)
    (pred_1 obj_02)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_11)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_11)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_11)
    (pred_3 obj_08 obj_05)
    (pred_3 obj_06 obj_11)
    (pred_3 obj_05 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_3 obj_09 obj_06)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_01)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_08)))
  )
)
)
