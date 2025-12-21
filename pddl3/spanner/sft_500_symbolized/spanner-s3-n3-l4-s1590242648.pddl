; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1590242648 --problem-name spanner-s3-n3-l4-s1590242648
(define (problem spanner-s3-n3-l4-s1590242648)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_07 obj_01 obj_11 - type_5
     obj_05 obj_02 obj_08 - type_4
     obj_04 obj_12 obj_06 obj_09 - type_2
     obj_13 obj_03 - type_2
    )
 (:init 
    (pred_2 obj_10 obj_13)
    (pred_2 obj_07 obj_06)
    (pred_1 obj_07)
    (pred_2 obj_01 obj_12)
    (pred_1 obj_01)
    (pred_2 obj_11 obj_06)
    (pred_1 obj_11)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_03)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_03)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_03)
    (pred_6 obj_13 obj_04)
    (pred_6 obj_09 obj_03)
    (pred_6 obj_04 obj_12)
    (pred_6 obj_12 obj_06)
    (pred_6 obj_06 obj_09)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_02)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_13)))
  )
)
)
