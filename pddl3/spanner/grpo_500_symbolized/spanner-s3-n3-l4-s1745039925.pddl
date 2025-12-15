; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1745039925 --problem-name spanner-s3-n3-l4-s1745039925
(define (problem spanner-s3-n3-l4-s1745039925)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_08 obj_03 obj_02 - type_5
     obj_07 obj_13 obj_06 - type_1
     obj_09 obj_10 obj_05 obj_11 - type_3
     obj_01 obj_12 - type_3
    )
 (:init 
    (pred_3 obj_04 obj_01)
    (pred_3 obj_08 obj_10)
    (pred_1 obj_08)
    (pred_3 obj_03 obj_10)
    (pred_1 obj_03)
    (pred_3 obj_02 obj_10)
    (pred_1 obj_02)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_12)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_12)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_12)
    (pred_4 obj_01 obj_09)
    (pred_4 obj_11 obj_12)
    (pred_4 obj_09 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_11)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_13)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
