; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1454563318 --problem-name spanner-s3-n3-l4-s1454563318
(define (problem spanner-s3-n3-l4-s1454563318)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_01 obj_05 obj_12 - type_5
     obj_08 obj_10 obj_09 - type_2
     obj_02 obj_04 obj_11 obj_13 - type_4
     obj_07 obj_06 - type_4
    )
 (:init 
    (pred_5 obj_03 obj_07)
    (pred_5 obj_01 obj_11)
    (pred_1 obj_01)
    (pred_5 obj_05 obj_04)
    (pred_1 obj_05)
    (pred_5 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_06)
    (pred_3 obj_10)
    (pred_5 obj_10 obj_06)
    (pred_3 obj_09)
    (pred_5 obj_09 obj_06)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_02 obj_04)
    (pred_6 obj_04 obj_11)
    (pred_6 obj_11 obj_13)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_10)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
