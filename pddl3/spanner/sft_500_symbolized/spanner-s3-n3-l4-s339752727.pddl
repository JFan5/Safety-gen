; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 339752727 --problem-name spanner-s3-n3-l4-s339752727
(define (problem spanner-s3-n3-l4-s339752727)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_08 obj_06 obj_05 - type_5
     obj_10 obj_04 obj_11 - type_4
     obj_07 obj_13 obj_03 obj_12 - type_2
     obj_09 obj_01 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_09)
    (pred_2 obj_08 obj_03)
    (pred_1 obj_08)
    (pred_2 obj_06 obj_13)
    (pred_1 obj_06)
    (pred_2 obj_05 obj_03)
    (pred_1 obj_05)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_01)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_01)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_01)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_12 obj_01)
    (pred_6 obj_07 obj_13)
    (pred_6 obj_13 obj_03)
    (pred_6 obj_03 obj_12)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_04)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
