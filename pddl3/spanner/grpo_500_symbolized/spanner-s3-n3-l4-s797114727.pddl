; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 797114727 --problem-name spanner-s3-n3-l4-s797114727
(define (problem spanner-s3-n3-l4-s797114727)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_13 obj_11 obj_12 - type_3
     obj_10 obj_09 obj_05 - type_1
     obj_01 obj_03 obj_07 obj_04 - type_2
     obj_08 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_08)
    (pred_6 obj_13 obj_04)
    (pred_5 obj_13)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_06)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_06)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_04 obj_06)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_03 obj_07)
    (pred_3 obj_07 obj_04)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_09)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
