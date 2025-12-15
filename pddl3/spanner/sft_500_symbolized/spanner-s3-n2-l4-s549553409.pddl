; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 549553409 --problem-name spanner-s3-n2-l4-s549553409
(define (problem spanner-s3-n2-l4-s549553409)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_09 obj_03 obj_06 - type_3
     obj_07 obj_10 - type_1
     obj_01 obj_05 obj_11 obj_02 - type_2
     obj_08 obj_04 - type_2
    )
 (:init 
    (pred_4 obj_12 obj_08)
    (pred_4 obj_09 obj_05)
    (pred_3 obj_09)
    (pred_4 obj_03 obj_05)
    (pred_3 obj_03)
    (pred_4 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_04)
    (pred_2 obj_10)
    (pred_4 obj_10 obj_04)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_02 obj_04)
    (pred_1 obj_01 obj_05)
    (pred_1 obj_05 obj_11)
    (pred_1 obj_11 obj_02)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
