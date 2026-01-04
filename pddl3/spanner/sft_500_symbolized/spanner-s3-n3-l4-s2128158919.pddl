; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2128158919 --problem-name spanner-s3-n3-l4-s2128158919
(define (problem spanner-s3-n3-l4-s2128158919)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_05 obj_04 obj_10 - type_1
     obj_06 obj_13 obj_01 - type_4
     obj_11 obj_09 obj_07 obj_02 - type_5
     obj_12 obj_08 - type_5
    )
 (:init 
    (pred_5 obj_03 obj_12)
    (pred_5 obj_05 obj_11)
    (pred_4 obj_05)
    (pred_5 obj_04 obj_11)
    (pred_4 obj_04)
    (pred_5 obj_10 obj_07)
    (pred_4 obj_10)
    (pred_2 obj_06)
    (pred_5 obj_06 obj_08)
    (pred_2 obj_13)
    (pred_5 obj_13 obj_08)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_08)
    (pred_6 obj_12 obj_11)
    (pred_6 obj_02 obj_08)
    (pred_6 obj_11 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_07 obj_02)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_13)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_13))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
