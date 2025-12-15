; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 50798177 --problem-name spanner-s3-n2-l4-s50798177
(define (problem spanner-s3-n2-l4-s50798177)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_01 obj_03 obj_04 - type_5
     obj_05 obj_12 - type_1
     obj_02 obj_06 obj_08 obj_11 - type_3
     obj_07 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_07)
    (pred_3 obj_01 obj_06)
    (pred_1 obj_01)
    (pred_3 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_3 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_09)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_09)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_11 obj_09)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_06 obj_08)
    (pred_4 obj_08 obj_11)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
