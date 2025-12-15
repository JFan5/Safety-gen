; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 384636587 --problem-name spanner-s3-n3-l4-s384636587
(define (problem spanner-s3-n3-l4-s384636587)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_07 obj_11 obj_10 - type_3
     obj_01 obj_08 obj_12 - type_4
     obj_02 obj_09 obj_04 obj_13 - type_5
     obj_05 obj_06 - type_5
    )
 (:init 
    (pred_5 obj_03 obj_05)
    (pred_5 obj_07 obj_09)
    (pred_6 obj_07)
    (pred_5 obj_11 obj_13)
    (pred_6 obj_11)
    (pred_5 obj_10 obj_04)
    (pred_6 obj_10)
    (pred_4 obj_01)
    (pred_5 obj_01 obj_06)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_06)
    (pred_4 obj_12)
    (pred_5 obj_12 obj_06)
    (pred_2 obj_05 obj_02)
    (pred_2 obj_13 obj_06)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_09 obj_04)
    (pred_2 obj_04 obj_13)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_08)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_05)))
  )
)
)
