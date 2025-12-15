; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1338079920 --problem-name spanner-s3-n3-l4-s1338079920
(define (problem spanner-s3-n3-l4-s1338079920)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_06 obj_04 obj_03 - type_1
     obj_08 obj_10 obj_07 - type_4
     obj_11 obj_13 obj_02 obj_05 - type_5
     obj_12 obj_01 - type_5
    )
 (:init 
    (pred_4 obj_09 obj_12)
    (pred_4 obj_06 obj_13)
    (pred_6 obj_06)
    (pred_4 obj_04 obj_13)
    (pred_6 obj_04)
    (pred_4 obj_03 obj_02)
    (pred_6 obj_03)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_01)
    (pred_3 obj_10)
    (pred_4 obj_10 obj_01)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_01)
    (pred_1 obj_12 obj_11)
    (pred_1 obj_05 obj_01)
    (pred_1 obj_11 obj_13)
    (pred_1 obj_13 obj_02)
    (pred_1 obj_02 obj_05)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_10)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
