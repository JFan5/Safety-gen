; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1373816533 --problem-name spanner-s3-n3-l4-s1373816533
(define (problem spanner-s3-n3-l4-s1373816533)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_03 obj_09 obj_11 - type_5
     obj_07 obj_08 obj_12 - type_3
     obj_02 obj_04 obj_13 obj_01 - type_1
     obj_05 obj_10 - type_1
    )
 (:init 
    (pred_4 obj_06 obj_05)
    (pred_4 obj_03 obj_02)
    (pred_1 obj_03)
    (pred_4 obj_09 obj_02)
    (pred_1 obj_09)
    (pred_4 obj_11 obj_02)
    (pred_1 obj_11)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_10)
    (pred_2 obj_08)
    (pred_4 obj_08 obj_10)
    (pred_2 obj_12)
    (pred_4 obj_12 obj_10)
    (pred_3 obj_05 obj_02)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_04 obj_13)
    (pred_3 obj_13 obj_01)
)
 (:goal
  (and
   (pred_6 obj_07)
   (pred_6 obj_08)
   (pred_6 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_07)) (not (pred_6 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
