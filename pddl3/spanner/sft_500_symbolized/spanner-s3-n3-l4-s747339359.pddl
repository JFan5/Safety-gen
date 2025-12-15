; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 747339359 --problem-name spanner-s3-n3-l4-s747339359
(define (problem spanner-s3-n3-l4-s747339359)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_01 obj_08 obj_03 - type_3
     obj_11 obj_12 obj_09 - type_5
     obj_10 obj_05 obj_06 obj_07 - type_4
     obj_04 obj_13 - type_4
    )
 (:init 
    (pred_5 obj_02 obj_04)
    (pred_5 obj_01 obj_05)
    (pred_1 obj_01)
    (pred_5 obj_08 obj_07)
    (pred_1 obj_08)
    (pred_5 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_2 obj_11)
    (pred_5 obj_11 obj_13)
    (pred_2 obj_12)
    (pred_5 obj_12 obj_13)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_13)
    (pred_4 obj_04 obj_10)
    (pred_4 obj_07 obj_13)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_06)
    (pred_4 obj_06 obj_07)
)
 (:goal
  (and
   (pred_6 obj_11)
   (pred_6 obj_12)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
