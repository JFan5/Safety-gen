; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 689262002 --problem-name spanner-s3-n3-l4-s689262002
(define (problem spanner-s3-n3-l4-s689262002)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_11 obj_01 obj_02 - type_3
     obj_08 obj_04 obj_03 - type_1
     obj_09 obj_13 obj_12 obj_10 - type_2
     obj_05 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_07 obj_05)
    (pred_6 obj_11 obj_09)
    (pred_5 obj_11)
    (pred_6 obj_01 obj_13)
    (pred_5 obj_01)
    (pred_6 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_06)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_06)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_06)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_10 obj_06)
    (pred_3 obj_09 obj_13)
    (pred_3 obj_13 obj_12)
    (pred_3 obj_12 obj_10)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_04)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
