; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 275495377 --problem-name spanner-s3-n3-l4-s275495377
(define (problem spanner-s3-n3-l4-s275495377)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_08 obj_13 obj_12 - type_2
     obj_07 obj_06 obj_10 - type_5
     obj_01 obj_05 obj_04 obj_03 - type_1
     obj_09 obj_02 - type_1
    )
 (:init 
    (pred_1 obj_11 obj_09)
    (pred_1 obj_08 obj_01)
    (pred_2 obj_08)
    (pred_1 obj_13 obj_01)
    (pred_2 obj_13)
    (pred_1 obj_12 obj_04)
    (pred_2 obj_12)
    (pred_6 obj_07)
    (pred_1 obj_07 obj_02)
    (pred_6 obj_06)
    (pred_1 obj_06 obj_02)
    (pred_6 obj_10)
    (pred_1 obj_10 obj_02)
    (pred_5 obj_09 obj_01)
    (pred_5 obj_03 obj_02)
    (pred_5 obj_01 obj_05)
    (pred_5 obj_05 obj_04)
    (pred_5 obj_04 obj_03)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_06)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
