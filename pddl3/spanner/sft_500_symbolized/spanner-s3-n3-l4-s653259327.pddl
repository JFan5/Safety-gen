; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 653259327 --problem-name spanner-s3-n3-l4-s653259327
(define (problem spanner-s3-n3-l4-s653259327)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_11 obj_10 obj_01 - type_2
     obj_09 obj_13 obj_03 - type_1
     obj_04 obj_08 obj_05 obj_07 - type_3
     obj_02 obj_06 - type_3
    )
 (:init 
    (pred_6 obj_12 obj_02)
    (pred_6 obj_11 obj_08)
    (pred_5 obj_11)
    (pred_6 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_6 obj_01 obj_08)
    (pred_5 obj_01)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_06)
    (pred_2 obj_02 obj_04)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_04 obj_08)
    (pred_2 obj_08 obj_05)
    (pred_2 obj_05 obj_07)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_13)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
