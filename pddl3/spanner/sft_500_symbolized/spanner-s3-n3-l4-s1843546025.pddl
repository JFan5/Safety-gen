; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1843546025 --problem-name spanner-s3-n3-l4-s1843546025
(define (problem spanner-s3-n3-l4-s1843546025)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_11 obj_08 obj_07 - type_4
     obj_13 obj_06 obj_12 - type_5
     obj_05 obj_03 obj_10 obj_09 - type_3
     obj_04 obj_01 - type_3
    )
 (:init 
    (pred_5 obj_02 obj_04)
    (pred_5 obj_11 obj_05)
    (pred_3 obj_11)
    (pred_5 obj_08 obj_09)
    (pred_3 obj_08)
    (pred_5 obj_07 obj_10)
    (pred_3 obj_07)
    (pred_1 obj_13)
    (pred_5 obj_13 obj_01)
    (pred_1 obj_06)
    (pred_5 obj_06 obj_01)
    (pred_1 obj_12)
    (pred_5 obj_12 obj_01)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_09 obj_01)
    (pred_6 obj_05 obj_03)
    (pred_6 obj_03 obj_10)
    (pred_6 obj_10 obj_09)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_06)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
