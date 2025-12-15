; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1329610679 --problem-name spanner-s3-n3-l4-s1329610679
(define (problem spanner-s3-n3-l4-s1329610679)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_02 obj_05 obj_01 - type_3
     obj_10 obj_08 obj_12 - type_5
     obj_03 obj_06 obj_09 obj_13 - type_1
     obj_04 obj_07 - type_1
    )
 (:init 
    (pred_1 obj_11 obj_04)
    (pred_1 obj_02 obj_06)
    (pred_3 obj_02)
    (pred_1 obj_05 obj_09)
    (pred_3 obj_05)
    (pred_1 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_2 obj_10)
    (pred_1 obj_10 obj_07)
    (pred_2 obj_08)
    (pred_1 obj_08 obj_07)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_07)
    (pred_5 obj_04 obj_03)
    (pred_5 obj_13 obj_07)
    (pred_5 obj_03 obj_06)
    (pred_5 obj_06 obj_09)
    (pred_5 obj_09 obj_13)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_08)
   (pred_6 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
