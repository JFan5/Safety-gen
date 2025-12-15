; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1578189630 --problem-name spanner-s3-n3-l4-s1578189630
(define (problem spanner-s3-n3-l4-s1578189630)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_04 obj_12 obj_09 - type_3
     obj_05 obj_10 obj_01 - type_1
     obj_08 obj_03 obj_13 obj_11 - type_4
     obj_06 obj_07 - type_4
    )
 (:init 
    (pred_2 obj_02 obj_06)
    (pred_2 obj_04 obj_13)
    (pred_1 obj_04)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_2 obj_09 obj_13)
    (pred_1 obj_09)
    (pred_4 obj_05)
    (pred_2 obj_05 obj_07)
    (pred_4 obj_10)
    (pred_2 obj_10 obj_07)
    (pred_4 obj_01)
    (pred_2 obj_01 obj_07)
    (pred_3 obj_06 obj_08)
    (pred_3 obj_11 obj_07)
    (pred_3 obj_08 obj_03)
    (pred_3 obj_03 obj_13)
    (pred_3 obj_13 obj_11)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_10)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
