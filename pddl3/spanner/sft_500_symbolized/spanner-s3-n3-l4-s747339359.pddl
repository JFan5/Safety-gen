; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 747339359 --problem-name spanner-s3-n3-l4-s747339359
(define (problem spanner-s3-n3-l4-s747339359)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_13 obj_12 obj_04 - type_5
     obj_02 obj_10 obj_03 - type_2
     obj_08 obj_07 obj_06 obj_09 - type_4
     obj_11 obj_01 - type_4
    )
 (:init 
    (pred_5 obj_05 obj_11)
    (pred_5 obj_13 obj_07)
    (pred_4 obj_13)
    (pred_5 obj_12 obj_09)
    (pred_4 obj_12)
    (pred_5 obj_04 obj_06)
    (pred_4 obj_04)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_01)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_01)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_01)
    (pred_2 obj_11 obj_08)
    (pred_2 obj_09 obj_01)
    (pred_2 obj_08 obj_07)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_06 obj_09)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_10)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
