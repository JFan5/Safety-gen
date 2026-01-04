; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 922228928 --problem-name spanner-s3-n2-l4-s922228928
(define (problem spanner-s3-n2-l4-s922228928)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_02 obj_05 obj_03 - type_2
     obj_10 obj_12 - type_4
     obj_06 obj_08 obj_07 obj_01 - type_3
     obj_04 obj_09 - type_3
    )
 (:init 
    (pred_1 obj_11 obj_04)
    (pred_1 obj_02 obj_08)
    (pred_3 obj_02)
    (pred_1 obj_05 obj_08)
    (pred_3 obj_05)
    (pred_1 obj_03 obj_08)
    (pred_3 obj_03)
    (pred_2 obj_10)
    (pred_1 obj_10 obj_09)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_09)
    (pred_6 obj_04 obj_06)
    (pred_6 obj_01 obj_09)
    (pred_6 obj_06 obj_08)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_07 obj_01)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
