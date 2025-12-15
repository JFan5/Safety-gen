; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 247245234 --problem-name spanner-s3-n2-l4-s247245234
(define (problem spanner-s3-n2-l4-s247245234)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_02 obj_06 obj_09 - type_4
     obj_05 obj_07 - type_2
     obj_03 obj_04 obj_12 obj_10 - type_1
     obj_11 obj_08 - type_1
    )
 (:init 
    (pred_4 obj_01 obj_11)
    (pred_4 obj_02 obj_10)
    (pred_5 obj_02)
    (pred_4 obj_06 obj_04)
    (pred_5 obj_06)
    (pred_4 obj_09 obj_12)
    (pred_5 obj_09)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_08)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_08)
    (pred_1 obj_11 obj_03)
    (pred_1 obj_10 obj_08)
    (pred_1 obj_03 obj_04)
    (pred_1 obj_04 obj_12)
    (pred_1 obj_12 obj_10)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
