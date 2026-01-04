; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1292574876 --problem-name spanner-s4-n3-l4-s1292574876
(define (problem spanner-s4-n3-l4-s1292574876)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_12 obj_05 obj_02 obj_10 - type_2
     obj_08 obj_14 obj_06 - type_4
     obj_01 obj_11 obj_03 obj_09 - type_5
     obj_07 obj_13 - type_5
    )
 (:init 
    (pred_1 obj_04 obj_07)
    (pred_1 obj_12 obj_11)
    (pred_2 obj_12)
    (pred_1 obj_05 obj_09)
    (pred_2 obj_05)
    (pred_1 obj_02 obj_11)
    (pred_2 obj_02)
    (pred_1 obj_10 obj_03)
    (pred_2 obj_10)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_13)
    (pred_4 obj_14)
    (pred_1 obj_14 obj_13)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_13)
    (pred_6 obj_07 obj_01)
    (pred_6 obj_09 obj_13)
    (pred_6 obj_01 obj_11)
    (pred_6 obj_11 obj_03)
    (pred_6 obj_03 obj_09)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_14)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_14))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
