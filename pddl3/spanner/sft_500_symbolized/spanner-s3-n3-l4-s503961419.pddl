; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 503961419 --problem-name spanner-s3-n3-l4-s503961419
(define (problem spanner-s3-n3-l4-s503961419)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_13 obj_03 obj_07 - type_3
     obj_08 obj_10 obj_09 - type_1
     obj_12 obj_01 obj_06 obj_11 - type_4
     obj_02 obj_05 - type_4
    )
 (:init 
    (pred_5 obj_04 obj_02)
    (pred_5 obj_13 obj_12)
    (pred_1 obj_13)
    (pred_5 obj_03 obj_12)
    (pred_1 obj_03)
    (pred_5 obj_07 obj_06)
    (pred_1 obj_07)
    (pred_2 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_2 obj_10)
    (pred_5 obj_10 obj_05)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_05)
    (pred_4 obj_02 obj_12)
    (pred_4 obj_11 obj_05)
    (pred_4 obj_12 obj_01)
    (pred_4 obj_01 obj_06)
    (pred_4 obj_06 obj_11)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_10)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_02)))
  )
)
)
