; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1373816533 --problem-name spanner-s3-n3-l4-s1373816533
(define (problem spanner-s3-n3-l4-s1373816533)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_01 obj_07 obj_04 - type_3
     obj_13 obj_08 obj_09 - type_1
     obj_05 obj_12 obj_03 obj_02 - type_5
     obj_10 obj_06 - type_5
    )
 (:init 
    (pred_6 obj_11 obj_10)
    (pred_6 obj_01 obj_05)
    (pred_2 obj_01)
    (pred_6 obj_07 obj_05)
    (pred_2 obj_07)
    (pred_6 obj_04 obj_05)
    (pred_2 obj_04)
    (pred_3 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_3 obj_08)
    (pred_6 obj_08 obj_06)
    (pred_3 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_5 obj_10 obj_05)
    (pred_5 obj_02 obj_06)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_5 obj_03 obj_02)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_08)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
