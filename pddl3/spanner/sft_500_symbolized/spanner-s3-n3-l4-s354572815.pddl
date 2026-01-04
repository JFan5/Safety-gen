; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 354572815 --problem-name spanner-s3-n3-l4-s354572815
(define (problem spanner-s3-n3-l4-s354572815)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_11 obj_05 obj_13 - type_4
     obj_12 obj_10 obj_07 - type_2
     obj_04 obj_03 obj_09 obj_02 - type_1
     obj_01 obj_06 - type_1
    )
 (:init 
    (pred_1 obj_08 obj_01)
    (pred_1 obj_11 obj_04)
    (pred_3 obj_11)
    (pred_1 obj_05 obj_09)
    (pred_3 obj_05)
    (pred_1 obj_13 obj_09)
    (pred_3 obj_13)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_06)
    (pred_5 obj_10)
    (pred_1 obj_10 obj_06)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_06)
    (pred_4 obj_01 obj_04)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_04 obj_03)
    (pred_4 obj_03 obj_09)
    (pred_4 obj_09 obj_02)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_10)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_12)) (not (pred_2 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
