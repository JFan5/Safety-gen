; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 653259327 --problem-name spanner-s3-n3-l4-s653259327
(define (problem spanner-s3-n3-l4-s653259327)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_10 obj_01 obj_02 - type_3
     obj_08 obj_13 obj_05 - type_5
     obj_12 obj_09 obj_06 obj_04 - type_1
     obj_03 obj_11 - type_1
    )
 (:init 
    (pred_3 obj_07 obj_03)
    (pred_3 obj_10 obj_09)
    (pred_1 obj_10)
    (pred_3 obj_01 obj_04)
    (pred_1 obj_01)
    (pred_3 obj_02 obj_09)
    (pred_1 obj_02)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_11)
    (pred_6 obj_13)
    (pred_3 obj_13 obj_11)
    (pred_6 obj_05)
    (pred_3 obj_05 obj_11)
    (pred_2 obj_03 obj_12)
    (pred_2 obj_04 obj_11)
    (pred_2 obj_12 obj_09)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_06 obj_04)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_13)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_13))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
