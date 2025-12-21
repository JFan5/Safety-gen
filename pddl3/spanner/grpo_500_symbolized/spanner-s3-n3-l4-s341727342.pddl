; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 341727342 --problem-name spanner-s3-n3-l4-s341727342
(define (problem spanner-s3-n3-l4-s341727342)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_13 obj_12 obj_07 - type_3
     obj_11 obj_03 obj_10 - type_1
     obj_08 obj_06 obj_02 obj_05 - type_2
     obj_04 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_04)
    (pred_6 obj_13 obj_06)
    (pred_5 obj_13)
    (pred_6 obj_12 obj_05)
    (pred_5 obj_12)
    (pred_6 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_09)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_09)
    (pred_3 obj_04 obj_08)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_05)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_03)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
