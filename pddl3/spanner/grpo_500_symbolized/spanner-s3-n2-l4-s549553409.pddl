; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 549553409 --problem-name spanner-s3-n2-l4-s549553409
(define (problem spanner-s3-n2-l4-s549553409)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_03 obj_08 obj_10 - type_3
     obj_07 obj_09 - type_1
     obj_05 obj_06 obj_02 obj_04 - type_2
     obj_01 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_11 obj_01)
    (pred_6 obj_03 obj_06)
    (pred_5 obj_03)
    (pred_6 obj_08 obj_06)
    (pred_5 obj_08)
    (pred_6 obj_10 obj_05)
    (pred_5 obj_10)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_12)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_04 obj_12)
    (pred_3 obj_05 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_04)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
