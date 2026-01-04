; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 586063818 --problem-name spanner-s3-n3-l4-s586063818
(define (problem spanner-s3-n3-l4-s586063818)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_09 obj_05 obj_04 - type_3
     obj_12 obj_07 obj_13 - type_1
     obj_01 obj_03 obj_08 obj_10 - type_2
     obj_02 obj_11 - type_2
    )
 (:init 
    (pred_5 obj_06 obj_02)
    (pred_5 obj_09 obj_08)
    (pred_6 obj_09)
    (pred_5 obj_05 obj_01)
    (pred_6 obj_05)
    (pred_5 obj_04 obj_01)
    (pred_6 obj_04)
    (pred_2 obj_12)
    (pred_5 obj_12 obj_11)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_11)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_11)
    (pred_3 obj_02 obj_01)
    (pred_3 obj_10 obj_11)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_08 obj_10)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_07)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_02)))
  )
)
)
