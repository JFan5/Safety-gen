; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1712096635 --problem-name spanner-s3-n3-l4-s1712096635
(define (problem spanner-s3-n3-l4-s1712096635)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_08 obj_12 obj_10 - type_2
     obj_05 obj_03 obj_06 - type_5
     obj_04 obj_02 obj_01 obj_13 - type_4
     obj_11 obj_07 - type_4
    )
 (:init 
    (pred_1 obj_09 obj_11)
    (pred_1 obj_08 obj_02)
    (pred_2 obj_08)
    (pred_1 obj_12 obj_13)
    (pred_2 obj_12)
    (pred_1 obj_10 obj_01)
    (pred_2 obj_10)
    (pred_3 obj_05)
    (pred_1 obj_05 obj_07)
    (pred_3 obj_03)
    (pred_1 obj_03 obj_07)
    (pred_3 obj_06)
    (pred_1 obj_06 obj_07)
    (pred_4 obj_11 obj_04)
    (pred_4 obj_13 obj_07)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_13)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_03)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
