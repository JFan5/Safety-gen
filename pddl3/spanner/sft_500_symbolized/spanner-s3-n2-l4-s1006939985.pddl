; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1006939985 --problem-name spanner-s3-n2-l4-s1006939985
(define (problem spanner-s3-n2-l4-s1006939985)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_02 obj_07 obj_09 - type_1
     obj_05 obj_12 - type_5
     obj_11 obj_04 obj_03 obj_01 - type_3
     obj_06 obj_08 - type_3
    )
 (:init 
    (pred_4 obj_10 obj_06)
    (pred_4 obj_02 obj_11)
    (pred_2 obj_02)
    (pred_4 obj_07 obj_11)
    (pred_2 obj_07)
    (pred_4 obj_09 obj_11)
    (pred_2 obj_09)
    (pred_1 obj_05)
    (pred_4 obj_05 obj_08)
    (pred_1 obj_12)
    (pred_4 obj_12 obj_08)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_11 obj_04)
    (pred_5 obj_04 obj_03)
    (pred_5 obj_03 obj_01)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
