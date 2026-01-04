; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2098909602 --problem-name spanner-s3-n3-l4-s2098909602
(define (problem spanner-s3-n3-l4-s2098909602)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_13 obj_07 obj_04 - type_4
     obj_10 obj_01 obj_08 - type_2
     obj_06 obj_09 obj_12 obj_02 - type_3
     obj_11 obj_05 - type_3
    )
 (:init 
    (pred_2 obj_03 obj_11)
    (pred_2 obj_13 obj_02)
    (pred_5 obj_13)
    (pred_2 obj_07 obj_02)
    (pred_5 obj_07)
    (pred_2 obj_04 obj_02)
    (pred_5 obj_04)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_05)
    (pred_1 obj_01)
    (pred_2 obj_01 obj_05)
    (pred_1 obj_08)
    (pred_2 obj_08 obj_05)
    (pred_6 obj_11 obj_06)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_06 obj_09)
    (pred_6 obj_09 obj_12)
    (pred_6 obj_12 obj_02)
)
 (:goal
  (and
   (pred_4 obj_10)
   (pred_4 obj_01)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
