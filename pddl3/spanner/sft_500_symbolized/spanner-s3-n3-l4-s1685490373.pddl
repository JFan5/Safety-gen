; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1685490373 --problem-name spanner-s3-n3-l4-s1685490373
(define (problem spanner-s3-n3-l4-s1685490373)
 (:domain spanner)
 (:objects 
     obj_13 - type_4
     obj_08 obj_03 obj_09 - type_5
     obj_06 obj_05 obj_04 - type_2
     obj_07 obj_10 obj_01 obj_11 - type_3
     obj_02 obj_12 - type_3
    )
 (:init 
    (pred_4 obj_13 obj_02)
    (pred_4 obj_08 obj_01)
    (pred_5 obj_08)
    (pred_4 obj_03 obj_01)
    (pred_5 obj_03)
    (pred_4 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_12)
    (pred_6 obj_05)
    (pred_4 obj_05 obj_12)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_12)
    (pred_3 obj_02 obj_07)
    (pred_3 obj_11 obj_12)
    (pred_3 obj_07 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_11)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_05)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
