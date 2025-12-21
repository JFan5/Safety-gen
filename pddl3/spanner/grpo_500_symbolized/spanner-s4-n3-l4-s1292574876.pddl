; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1292574876 --problem-name spanner-s4-n3-l4-s1292574876
(define (problem spanner-s4-n3-l4-s1292574876)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_05 obj_12 obj_06 obj_03 - type_3
     obj_14 obj_13 obj_09 - type_1
     obj_11 obj_08 obj_02 obj_04 - type_2
     obj_10 obj_07 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_10)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_6 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_6 obj_06 obj_08)
    (pred_5 obj_06)
    (pred_6 obj_03 obj_02)
    (pred_5 obj_03)
    (pred_4 obj_14)
    (pred_6 obj_14 obj_07)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_07)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_3 obj_10 obj_11)
    (pred_3 obj_04 obj_07)
    (pred_3 obj_11 obj_08)
    (pred_3 obj_08 obj_02)
    (pred_3 obj_02 obj_04)
)
 (:goal
  (and
   (pred_1 obj_14)
   (pred_1 obj_13)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_14)) (not (pred_1 obj_13))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
