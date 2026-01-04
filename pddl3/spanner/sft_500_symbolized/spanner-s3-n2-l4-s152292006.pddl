; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 152292006 --problem-name spanner-s3-n2-l4-s152292006
(define (problem spanner-s3-n2-l4-s152292006)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_05 obj_10 obj_04 - type_3
     obj_11 obj_03 - type_5
     obj_02 obj_07 obj_12 obj_01 - type_4
     obj_08 obj_06 - type_4
    )
 (:init 
    (pred_5 obj_09 obj_08)
    (pred_5 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_5 obj_10 obj_12)
    (pred_1 obj_10)
    (pred_5 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_6 obj_11)
    (pred_5 obj_11 obj_06)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_06)
    (pred_2 obj_08 obj_02)
    (pred_2 obj_01 obj_06)
    (pred_2 obj_02 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_2 obj_12 obj_01)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_08)))
  )
)
)
