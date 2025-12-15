; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 760688262 --problem-name spanner-s3-n3-l4-s760688262
(define (problem spanner-s3-n3-l4-s760688262)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_03 obj_13 obj_05 - type_5
     obj_09 obj_07 obj_12 - type_1
     obj_04 obj_10 obj_02 obj_11 - type_3
     obj_06 obj_08 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_06)
    (pred_3 obj_03 obj_10)
    (pred_1 obj_03)
    (pred_3 obj_13 obj_10)
    (pred_1 obj_13)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_08)
    (pred_4 obj_06 obj_04)
    (pred_4 obj_11 obj_08)
    (pred_4 obj_04 obj_10)
    (pred_4 obj_10 obj_02)
    (pred_4 obj_02 obj_11)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_07)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
