; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 38753764 --problem-name spanner-s3-n2-l4-s38753764
(define (problem spanner-s3-n2-l4-s38753764)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_11 obj_12 obj_02 - type_3
     obj_06 obj_05 - type_1
     obj_10 obj_04 obj_08 obj_09 - type_2
     obj_01 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_01)
    (pred_6 obj_11 obj_10)
    (pred_5 obj_11)
    (pred_6 obj_12 obj_10)
    (pred_5 obj_12)
    (pred_6 obj_02 obj_10)
    (pred_5 obj_02)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_03)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_09 obj_03)
    (pred_3 obj_10 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_3 obj_08 obj_09)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
