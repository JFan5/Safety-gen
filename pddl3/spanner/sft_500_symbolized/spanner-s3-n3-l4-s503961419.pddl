; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 503961419 --problem-name spanner-s3-n3-l4-s503961419
(define (problem spanner-s3-n3-l4-s503961419)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_12 obj_13 obj_05 - type_3
     obj_07 obj_04 obj_06 - type_4
     obj_09 obj_02 obj_03 obj_08 - type_5
     obj_10 obj_11 - type_5
    )
 (:init 
    (pred_1 obj_01 obj_10)
    (pred_1 obj_12 obj_09)
    (pred_3 obj_12)
    (pred_1 obj_13 obj_09)
    (pred_3 obj_13)
    (pred_1 obj_05 obj_03)
    (pred_3 obj_05)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_11)
    (pred_5 obj_04)
    (pred_1 obj_04 obj_11)
    (pred_5 obj_06)
    (pred_1 obj_06 obj_11)
    (pred_2 obj_10 obj_09)
    (pred_2 obj_08 obj_11)
    (pred_2 obj_09 obj_02)
    (pred_2 obj_02 obj_03)
    (pred_2 obj_03 obj_08)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_04)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_10)))
  )
)
)
