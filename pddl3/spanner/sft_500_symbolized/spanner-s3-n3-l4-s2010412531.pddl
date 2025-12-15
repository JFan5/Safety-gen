; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2010412531 --problem-name spanner-s3-n3-l4-s2010412531
(define (problem spanner-s3-n3-l4-s2010412531)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_10 obj_01 obj_02 - type_4
     obj_06 obj_11 obj_04 - type_1
     obj_12 obj_08 obj_03 obj_09 - type_3
     obj_05 obj_07 - type_3
    )
 (:init 
    (pred_1 obj_13 obj_05)
    (pred_1 obj_10 obj_12)
    (pred_4 obj_10)
    (pred_1 obj_01 obj_08)
    (pred_4 obj_01)
    (pred_1 obj_02 obj_12)
    (pred_4 obj_02)
    (pred_3 obj_06)
    (pred_1 obj_06 obj_07)
    (pred_3 obj_11)
    (pred_1 obj_11 obj_07)
    (pred_3 obj_04)
    (pred_1 obj_04 obj_07)
    (pred_6 obj_05 obj_12)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_12 obj_08)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_03 obj_09)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_11)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
