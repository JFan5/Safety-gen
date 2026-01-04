; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 327911736 --problem-name spanner-s3-n3-l4-s327911736
(define (problem spanner-s3-n3-l4-s327911736)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_08 obj_04 obj_07 - type_4
     obj_01 obj_06 obj_10 - type_5
     obj_09 obj_11 obj_03 obj_02 - type_3
     obj_05 obj_12 - type_3
    )
 (:init 
    (pred_3 obj_13 obj_05)
    (pred_3 obj_08 obj_09)
    (pred_4 obj_08)
    (pred_3 obj_04 obj_11)
    (pred_4 obj_04)
    (pred_3 obj_07 obj_09)
    (pred_4 obj_07)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_12)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_12)
    (pred_6 obj_10)
    (pred_3 obj_10 obj_12)
    (pred_2 obj_05 obj_09)
    (pred_2 obj_02 obj_12)
    (pred_2 obj_09 obj_11)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_03 obj_02)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_06)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
