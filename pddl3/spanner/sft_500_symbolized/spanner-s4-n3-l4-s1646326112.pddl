; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1646326112 --problem-name spanner-s4-n3-l4-s1646326112
(define (problem spanner-s4-n3-l4-s1646326112)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_02 obj_01 obj_07 obj_06 - type_2
     obj_08 obj_09 obj_12 - type_3
     obj_10 obj_13 obj_11 obj_03 - type_4
     obj_14 obj_04 - type_4
    )
 (:init 
    (pred_2 obj_05 obj_14)
    (pred_2 obj_02 obj_11)
    (pred_3 obj_02)
    (pred_2 obj_01 obj_11)
    (pred_3 obj_01)
    (pred_2 obj_07 obj_13)
    (pred_3 obj_07)
    (pred_2 obj_06 obj_11)
    (pred_3 obj_06)
    (pred_1 obj_08)
    (pred_2 obj_08 obj_04)
    (pred_1 obj_09)
    (pred_2 obj_09 obj_04)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_04)
    (pred_5 obj_14 obj_10)
    (pred_5 obj_03 obj_04)
    (pred_5 obj_10 obj_13)
    (pred_5 obj_13 obj_11)
    (pred_5 obj_11 obj_03)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_09)
   (pred_6 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_14)))
  )
)
)
