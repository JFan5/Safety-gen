; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 918963307 --problem-name spanner-s3-n3-l4-s918963307
(define (problem spanner-s3-n3-l4-s918963307)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_01 obj_02 obj_04 - type_3
     obj_12 obj_07 obj_11 - type_1
     obj_09 obj_03 obj_06 obj_05 - type_2
     obj_08 obj_10 - type_2
    )
 (:init 
    (pred_6 obj_13 obj_08)
    (pred_6 obj_01 obj_09)
    (pred_5 obj_01)
    (pred_6 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_6 obj_04 obj_09)
    (pred_5 obj_04)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_10)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_10)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_10)
    (pred_3 obj_08 obj_09)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_09 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_3 obj_06 obj_05)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_07)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
