; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 939968175 --problem-name spanner-s3-n2-l4-s939968175
(define (problem spanner-s3-n2-l4-s939968175)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_06 obj_01 obj_10 - type_5
     obj_05 obj_03 - type_1
     obj_12 obj_11 obj_07 obj_09 - type_3
     obj_08 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_02 obj_08)
    (pred_3 obj_06 obj_11)
    (pred_1 obj_06)
    (pred_3 obj_01 obj_12)
    (pred_1 obj_01)
    (pred_3 obj_10 obj_12)
    (pred_1 obj_10)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_04)
    (pred_4 obj_08 obj_12)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_12 obj_11)
    (pred_4 obj_11 obj_07)
    (pred_4 obj_07 obj_09)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_08)))
  )
)
)
