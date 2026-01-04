; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2140323417 --problem-name spanner-s3-n2-l4-s2140323417
(define (problem spanner-s3-n2-l4-s2140323417)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_03 obj_10 obj_06 - type_2
     obj_12 obj_08 - type_5
     obj_02 obj_07 obj_01 obj_04 - type_3
     obj_09 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_11 obj_09)
    (pred_3 obj_03 obj_07)
    (pred_5 obj_03)
    (pred_3 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_3 obj_06 obj_01)
    (pred_5 obj_06)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_05)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_4 obj_09 obj_02)
    (pred_4 obj_04 obj_05)
    (pred_4 obj_02 obj_07)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_01 obj_04)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
