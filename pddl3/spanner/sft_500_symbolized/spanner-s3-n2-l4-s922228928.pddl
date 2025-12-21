; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 922228928 --problem-name spanner-s3-n2-l4-s922228928
(define (problem spanner-s3-n2-l4-s922228928)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_07 obj_12 obj_11 - type_5
     obj_08 obj_02 - type_4
     obj_01 obj_03 obj_06 obj_10 - type_2
     obj_09 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_09)
    (pred_2 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_2 obj_12 obj_03)
    (pred_1 obj_12)
    (pred_2 obj_11 obj_03)
    (pred_1 obj_11)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_05)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_05)
    (pred_6 obj_09 obj_01)
    (pred_6 obj_10 obj_05)
    (pred_6 obj_01 obj_03)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_06 obj_10)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
