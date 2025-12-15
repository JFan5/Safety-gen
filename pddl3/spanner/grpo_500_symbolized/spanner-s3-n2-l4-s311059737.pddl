; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 311059737 --problem-name spanner-s3-n2-l4-s311059737
(define (problem spanner-s3-n2-l4-s311059737)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_01 obj_06 obj_12 - type_5
     obj_11 obj_10 - type_1
     obj_02 obj_09 obj_05 obj_07 - type_3
     obj_04 obj_08 - type_3
    )
 (:init 
    (pred_3 obj_03 obj_04)
    (pred_3 obj_01 obj_09)
    (pred_1 obj_01)
    (pred_3 obj_06 obj_02)
    (pred_1 obj_06)
    (pred_3 obj_12 obj_05)
    (pred_1 obj_12)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_08)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_08)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_07 obj_08)
    (pred_4 obj_02 obj_09)
    (pred_4 obj_09 obj_05)
    (pred_4 obj_05 obj_07)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
