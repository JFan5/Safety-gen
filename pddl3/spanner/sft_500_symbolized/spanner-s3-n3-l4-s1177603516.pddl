; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1177603516 --problem-name spanner-s3-n3-l4-s1177603516
(define (problem spanner-s3-n3-l4-s1177603516)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_01 obj_02 obj_04 - type_3
     obj_12 obj_08 obj_07 - type_1
     obj_13 obj_09 obj_11 obj_03 - type_4
     obj_05 obj_10 - type_4
    )
 (:init 
    (pred_2 obj_06 obj_05)
    (pred_2 obj_01 obj_11)
    (pred_3 obj_01)
    (pred_2 obj_02 obj_03)
    (pred_3 obj_02)
    (pred_2 obj_04 obj_13)
    (pred_3 obj_04)
    (pred_6 obj_12)
    (pred_2 obj_12 obj_10)
    (pred_6 obj_08)
    (pred_2 obj_08 obj_10)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_10)
    (pred_5 obj_05 obj_13)
    (pred_5 obj_03 obj_10)
    (pred_5 obj_13 obj_09)
    (pred_5 obj_09 obj_11)
    (pred_5 obj_11 obj_03)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_08)
   (pred_4 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_05)))
  )
)
)
