; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 339752727 --problem-name spanner-s3-n3-l4-s339752727
(define (problem spanner-s3-n3-l4-s339752727)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_11 obj_09 obj_07 - type_3
     obj_01 obj_05 obj_10 - type_1
     obj_12 obj_04 obj_06 obj_08 - type_2
     obj_03 obj_13 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_03)
    (pred_6 obj_11 obj_06)
    (pred_5 obj_11)
    (pred_6 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_6 obj_07 obj_06)
    (pred_5 obj_07)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_13)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_13)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_13)
    (pred_3 obj_03 obj_12)
    (pred_3 obj_08 obj_13)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_04 obj_06)
    (pred_3 obj_06 obj_08)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_05)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
