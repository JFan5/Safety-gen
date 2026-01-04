; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 552928 --problem-name spanner-s3-n3-l4-s552928
(define (problem spanner-s3-n3-l4-s552928)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_06 obj_01 obj_12 - type_1
     obj_13 obj_07 obj_10 - type_4
     obj_02 obj_08 obj_11 obj_03 - type_5
     obj_04 obj_05 - type_5
    )
 (:init 
    (pred_1 obj_09 obj_04)
    (pred_1 obj_06 obj_08)
    (pred_4 obj_06)
    (pred_1 obj_01 obj_03)
    (pred_4 obj_01)
    (pred_1 obj_12 obj_08)
    (pred_4 obj_12)
    (pred_5 obj_13)
    (pred_1 obj_13 obj_05)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_05)
    (pred_5 obj_10)
    (pred_1 obj_10 obj_05)
    (pred_2 obj_04 obj_02)
    (pred_2 obj_03 obj_05)
    (pred_2 obj_02 obj_08)
    (pred_2 obj_08 obj_11)
    (pred_2 obj_11 obj_03)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_07)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
