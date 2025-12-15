; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2141681293 --problem-name spanner-s3-n3-l4-s2141681293
(define (problem spanner-s3-n3-l4-s2141681293)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_03 obj_04 obj_11 - type_3
     obj_05 obj_13 obj_01 - type_1
     obj_07 obj_02 obj_12 obj_06 - type_2
     obj_10 obj_08 - type_2
    )
 (:init 
    (pred_5 obj_09 obj_10)
    (pred_5 obj_03 obj_02)
    (pred_4 obj_03)
    (pred_5 obj_04 obj_02)
    (pred_4 obj_04)
    (pred_5 obj_11 obj_02)
    (pred_4 obj_11)
    (pred_3 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_3 obj_13)
    (pred_5 obj_13 obj_08)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_08)
    (pred_6 obj_10 obj_07)
    (pred_6 obj_06 obj_08)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_02 obj_12)
    (pred_6 obj_12 obj_06)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_13)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_13))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
