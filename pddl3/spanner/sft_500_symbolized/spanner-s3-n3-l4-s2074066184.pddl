; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2074066184 --problem-name spanner-s3-n3-l4-s2074066184
(define (problem spanner-s3-n3-l4-s2074066184)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_11 obj_05 obj_01 - type_3
     obj_12 obj_10 obj_02 - type_4
     obj_08 obj_13 obj_06 obj_07 - type_5
     obj_09 obj_03 - type_5
    )
 (:init 
    (pred_2 obj_04 obj_09)
    (pred_2 obj_11 obj_06)
    (pred_3 obj_11)
    (pred_2 obj_05 obj_08)
    (pred_3 obj_05)
    (pred_2 obj_01 obj_08)
    (pred_3 obj_01)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_03)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_03)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_03)
    (pred_4 obj_09 obj_08)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_08 obj_13)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_06 obj_07)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_10)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
