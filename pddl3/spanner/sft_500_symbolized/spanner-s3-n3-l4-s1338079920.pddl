; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1338079920 --problem-name spanner-s3-n3-l4-s1338079920
(define (problem spanner-s3-n3-l4-s1338079920)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_11 obj_01 obj_12 - type_5
     obj_06 obj_02 obj_03 - type_4
     obj_10 obj_05 obj_08 obj_07 - type_1
     obj_04 obj_13 - type_1
    )
 (:init 
    (pred_5 obj_09 obj_04)
    (pred_5 obj_11 obj_05)
    (pred_4 obj_11)
    (pred_5 obj_01 obj_05)
    (pred_4 obj_01)
    (pred_5 obj_12 obj_08)
    (pred_4 obj_12)
    (pred_1 obj_06)
    (pred_5 obj_06 obj_13)
    (pred_1 obj_02)
    (pred_5 obj_02 obj_13)
    (pred_1 obj_03)
    (pred_5 obj_03 obj_13)
    (pred_2 obj_04 obj_10)
    (pred_2 obj_07 obj_13)
    (pred_2 obj_10 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_2 obj_08 obj_07)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_02)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
