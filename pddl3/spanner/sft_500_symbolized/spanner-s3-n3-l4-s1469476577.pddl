; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1469476577 --problem-name spanner-s3-n3-l4-s1469476577
(define (problem spanner-s3-n3-l4-s1469476577)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_07 obj_12 obj_05 - type_5
     obj_04 obj_03 obj_01 - type_2
     obj_02 obj_08 obj_09 obj_10 - type_3
     obj_11 obj_06 - type_3
    )
 (:init 
    (pred_4 obj_13 obj_11)
    (pred_4 obj_07 obj_08)
    (pred_2 obj_07)
    (pred_4 obj_12 obj_08)
    (pred_2 obj_12)
    (pred_4 obj_05 obj_08)
    (pred_2 obj_05)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_06)
    (pred_6 obj_03)
    (pred_4 obj_03 obj_06)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_06)
    (pred_1 obj_11 obj_02)
    (pred_1 obj_10 obj_06)
    (pred_1 obj_02 obj_08)
    (pred_1 obj_08 obj_09)
    (pred_1 obj_09 obj_10)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_03)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
