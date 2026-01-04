; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1550208098 --problem-name spanner-s3-n2-l4-s1550208098
(define (problem spanner-s3-n2-l4-s1550208098)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_03 obj_01 obj_09 - type_3
     obj_11 obj_10 - type_2
     obj_06 obj_04 obj_07 obj_05 - type_1
     obj_08 obj_12 - type_1
    )
 (:init 
    (pred_2 obj_02 obj_08)
    (pred_2 obj_03 obj_07)
    (pred_5 obj_03)
    (pred_2 obj_01 obj_04)
    (pred_5 obj_01)
    (pred_2 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_1 obj_11)
    (pred_2 obj_11 obj_12)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_12)
    (pred_4 obj_08 obj_06)
    (pred_4 obj_05 obj_12)
    (pred_4 obj_06 obj_04)
    (pred_4 obj_04 obj_07)
    (pred_4 obj_07 obj_05)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
