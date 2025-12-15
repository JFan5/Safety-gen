; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2128158919 --problem-name spanner-s3-n3-l4-s2128158919
(define (problem spanner-s3-n3-l4-s2128158919)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_11 obj_02 obj_12 - type_3
     obj_07 obj_06 obj_08 - type_1
     obj_01 obj_03 obj_05 obj_13 - type_5
     obj_10 obj_04 - type_5
    )
 (:init 
    (pred_3 obj_09 obj_10)
    (pred_3 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_3 obj_02 obj_01)
    (pred_1 obj_02)
    (pred_3 obj_12 obj_05)
    (pred_1 obj_12)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_04)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_6 obj_10 obj_01)
    (pred_6 obj_13 obj_04)
    (pred_6 obj_01 obj_03)
    (pred_6 obj_03 obj_05)
    (pred_6 obj_05 obj_13)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_06)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
