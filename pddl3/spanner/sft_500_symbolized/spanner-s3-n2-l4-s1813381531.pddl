; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1813381531 --problem-name spanner-s3-n2-l4-s1813381531
(define (problem spanner-s3-n2-l4-s1813381531)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_03 obj_05 obj_08 - type_5
     obj_11 obj_09 - type_1
     obj_04 obj_12 obj_01 obj_10 - type_3
     obj_06 obj_02 - type_3
    )
 (:init 
    (pred_6 obj_07 obj_06)
    (pred_6 obj_03 obj_10)
    (pred_3 obj_03)
    (pred_6 obj_05 obj_01)
    (pred_3 obj_05)
    (pred_6 obj_08 obj_10)
    (pred_3 obj_08)
    (pred_2 obj_11)
    (pred_6 obj_11 obj_02)
    (pred_2 obj_09)
    (pred_6 obj_09 obj_02)
    (pred_1 obj_06 obj_04)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_04 obj_12)
    (pred_1 obj_12 obj_01)
    (pred_1 obj_01 obj_10)
)
 (:goal
  (and
   (pred_5 obj_11)
   (pred_5 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_11)) (not (pred_5 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
