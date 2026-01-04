; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 384636587 --problem-name spanner-s3-n3-l4-s384636587
(define (problem spanner-s3-n3-l4-s384636587)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_03 obj_02 obj_10 - type_1
     obj_05 obj_01 obj_09 - type_5
     obj_07 obj_06 obj_13 obj_12 - type_3
     obj_04 obj_11 - type_3
    )
 (:init 
    (pred_2 obj_08 obj_04)
    (pred_2 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_2 obj_02 obj_12)
    (pred_1 obj_02)
    (pred_2 obj_10 obj_13)
    (pred_1 obj_10)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_11)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_11)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_11)
    (pred_4 obj_04 obj_07)
    (pred_4 obj_12 obj_11)
    (pred_4 obj_07 obj_06)
    (pred_4 obj_06 obj_13)
    (pred_4 obj_13 obj_12)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_01)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
