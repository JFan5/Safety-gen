; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 327911736 --problem-name spanner-s3-n3-l4-s327911736
(define (problem spanner-s3-n3-l4-s327911736)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_08 obj_05 obj_06 - type_3
     obj_02 obj_13 obj_01 - type_5
     obj_04 obj_10 obj_09 obj_07 - type_4
     obj_12 obj_11 - type_4
    )
 (:init 
    (pred_4 obj_03 obj_12)
    (pred_4 obj_08 obj_04)
    (pred_6 obj_08)
    (pred_4 obj_05 obj_10)
    (pred_6 obj_05)
    (pred_4 obj_06 obj_04)
    (pred_6 obj_06)
    (pred_5 obj_02)
    (pred_4 obj_02 obj_11)
    (pred_5 obj_13)
    (pred_4 obj_13 obj_11)
    (pred_5 obj_01)
    (pred_4 obj_01 obj_11)
    (pred_1 obj_12 obj_04)
    (pred_1 obj_07 obj_11)
    (pred_1 obj_04 obj_10)
    (pred_1 obj_10 obj_09)
    (pred_1 obj_09 obj_07)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_13)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_13))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
