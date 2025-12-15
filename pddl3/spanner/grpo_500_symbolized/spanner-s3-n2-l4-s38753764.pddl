; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 38753764 --problem-name spanner-s3-n2-l4-s38753764
(define (problem spanner-s3-n2-l4-s38753764)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_12 obj_04 obj_09 - type_5
     obj_03 obj_07 - type_1
     obj_01 obj_02 obj_11 obj_06 - type_3
     obj_10 obj_08 - type_3
    )
 (:init 
    (pred_3 obj_05 obj_10)
    (pred_3 obj_12 obj_01)
    (pred_1 obj_12)
    (pred_3 obj_04 obj_01)
    (pred_1 obj_04)
    (pred_3 obj_09 obj_01)
    (pred_1 obj_09)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_4 obj_10 obj_01)
    (pred_4 obj_06 obj_08)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_02 obj_11)
    (pred_4 obj_11 obj_06)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
