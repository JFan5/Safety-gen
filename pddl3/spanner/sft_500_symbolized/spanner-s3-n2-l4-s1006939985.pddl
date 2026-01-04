; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1006939985 --problem-name spanner-s3-n2-l4-s1006939985
(define (problem spanner-s3-n2-l4-s1006939985)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_11 obj_03 obj_06 - type_4
     obj_05 obj_02 - type_1
     obj_10 obj_04 obj_08 obj_09 - type_2
     obj_12 obj_01 - type_2
    )
 (:init 
    (pred_1 obj_07 obj_12)
    (pred_1 obj_11 obj_10)
    (pred_3 obj_11)
    (pred_1 obj_03 obj_10)
    (pred_3 obj_03)
    (pred_1 obj_06 obj_10)
    (pred_3 obj_06)
    (pred_6 obj_05)
    (pred_1 obj_05 obj_01)
    (pred_6 obj_02)
    (pred_1 obj_02 obj_01)
    (pred_4 obj_12 obj_10)
    (pred_4 obj_09 obj_01)
    (pred_4 obj_10 obj_04)
    (pred_4 obj_04 obj_08)
    (pred_4 obj_08 obj_09)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
