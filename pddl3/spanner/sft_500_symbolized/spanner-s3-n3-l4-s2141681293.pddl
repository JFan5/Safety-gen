; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2141681293 --problem-name spanner-s3-n3-l4-s2141681293
(define (problem spanner-s3-n3-l4-s2141681293)
 (:domain spanner)
 (:objects 
     obj_10 - type_2
     obj_09 obj_08 obj_06 - type_3
     obj_05 obj_11 obj_12 - type_5
     obj_01 obj_13 obj_04 obj_03 - type_4
     obj_02 obj_07 - type_4
    )
 (:init 
    (pred_1 obj_10 obj_02)
    (pred_1 obj_09 obj_13)
    (pred_6 obj_09)
    (pred_1 obj_08 obj_13)
    (pred_6 obj_08)
    (pred_1 obj_06 obj_13)
    (pred_6 obj_06)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_07)
    (pred_2 obj_11)
    (pred_1 obj_11 obj_07)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_07)
    (pred_5 obj_02 obj_01)
    (pred_5 obj_03 obj_07)
    (pred_5 obj_01 obj_13)
    (pred_5 obj_13 obj_04)
    (pred_5 obj_04 obj_03)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_11)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
