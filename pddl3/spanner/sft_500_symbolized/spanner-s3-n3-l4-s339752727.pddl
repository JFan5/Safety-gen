; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 339752727 --problem-name spanner-s3-n3-l4-s339752727
(define (problem spanner-s3-n3-l4-s339752727)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_10 obj_05 obj_04 - type_1
     obj_12 obj_08 obj_02 - type_4
     obj_11 obj_07 obj_09 obj_13 - type_3
     obj_01 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_03 obj_01)
    (pred_3 obj_10 obj_09)
    (pred_5 obj_10)
    (pred_3 obj_05 obj_07)
    (pred_5 obj_05)
    (pred_3 obj_04 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_2 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_06)
    (pred_1 obj_01 obj_11)
    (pred_1 obj_13 obj_06)
    (pred_1 obj_11 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_1 obj_09 obj_13)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_08)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_01)))
  )
)
)
