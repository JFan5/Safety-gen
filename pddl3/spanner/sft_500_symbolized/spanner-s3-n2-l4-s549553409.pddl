; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 549553409 --problem-name spanner-s3-n2-l4-s549553409
(define (problem spanner-s3-n2-l4-s549553409)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_08 obj_05 obj_04 - type_1
     obj_06 obj_10 - type_2
     obj_11 obj_02 obj_12 obj_07 - type_3
     obj_09 obj_01 - type_3
    )
 (:init 
    (pred_2 obj_03 obj_09)
    (pred_2 obj_08 obj_02)
    (pred_3 obj_08)
    (pred_2 obj_05 obj_02)
    (pred_3 obj_05)
    (pred_2 obj_04 obj_11)
    (pred_3 obj_04)
    (pred_1 obj_06)
    (pred_2 obj_06 obj_01)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_01)
    (pred_4 obj_09 obj_11)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_11 obj_02)
    (pred_4 obj_02 obj_12)
    (pred_4 obj_12 obj_07)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
