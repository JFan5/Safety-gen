; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 247245234 --problem-name spanner-s3-n2-l4-s247245234
(define (problem spanner-s3-n2-l4-s247245234)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_12 obj_04 obj_11 - type_4
     obj_05 obj_08 - type_5
     obj_06 obj_02 obj_09 obj_01 - type_2
     obj_03 obj_10 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_03)
    (pred_6 obj_12 obj_01)
    (pred_4 obj_12)
    (pred_6 obj_04 obj_02)
    (pred_4 obj_04)
    (pred_6 obj_11 obj_09)
    (pred_4 obj_11)
    (pred_1 obj_05)
    (pred_6 obj_05 obj_10)
    (pred_1 obj_08)
    (pred_6 obj_08 obj_10)
    (pred_3 obj_03 obj_06)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_09)
    (pred_3 obj_09 obj_01)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
