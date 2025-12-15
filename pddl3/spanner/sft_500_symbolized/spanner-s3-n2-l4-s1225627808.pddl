; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1225627808 --problem-name spanner-s3-n2-l4-s1225627808
(define (problem spanner-s3-n2-l4-s1225627808)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_05 obj_10 obj_08 - type_5
     obj_12 obj_09 - type_3
     obj_02 obj_07 obj_03 obj_04 - type_4
     obj_11 obj_01 - type_4
    )
 (:init 
    (pred_1 obj_06 obj_11)
    (pred_1 obj_05 obj_04)
    (pred_4 obj_05)
    (pred_1 obj_10 obj_03)
    (pred_4 obj_10)
    (pred_1 obj_08 obj_07)
    (pred_4 obj_08)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_01)
    (pred_5 obj_09)
    (pred_1 obj_09 obj_01)
    (pred_6 obj_11 obj_02)
    (pred_6 obj_04 obj_01)
    (pred_6 obj_02 obj_07)
    (pred_6 obj_07 obj_03)
    (pred_6 obj_03 obj_04)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
