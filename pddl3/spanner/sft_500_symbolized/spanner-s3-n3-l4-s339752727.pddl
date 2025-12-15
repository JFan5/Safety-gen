; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 339752727 --problem-name spanner-s3-n3-l4-s339752727
(define (problem spanner-s3-n3-l4-s339752727)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_07 obj_05 obj_03 - type_4
     obj_13 obj_09 obj_06 - type_3
     obj_12 obj_08 obj_10 obj_01 - type_5
     obj_02 obj_04 - type_5
    )
 (:init 
    (pred_1 obj_11 obj_02)
    (pred_1 obj_07 obj_10)
    (pred_4 obj_07)
    (pred_1 obj_05 obj_08)
    (pred_4 obj_05)
    (pred_1 obj_03 obj_10)
    (pred_4 obj_03)
    (pred_5 obj_13)
    (pred_1 obj_13 obj_04)
    (pred_5 obj_09)
    (pred_1 obj_09 obj_04)
    (pred_5 obj_06)
    (pred_1 obj_06 obj_04)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_01 obj_04)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_08 obj_10)
    (pred_3 obj_10 obj_01)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_09)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
