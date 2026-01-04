; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2010412531 --problem-name spanner-s3-n3-l4-s2010412531
(define (problem spanner-s3-n3-l4-s2010412531)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_03 obj_08 obj_10 - type_4
     obj_12 obj_09 obj_07 - type_1
     obj_13 obj_11 obj_02 obj_06 - type_2
     obj_05 obj_01 - type_2
    )
 (:init 
    (pred_1 obj_04 obj_05)
    (pred_1 obj_03 obj_13)
    (pred_2 obj_03)
    (pred_1 obj_08 obj_11)
    (pred_2 obj_08)
    (pred_1 obj_10 obj_13)
    (pred_2 obj_10)
    (pred_4 obj_12)
    (pred_1 obj_12 obj_01)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_01)
    (pred_4 obj_07)
    (pred_1 obj_07 obj_01)
    (pred_5 obj_05 obj_13)
    (pred_5 obj_06 obj_01)
    (pred_5 obj_13 obj_11)
    (pred_5 obj_11 obj_02)
    (pred_5 obj_02 obj_06)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_09)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
