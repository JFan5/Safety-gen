; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 322767951 --problem-name spanner-s3-n3-l4-s322767951
(define (problem spanner-s3-n3-l4-s322767951)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_11 obj_04 obj_03 - type_5
     obj_01 obj_08 obj_02 - type_4
     obj_06 obj_13 obj_05 obj_12 - type_1
     obj_07 obj_10 - type_1
    )
 (:init 
    (pred_1 obj_09 obj_07)
    (pred_1 obj_11 obj_13)
    (pred_4 obj_11)
    (pred_1 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_1 obj_03 obj_13)
    (pred_4 obj_03)
    (pred_6 obj_01)
    (pred_1 obj_01 obj_10)
    (pred_6 obj_08)
    (pred_1 obj_08 obj_10)
    (pred_6 obj_02)
    (pred_1 obj_02 obj_10)
    (pred_3 obj_07 obj_06)
    (pred_3 obj_12 obj_10)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_13 obj_05)
    (pred_3 obj_05 obj_12)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_08)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
