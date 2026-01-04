; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 734515729 --problem-name spanner-s3-n3-l4-s734515729
(define (problem spanner-s3-n3-l4-s734515729)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_08 obj_13 obj_03 - type_3
     obj_05 obj_01 obj_09 - type_4
     obj_07 obj_11 obj_12 obj_06 - type_1
     obj_10 obj_04 - type_1
    )
 (:init 
    (pred_3 obj_02 obj_10)
    (pred_3 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_3 obj_13 obj_06)
    (pred_1 obj_13)
    (pred_3 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_2 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_2 obj_01)
    (pred_3 obj_01 obj_04)
    (pred_2 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_5 obj_10 obj_07)
    (pred_5 obj_06 obj_04)
    (pred_5 obj_07 obj_11)
    (pred_5 obj_11 obj_12)
    (pred_5 obj_12 obj_06)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_01)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_01)) (not (pred_6 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
