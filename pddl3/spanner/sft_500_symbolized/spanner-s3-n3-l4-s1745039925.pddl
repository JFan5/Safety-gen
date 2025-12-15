; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1745039925 --problem-name spanner-s3-n3-l4-s1745039925
(define (problem spanner-s3-n3-l4-s1745039925)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_13 obj_07 obj_05 - type_4
     obj_01 obj_08 obj_03 - type_2
     obj_04 obj_09 obj_02 obj_10 - type_3
     obj_12 obj_11 - type_3
    )
 (:init 
    (pred_2 obj_06 obj_12)
    (pred_2 obj_13 obj_09)
    (pred_6 obj_13)
    (pred_2 obj_07 obj_09)
    (pred_6 obj_07)
    (pred_2 obj_05 obj_09)
    (pred_6 obj_05)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_11)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_11)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_4 obj_12 obj_04)
    (pred_4 obj_10 obj_11)
    (pred_4 obj_04 obj_09)
    (pred_4 obj_09 obj_02)
    (pred_4 obj_02 obj_10)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_08)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
