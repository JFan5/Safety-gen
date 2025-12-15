; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 586063818 --problem-name spanner-s3-n3-l4-s586063818
(define (problem spanner-s3-n3-l4-s586063818)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_08 obj_01 obj_11 - type_3
     obj_09 obj_07 obj_05 - type_2
     obj_10 obj_13 obj_06 obj_12 - type_1
     obj_02 obj_03 - type_1
    )
 (:init 
    (pred_2 obj_04 obj_02)
    (pred_2 obj_08 obj_06)
    (pred_3 obj_08)
    (pred_2 obj_01 obj_10)
    (pred_3 obj_01)
    (pred_2 obj_11 obj_10)
    (pred_3 obj_11)
    (pred_4 obj_09)
    (pred_2 obj_09 obj_03)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_03)
    (pred_4 obj_05)
    (pred_2 obj_05 obj_03)
    (pred_5 obj_02 obj_10)
    (pred_5 obj_12 obj_03)
    (pred_5 obj_10 obj_13)
    (pred_5 obj_13 obj_06)
    (pred_5 obj_06 obj_12)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_07)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
