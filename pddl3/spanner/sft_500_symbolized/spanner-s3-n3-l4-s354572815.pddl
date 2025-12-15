; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 354572815 --problem-name spanner-s3-n3-l4-s354572815
(define (problem spanner-s3-n3-l4-s354572815)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_07 obj_08 obj_13 - type_1
     obj_04 obj_06 obj_05 - type_4
     obj_09 obj_11 obj_02 obj_01 - type_5
     obj_10 obj_03 - type_5
    )
 (:init 
    (pred_5 obj_12 obj_10)
    (pred_5 obj_07 obj_09)
    (pred_6 obj_07)
    (pred_5 obj_08 obj_02)
    (pred_6 obj_08)
    (pred_5 obj_13 obj_02)
    (pred_6 obj_13)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_03)
    (pred_4 obj_06)
    (pred_5 obj_06 obj_03)
    (pred_4 obj_05)
    (pred_5 obj_05 obj_03)
    (pred_3 obj_10 obj_09)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_09 obj_11)
    (pred_3 obj_11 obj_02)
    (pred_3 obj_02 obj_01)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_06)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
