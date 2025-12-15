; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 339752727 --problem-name spanner-s3-n3-l4-s339752727
(define (problem spanner-s3-n3-l4-s339752727)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_09 obj_01 obj_08 - type_5
     obj_12 obj_06 obj_02 - type_1
     obj_13 obj_07 obj_11 obj_10 - type_3
     obj_04 obj_03 - type_3
    )
 (:init 
    (pred_3 obj_05 obj_04)
    (pred_3 obj_09 obj_11)
    (pred_1 obj_09)
    (pred_3 obj_01 obj_07)
    (pred_1 obj_01)
    (pred_3 obj_08 obj_11)
    (pred_1 obj_08)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_03)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_03)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_03)
    (pred_4 obj_04 obj_13)
    (pred_4 obj_10 obj_03)
    (pred_4 obj_13 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_4 obj_11 obj_10)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_06)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
