; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1454563318 --problem-name spanner-s3-n3-l4-s1454563318
(define (problem spanner-s3-n3-l4-s1454563318)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_13 obj_12 obj_03 - type_5
     obj_11 obj_09 obj_05 - type_4
     obj_10 obj_08 obj_04 obj_07 - type_2
     obj_02 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_01 obj_02)
    (pred_2 obj_13 obj_04)
    (pred_1 obj_13)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_2 obj_03 obj_04)
    (pred_1 obj_03)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_06)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_06)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_06)
    (pred_6 obj_02 obj_10)
    (pred_6 obj_07 obj_06)
    (pred_6 obj_10 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_6 obj_04 obj_07)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_09)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_09)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
