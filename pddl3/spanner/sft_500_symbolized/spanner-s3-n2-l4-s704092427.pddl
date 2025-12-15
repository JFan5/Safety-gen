; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 704092427 --problem-name spanner-s3-n2-l4-s704092427
(define (problem spanner-s3-n2-l4-s704092427)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_08 obj_10 obj_09 - type_5
     obj_12 obj_06 - type_1
     obj_04 obj_02 obj_11 obj_07 - type_2
     obj_01 obj_03 - type_2
    )
 (:init 
    (pred_4 obj_05 obj_01)
    (pred_4 obj_08 obj_07)
    (pred_5 obj_08)
    (pred_4 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_4 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_03)
    (pred_3 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_1 obj_01 obj_04)
    (pred_1 obj_07 obj_03)
    (pred_1 obj_04 obj_02)
    (pred_1 obj_02 obj_11)
    (pred_1 obj_11 obj_07)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
