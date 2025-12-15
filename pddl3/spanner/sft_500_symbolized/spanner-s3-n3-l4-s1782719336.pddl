; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1782719336 --problem-name spanner-s3-n3-l4-s1782719336
(define (problem spanner-s3-n3-l4-s1782719336)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_06 obj_04 obj_02 - type_4
     obj_07 obj_01 obj_08 - type_3
     obj_03 obj_05 obj_12 obj_11 - type_1
     obj_13 obj_10 - type_1
    )
 (:init 
    (pred_1 obj_09 obj_13)
    (pred_1 obj_06 obj_12)
    (pred_4 obj_06)
    (pred_1 obj_04 obj_11)
    (pred_4 obj_04)
    (pred_1 obj_02 obj_03)
    (pred_4 obj_02)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_10)
    (pred_3 obj_01)
    (pred_1 obj_01 obj_10)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_10)
    (pred_5 obj_13 obj_03)
    (pred_5 obj_11 obj_10)
    (pred_5 obj_03 obj_05)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_12 obj_11)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_01)
   (pred_6 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_01)) (not (pred_6 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_13)))
  )
)
)
