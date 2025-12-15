; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2098909602 --problem-name spanner-s3-n3-l4-s2098909602
(define (problem spanner-s3-n3-l4-s2098909602)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_02 obj_10 obj_01 - type_1
     obj_04 obj_11 obj_06 - type_2
     obj_12 obj_03 obj_07 obj_08 - type_5
     obj_09 obj_13 - type_5
    )
 (:init 
    (pred_6 obj_05 obj_09)
    (pred_6 obj_02 obj_08)
    (pred_3 obj_02)
    (pred_6 obj_10 obj_08)
    (pred_3 obj_10)
    (pred_6 obj_01 obj_08)
    (pred_3 obj_01)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_13)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_13)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_13)
    (pred_2 obj_09 obj_12)
    (pred_2 obj_08 obj_13)
    (pred_2 obj_12 obj_03)
    (pred_2 obj_03 obj_07)
    (pred_2 obj_07 obj_08)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_11)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
