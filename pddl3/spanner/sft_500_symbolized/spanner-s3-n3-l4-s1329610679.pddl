; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1329610679 --problem-name spanner-s3-n3-l4-s1329610679
(define (problem spanner-s3-n3-l4-s1329610679)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_03 obj_06 obj_01 - type_3
     obj_04 obj_07 obj_09 - type_4
     obj_02 obj_05 obj_10 obj_08 - type_1
     obj_12 obj_13 - type_1
    )
 (:init 
    (pred_3 obj_11 obj_12)
    (pred_3 obj_03 obj_05)
    (pred_5 obj_03)
    (pred_3 obj_06 obj_10)
    (pred_5 obj_06)
    (pred_3 obj_01 obj_10)
    (pred_5 obj_01)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_13)
    (pred_6 obj_07)
    (pred_3 obj_07 obj_13)
    (pred_6 obj_09)
    (pred_3 obj_09 obj_13)
    (pred_2 obj_12 obj_02)
    (pred_2 obj_08 obj_13)
    (pred_2 obj_02 obj_05)
    (pred_2 obj_05 obj_10)
    (pred_2 obj_10 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_07)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
