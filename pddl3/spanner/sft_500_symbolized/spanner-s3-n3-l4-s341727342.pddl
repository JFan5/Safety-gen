; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 341727342 --problem-name spanner-s3-n3-l4-s341727342
(define (problem spanner-s3-n3-l4-s341727342)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_06 obj_10 obj_09 - type_4
     obj_04 obj_08 obj_07 - type_2
     obj_13 obj_03 obj_02 obj_12 - type_5
     obj_01 obj_11 - type_5
    )
 (:init 
    (pred_5 obj_05 obj_01)
    (pred_5 obj_06 obj_03)
    (pred_4 obj_06)
    (pred_5 obj_10 obj_12)
    (pred_4 obj_10)
    (pred_5 obj_09 obj_13)
    (pred_4 obj_09)
    (pred_1 obj_04)
    (pred_5 obj_04 obj_11)
    (pred_1 obj_08)
    (pred_5 obj_08 obj_11)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_11)
    (pred_3 obj_01 obj_13)
    (pred_3 obj_12 obj_11)
    (pred_3 obj_13 obj_03)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_02 obj_12)
)
 (:goal
  (and
   (pred_6 obj_04)
   (pred_6 obj_08)
   (pred_6 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
