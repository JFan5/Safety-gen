; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2119789556 --problem-name spanner-s3-n2-l4-s2119789556
(define (problem spanner-s3-n2-l4-s2119789556)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_08 obj_01 obj_07 - type_1
     obj_12 obj_04 - type_5
     obj_09 obj_03 obj_10 obj_02 - type_2
     obj_05 obj_06 - type_2
    )
 (:init 
    (pred_4 obj_11 obj_05)
    (pred_4 obj_08 obj_03)
    (pred_5 obj_08)
    (pred_4 obj_01 obj_10)
    (pred_5 obj_01)
    (pred_4 obj_07 obj_03)
    (pred_5 obj_07)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_06)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_06)
    (pred_2 obj_05 obj_09)
    (pred_2 obj_02 obj_06)
    (pred_2 obj_09 obj_03)
    (pred_2 obj_03 obj_10)
    (pred_2 obj_10 obj_02)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
