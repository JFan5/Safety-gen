; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 948014073 --problem-name spanner-s3-n2-l4-s948014073
(define (problem spanner-s3-n2-l4-s948014073)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_03 obj_12 obj_01 - type_3
     obj_09 obj_08 - type_1
     obj_06 obj_05 obj_04 obj_11 - type_2
     obj_02 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_10 obj_02)
    (pred_6 obj_03 obj_05)
    (pred_5 obj_03)
    (pred_6 obj_12 obj_05)
    (pred_5 obj_12)
    (pred_6 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_07)
    (pred_3 obj_02 obj_06)
    (pred_3 obj_11 obj_07)
    (pred_3 obj_06 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_04 obj_11)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
