; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1292574876 --problem-name spanner-s4-n3-l4-s1292574876
(define (problem spanner-s4-n3-l4-s1292574876)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_14 obj_04 obj_08 obj_09 - type_4
     obj_06 obj_11 obj_05 - type_2
     obj_13 obj_10 obj_02 obj_01 - type_3
     obj_03 obj_12 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_03)
    (pred_3 obj_14 obj_10)
    (pred_4 obj_14)
    (pred_3 obj_04 obj_01)
    (pred_4 obj_04)
    (pred_3 obj_08 obj_10)
    (pred_4 obj_08)
    (pred_3 obj_09 obj_02)
    (pred_4 obj_09)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_12)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_12)
    (pred_6 obj_05)
    (pred_3 obj_05 obj_12)
    (pred_1 obj_03 obj_13)
    (pred_1 obj_01 obj_12)
    (pred_1 obj_13 obj_10)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_02 obj_01)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_11)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
