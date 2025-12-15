; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 948014073 --problem-name spanner-s3-n2-l4-s948014073
(define (problem spanner-s3-n2-l4-s948014073)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_12 obj_05 obj_11 - type_5
     obj_07 obj_10 - type_1
     obj_02 obj_01 obj_03 obj_09 - type_3
     obj_06 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_06)
    (pred_3 obj_12 obj_01)
    (pred_1 obj_12)
    (pred_3 obj_05 obj_01)
    (pred_1 obj_05)
    (pred_3 obj_11 obj_03)
    (pred_1 obj_11)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_04)
    (pred_4 obj_06 obj_02)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_03 obj_09)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
